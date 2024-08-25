extends CollisionShape2D
class_name PlayerCollision

@onready var player: Player = $".."

@export var enableLog = false

const ENEMY_COLLISION_LAYER = 2

func enable_enemy_collision() -> void:
	player.set_collision_mask_value(ENEMY_COLLISION_LAYER, true)
	
	if enableLog:
		print("Player and Enemy collision enabled")
	
func disable_enemy_collision() -> void:
	player.set_collision_mask_value(ENEMY_COLLISION_LAYER, false)
	
	if enableLog:
		print("Player and Enemy collision disabled")
