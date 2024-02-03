# godot-rpg
Sample project based on tutorial: https://dev.to/christinec_dev/lets-learn-godot-4-by-making-an-rpg-part-1-project-overview-setup-bgc

## Steps

1.	Project Setup
	- Upload assets
	- Create main.tscn (Scenes/)
2.	Player scene
	- CharacterBody2D
	  - CollisionShape2D: Capsule
	  - AnimatedSprite2D: Animation/SpriteFrames
    Add animations (AnimatedSprite2D)
    Add gui (health and stamina bar)


## Notes

Sprite2D => static object: no movement or animations
AnimatedSprited2D => dynamic object

_process(delta): graphical, need to respond quickly
_physics_process(delta): physics-based, need to happen at consistent predictable rate

Add sprint to _physics_processing: track stamina values at constant rate
Add attack to _input(event) func => captured, not tracked
- Add inputs using _input() or Input (Singleton class)
- Only fired once
- _input() => is_action_pressed() and is_action_released()
- ie. pause game or shoot gun
- Use singleton class if state of actions to be stored throughout game loop ie. possible to press two buttons simultaneously
- Can be called in any other method
- Input (Singleton class) => is_action_just_pressed() and is_action_just_released()

```python
func doSth(x : int = 1, y := 2) -> void:
    var direction : int
    pass

enum Swag(GOLD_RING, DIAMOND, SILVER)
var swag : Swag
```
_Lookup enums, move-and-slide vs move-and-collide_

**Initial code for CharacterBody2D-attached script**
```python
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_processing(delta):
    # Add gravity
    if not is_on_floor():
        velocity.y += gravity * delta

    # Handle jump
    if Input.is_action_just_pressed("ui_accept") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    # Get input direction and handle movement/deceleration
    ## Replace UI actions with custom gameplay actions
    var direction = Input.get_axis("ui_left", "ui_right")
    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()
```

## Known Bugs
- If player in side: shoot enters infinite loop