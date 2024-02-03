extends ColorRect

@onready var value = $Value

func update_health_ui(health, max_health):
	value.size.x = 98 * health / max_health
