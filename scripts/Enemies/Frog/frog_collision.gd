extends CollisionShape2D
class_name FrogCollision

@onready var frog: Frog = $".."

@export var enableLog = false

const ENEMY_COLLISION_LAYER = 2

func enable_collision() -> void:
	frog.set_collision_mask_value(ENEMY_COLLISION_LAYER, true)
	
	if enableLog:
		print("Enemy collision enabled")
	
func disable_collision() -> void:
	frog.set_collision_mask_value(ENEMY_COLLISION_LAYER, false)
	
	if enableLog:
		print("Enemy collision disabled")
