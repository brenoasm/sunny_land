extends CollisionShape2D
class_name FrogCollision

@onready var frog: Frog = $".."
@onready var offensive_area: Area2D = $"../OffensiveArea"

@export var enableLog = false

const ENEMY_COLLISION_LAYER = 2
const PLAYER_COLLISION_LAYER = 4

func enable_collision() -> void:
	frog.set_collision_mask_value(ENEMY_COLLISION_LAYER, true)
	
	if enableLog:
		print("Enemy collision enabled")
	
func disable_collision() -> void:
	frog.set_collision_mask_value(ENEMY_COLLISION_LAYER, false)
	frog.disable_mode = CollisionObject2D.DISABLE_MODE_REMOVE
	
	if enableLog:
		print("Enemy collision disabled")
		
func disable_player_collision() -> void:
	offensive_area.set_collision_mask_value(PLAYER_COLLISION_LAYER, false)
