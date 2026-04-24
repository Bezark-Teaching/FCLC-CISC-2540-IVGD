shader_type canvas_item;
render_mode unshaded;

// Full-screen post-process: reads the already-rendered frame. :contentReference[oaicite:1]{index=1}
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

// --- Color controls ---
uniform float brightness : hint_range(0.0, 2.0) = 1.02;
uniform float contrast   : hint_range(0.0, 2.0) = 1.08;
uniform float saturation : hint_range(0.0, 2.0) = 1.10;
uniform float gamma      : hint_range(0.2, 3.0) = 1.05;

// --- CRT geometry / lens ---
uniform float curvature     : hint_range(0.0, 0.40) = 0.14;
uniform float corner_soften : hint_range(0.0, 0.20) = 0.06;
uniform float vignette      : hint_range(0.0, 1.00) = 0.38;

// --- Scanlines / phosphor ---
uniform float scanline_strength : hint_range(0.0, 2.0) = 0.95;
uniform float scanline_density  : hint_range(0.5, 3.0) = 1.15; // 1.0 = native-ish
uniform float interlace_strength: hint_range(0.0, 1.0) = 0.20;

// Shadow mask (RGB triads). Turn down if you hate the “screen door”.
uniform float mask_strength : hint_range(0.0, 1.0) = 0.22;
uniform float mask_scale    : hint_range(0.5, 4.0) = 1.0; // bigger = chunkier triads

// --- VHS/VCR artifacts ---
uniform float chroma_offset_px : hint_range(0.0, 6.0) = 1.6; // RGB split in pixels
uniform float luma_smear_px    : hint_range(0.0, 8.0) = 2.2; // horizontal smear
uniform float jitter_px        : hint_range(0.0, 8.0) = 1.8; // per-line horizontal jitter
uniform float wobble_px        : hint_range(0.0, 10.0) = 1.5; // slow wave wobble

uniform float tape_noise       : hint_range(0.0, 1.0) = 0.22; // grain + specks
uniform float tape_lines       : hint_range(0.0, 1.0) = 0.35; // horizontal “tracking” lines

uniform float roll_speed       : hint_range(0.0, 1.5) = 0.10; // vertical roll bar speed
uniform float roll_strength    : hint_range(0.0, 0.6) = 0.15; // roll bar intensity

// --- Bloom-ish glow (cheap) ---
uniform float glow_strength  : hint_range(0.0, 2.0) = 0.25;
uniform float glow_threshold : hint_range(0.0, 1.0) = 0.65;

// TIME is a built-in global in CanvasItem shaders. :contentReference[oaicite:2]{index=2}
float hash11(float n) {
	return fract(sin(n) * 43758.5453123);
}

float hash12(vec2 p) {
	return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

vec2 crt_curve(vec2 uv, float k) {
	// Barrel distortion style curve.
	vec2 cc = uv * 2.0 - 1.0;
	vec2 d  = cc * cc;
	cc *= 1.0 + k * vec2(d.y, d.x);
	return cc * 0.5 + 0.5;
}

float inside01(vec2 uv) {
	// 1.0 if uv in [0..1], else 0.0
	return step(0.0, uv.x) * step(uv.x, 1.0) * step(0.0, uv.y) * step(uv.y, 1.0);
}

vec3 apply_color_controls(vec3 c) {
	// brightness
	c *= brightness;

	// contrast around 0.5
	c = mix(vec3(0.5), c, contrast);

	// saturation
	float l = dot(c, vec3(0.2126, 0.7152, 0.0722));
	c = mix(vec3(l), c, saturation);

	// gamma-ish
	c = pow(max(c, vec3(0.0)), vec3(1.0 / max(gamma, 0.0001)));
	return c;
}

vec3 triad_mask(vec2 frag_xy) {
	// Simple RGB triad mask across X.
	float x = floor(frag_xy.x / max(mask_scale, 0.0001));
	float m = mod(x, 3.0);
	// Slightly tinted triads
	if (m < 1.0) return vec3(1.10, 0.85, 0.85);
	if (m < 2.0) return vec3(0.85, 1.10, 0.85);
	return vec3(0.85, 0.85, 1.10);
}

vec3 sample_screen(vec2 uv) {
	// Use textureLod at LOD 0 like the docs show. :contentReference[oaicite:3]{index=3}
	return textureLod(screen_texture, uv, 0.0).rgb;
}

void fragment() {
	vec2 px   = SCREEN_PIXEL_SIZE;
	vec2 res  = 1.0 / px;
	float t   = TIME;

	// Start from screen UV
	vec2 uv = SCREEN_UV;

	// --- VHS line jitter (per scanline) ---
	float y_line = floor(uv.y * res.y);
	float jitter = (hash11(y_line + floor(t * 15.0) * 37.0) - 0.5) * 2.0;
	uv.x += jitter * (jitter_px * px.x);

	// Slow wobble
	uv.x += sin(uv.y * 8.0 + t * 1.2) * (wobble_px * px.x);

	// CRT curve
	vec2 cuv = crt_curve(uv, curvature);
	float in_bounds = inside01(cuv);

	// Rounded corners (soft clip)
vec2 d = abs(cuv - 0.5) * 2.0;      // 0 at center, ~1 at edges
float edge = max(d.x, d.y);

// 1 in center, fades to 0 near edges
float corner_mask = 1.0 - smoothstep(1.0 - corner_soften, 1.0, edge);


	// --- Chromatic aberration / VHS chroma shift ---
	vec2 chroma = vec2(chroma_offset_px * px.x, 0.0);
	float r = sample_screen(cuv + chroma).r;
	float g = sample_screen(cuv).g;
	float b = sample_screen(cuv - chroma).b;
	vec3 col = vec3(r, g, b);

	// --- Luma smear (horizontal) ---
	float smear = luma_smear_px * px.x;
	vec3 s1 = sample_screen(cuv + vec2(smear, 0.0));
	vec3 s2 = sample_screen(cuv - vec2(smear, 0.0));
	col = mix(col, (col + s1 + s2) / 3.0, 0.35);

	// --- Scanlines ---
	float scan = sin((cuv.y * res.y) * 3.14159 * scanline_density);
	float scan_mul = 1.0 - scanline_strength * (0.5 - 0.5 * scan); // darker troughs
	col *= scan_mul;

	// --- Interlacing (alternate rows “flicker”) ---
	float field = mod(floor(FRAGCOORD.y) + floor(t * 60.0), 2.0);
	col *= 1.0 - interlace_strength * field * 0.10;

	// --- Rolling tracking bar ---
	float roll_y = fract(t * max(roll_speed, 0.0001));
	float dist = abs(cuv.y - roll_y);
	float bar = smoothstep(0.20, 0.0, dist); // wide soft bar
	col += bar * roll_strength * vec3(0.12, 0.12, 0.12);

	// --- Tape lines (random horizontal streaks) ---
	float line_n = hash11(y_line * 0.7 + floor(t * 12.0) * 11.0);
	float line = smoothstep(0.985, 1.0, line_n) * tape_lines;
	col += line * vec3(0.18, 0.18, 0.18);

	// --- Grain / specks ---
	float n = hash12(FRAGCOORD.xy + vec2(t * 120.0, t * 90.0));
	float grain = (n - 0.5) * 2.0;
	col += grain * (tape_noise * 0.06);

	// Occasional white specks
	float speck = smoothstep(0.995, 1.0, hash12(FRAGCOORD.xy * 0.73 + t * 40.0));
	col += speck * (tape_noise * 0.25);

	// --- Cheap glow (cross blur on brights) ---
	vec3 c0 = col;
	vec3 cx1 = sample_screen(cuv + vec2(px.x, 0.0));
	vec3 cx2 = sample_screen(cuv - vec2(px.x, 0.0));
	vec3 cy1 = sample_screen(cuv + vec2(0.0, px.y));
	vec3 cy2 = sample_screen(cuv - vec2(0.0, px.y));
	vec3 blur = (c0 + cx1 + cx2 + cy1 + cy2) / 5.0;
	float br = dot(blur, vec3(0.2126, 0.7152, 0.0722));
	vec3 glow = max(blur - vec3(glow_threshold), vec3(0.0));
	col += glow * glow_strength * (0.5 + 0.5 * br);

	// --- Vignette ---
	vec2 v = cuv - 0.5;
	float vig = smoothstep(0.9, 0.2, dot(v, v) * 2.2);
	col *= mix(1.0 - vignette, 1.0, vig);

	// --- Shadow mask triads ---
	vec3 mask = triad_mask(FRAGCOORD.xy);
	col *= mix(vec3(1.0), mask, mask_strength);

	// Color grading last
	col = apply_color_controls(col);

	// Apply bounds + rounded corners (outside = black)
	col *= in_bounds * corner_mask;

	COLOR = vec4(col, 1.0);
}
