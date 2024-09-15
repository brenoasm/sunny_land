extends AudioStreamPlayer
class_name PlayerSoundEffects

@export var jump_sound: Array[AudioStream]
@export var hurt_sound: Array[AudioStream]
@export var collect_sound: Array[AudioStream]

func _ready() -> void:
	stop()

func play_jump_sound() -> void:
	stream = jump_sound[0]
	
	play()
	
func play_enemy_hit_sound() -> void:
	stream = jump_sound[1]
	
	play()
	
func play_hurt_sound() -> void:
	var index = RandomNumberGenerator.new().randi_range(0, hurt_sound.size() - 1)
	
	stream = hurt_sound[index]
	
	play()
	
func play_collect_sound() -> void:
	var index = RandomNumberGenerator.new().randi_range(0, collect_sound.size() - 1)
	
	stream = collect_sound[index]
	
	play()

func _on_finished() -> void:
	stream = null
