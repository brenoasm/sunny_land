extends Node
class_name GameStateManager

signal game_state_changed(game_state: GameState)

@export var player: Player
@export var restart_delay = .7

enum GameState {
	PLAYING,
	GAME_OVER,
	GAME_WON
}

var current_game_state: GameState = GameState.PLAYING

func _ready() -> void:
	player.died.connect(_on_player_died)
	player.finished_dying.connect(_on_player_finished_dying)
	
func _on_player_died() -> void:
	current_game_state = GameState.GAME_OVER
	
	game_state_changed.emit(current_game_state)
	

func _on_player_finished_dying() -> void:
	await get_tree().create_timer(restart_delay).timeout
	
	GameManager.restart_scene()
