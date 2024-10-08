extends CollisionShape2D
class_name PlayerCollision

@onready var player: Player = $".."
@onready var offensive_area: Area2D = $"../OffensiveArea"
@onready var collectable_area: Area2D = $"../CollectableArea"

@export var enableLog = false

const COLLECTABLE_COLLISION_LAYER = 3
const ENEMY_COLLISION_LAYER = 2
const TERRAIN_COLLISION_LAYER = 1

func _ready() -> void:
	player.game_state_manager.game_state_changed.connect(_on_game_state_changed)

func enable_enemy_collision() -> void:
	offensive_area.set_collision_mask_value(ENEMY_COLLISION_LAYER, true)
	
	if enableLog:
		print("Player to Enemy collision enabled")
	
func disable_enemy_collision() -> void:
	offensive_area.set_collision_mask_value(ENEMY_COLLISION_LAYER, false)
	
	if enableLog:
		print("Player to Enemy collision disabled")

func enable_terrain_collision() -> void:
	player.set_collision_mask_value(TERRAIN_COLLISION_LAYER, true)
	
	if enableLog:
		print("Player to Terrain collision enabled")
	
func disable_terrain_collision() -> void:
	player.set_collision_mask_value(TERRAIN_COLLISION_LAYER, false)
	
	if enableLog:
		print("Player to Terrain collision disabled")
		
func enable_collectable_collision() -> void:
	collectable_area.set_collision_mask_value(COLLECTABLE_COLLISION_LAYER, true)
	
	if enableLog:
		print("Player to Collectable collision enabled")
	
func disable_collectable_collision() -> void:
	collectable_area.set_collision_mask_value(COLLECTABLE_COLLISION_LAYER, false)
	
	if enableLog:
		print("Player to Collectable collision disabled")

func _on_game_state_changed(game_state: GameStateManager.GameState) -> void:
	match game_state:
		GameStateManager.GameState.LEVEL_WIN:
			disable_enemy_collision()
			disable_collectable_collision()
		GameStateManager.GameState.GAME_OVER:
			player.player_collision.disable_terrain_collision()
			player.player_collision.disable_collectable_collision()
