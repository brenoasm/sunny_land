extends Interactable
class_name Crank

signal active()
signal inactive()

@export var active_sprite: Texture2D
@export var inactive_sprite: Texture2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var current_state: bool = false

func interact() -> void:
	super()
	
	toggle()

func toggle() -> void:
	current_state = !current_state
	
	audio_stream_player.play()
	
	if current_state:
		sprite_2d.texture = active_sprite
		active.emit()
	else:
		sprite_2d.texture = inactive_sprite
		inactive.emit()
	
	
