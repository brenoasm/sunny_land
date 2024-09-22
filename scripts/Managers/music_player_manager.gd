extends AudioStreamPlayer
class_name MusicPlayerManager

@export var game_state_manager: GameStateManager
@export var background_music: AudioStream
@export var lost_music: AudioStream
@export var victory_music: AudioStream

func _ready() -> void:
	game_state_manager.game_state_changed.connect(_on_game_state_changed)
	
	stream = background_music
	play()

func _on_game_state_changed(game_state: GameStateManager.GameState):
	stop()
	
	match game_state: 
		GameStateManager.GameState.GAME_OVER:
			stream = lost_music
		GameStateManager.GameState.LEVEL_WIN:
			stream = victory_music
		
	play()

func _on_finished() -> void:
	if game_state_manager.current_game_state == GameStateManager.GameState.LEVEL_WIN:
		game_state_manager.level_win()
		
		return
		
	stream = background_music
	play()
