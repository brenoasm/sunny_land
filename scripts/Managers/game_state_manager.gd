extends Node
class_name GameStateManager

signal game_state_changed(game_state: GameState)

@export var player: Player 
@export var restart_delay = .7
@export var next_level: PackedScene

enum GameState {
	PLAYING,
	GAME_OVER,
	LEVEL_WIN
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
	
func win_level() -> void:
	current_game_state = GameState.LEVEL_WIN
	
	game_state_changed.emit(current_game_state)

func level_win() -> void:
	GameManager.win_level(next_level)
