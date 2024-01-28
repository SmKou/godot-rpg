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



## Notes

Sprite2D => static object: no movement or animations
AnimatedSprited2D => dynamic object

_processing(): graphical, need to respond quickly
_physics_processing(): physics-based, need to happen at consistent predictable rate

func doSth(x : int = 1, y := 2) -> void:
Lookup enums, move-and-slide vs move-and-collide