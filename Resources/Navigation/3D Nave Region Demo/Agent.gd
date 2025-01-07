extends CSGSphere3D

@onready var navigation_agent_3d = $NavigationAgent3D
@onready var marker_3d = $"../Marker3D"

# Called when the node enters the scene tree for the first time.
func _ready():
	navigation_agent_3d.target_position = marker_3d.position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = navigation_agent_3d.get_next_path_position()
	pass
