# Extra Credit Lab : Core Game Systems
**Focus**: Health, Damage, and Respawn Systems
**Points**: 7

## Overview
Build fundamental game systems that work together: health tracking, damage dealing, and respawn mechanics. Focus on creating clear player feedback that helps players understand how these systems interact and affect each other.

## Learning Objectives
- Implement core game systems that communicate effectively
- Create visual and audio feedback that teaches players about system relationships
- Practice organizing code for systems that need to work together
- Build reusable components that could work in other games

## Requirements

### Core Systems Implementation
Build a 2D scene with these interconnected systems:

**Health System**
- Player character with health tracking
- Visual health display (health bar, hearts, or other clear indicator)
- Damage feedback (screen flash, character animation, sound effects)
- Death state handling

**Hazard System**
- At least 3 different types of hazards:
  - Static hazards (spikes, fire, poison areas)
  - Moving hazards (patrolling enemies, falling objects)
  - Triggered hazards (traps activated by player movement)
- Each hazard type should feel different and deal damage differently

**Respawn System**
- Checkpoint system or respawn points
- Save/restore player position and health state
- Clear visual indication of checkpoints
- Smooth transition between death and respawn

### System Feedback & Polish
**Visual Feedback**
- Players should immediately understand when they take damage
- Health state should be always visible and clear
- Checkpoint activation should be obvious
- Hazard danger zones should be visually distinct

**Audio Feedback**
- Damage sounds that match the hazard type
- Health/healing audio cues
- Checkpoint activation sounds
- Death/respawn audio feedback

**System Clarity**
- Players should understand cause and effect (what hurt them and why)
- Health loss should feel fair and understandable
- Respawn system should feel helpful, not punishing

## Technical Requirements

**Code Organization**
- Use signals to connect systems (damage dealer signals to health system)
- Separate components that could be reused (health component usable on enemies too)
- Clear, commented code showing how systems communicate
- Avoid tightly coupled code - systems should work independently

**Godot Best Practices**
- Use appropriate node types (Area2D for damage zones, etc.)
- Proper collision detection and response
- Clean scene organization
- Efficient signal connections

## Grading Criteria (7 Points Total)

**System Implementation (4 points)**
- 4: All three systems work reliably with clean code organization
- 3: Systems mostly work with minor issues or code organization problems
- 2: Systems functional but with some bugs or poor organization
- 1: Systems partially working with significant issues
- 0: Systems don't function properly or are incomplete

**Player Feedback & Polish (3 points)**
- 3: Excellent feedback that clearly teaches players how systems work
- 2: Good feedback with most interactions clear to players
- 1: Basic feedback present but could be clearer or some interactions unclear
- 0: Poor or missing feedback, players can't understand systems

## Deliverables
- GitHub repository with complete Godot project
- README.md explaining your system design choices
- Well-commented code showing system interactions
- Repository link submitted via course management system

**AI ASSISTED PROJECTS WILL NOT RECIEVE ANY EXTRA CREDIT!**

## Example System Interactions
Think about how your systems should work together:
- Taking damage → health decreases → visual feedback → possible death
- Reaching checkpoint → position saved → visual confirmation → respawn point updated
- Different hazards → different damage amounts → different feedback
- Death → respawn at last checkpoint → health restored → clear transition

## Tips for Success
- Start simple - get basic damage working before adding complexity
- Test your feedback - can someone else understand your systems immediately?
- Use signals to keep systems separate but communicating
- Focus on player understanding over flashy effects
- Think about edge cases: taking damage while already damaged, rapid checkpoint activation
- Make sure your systems feel good to interact with, not just functional

## Resources
- [Godot Signals Documentation](https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html)
- [CharacterBody2D for player movement](https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html)
- [Area2D for damage zones](https://docs.godotengine.org/en/stable/classes/class_area2d.html)

*This lab establishes the foundation for more complex game systems by ensuring you can build reliable, communicating core systems with clear player feedback.*
