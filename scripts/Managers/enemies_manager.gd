extends Node

@export var player: Player
@export var game_state_manager: GameStateManager

@onready var control_area: Area2D = $ControlArea

func _ready() -> void:
	assert(player != null, "Player must be provided.")
	
	game_state_manager.game_state_changed.connect(_on_game_state_changed)
	control_area.area_entered.connect(_on_spawn_point_entered)
	control_area.area_exited.connect(_on_spawn_point_exited)
	_update_control_area_position()
		
func _physics_process(delta: float) -> void:
	_update_control_area_position()

func _update_control_area_position() -> void:
	var collision_shape: CollisionShape2D = control_area.get_child(0)
	
	var x = collision_shape.position.x
	var y = collision_shape.position.y
	
	control_area.position = Vector2(player.position.x - x, player.position.y - y)

func _on_spawn_point_entered(spawn_point: EnemySpawnPoint) -> void:
	if not spawn_point.can_spawn():
		return
		
	spawn_point.spawn(player.get_position)
		

func _on_spawn_point_exited(spawn_point: EnemySpawnPoint) -> void:
	spawn_point.destroy()

func _on_game_state_changed(game_state: GameStateManager.GameState) -> void:
	match game_state:
		GameStateManager.GameState.GAME_OVER:
			control_area.area_entered.disconnect(_on_spawn_point_entered)
			control_area.area_exited.disconnect(_on_spawn_point_exited)
		GameStateManager.GameState.LEVEL_WIN:
			for child in get_children():
				if child is EnemySpawnPoint and child.spawned_enemy != null:
					child.spawned_enemy.disabled = true
