extends AnimatedSprite2D
class_name PlayerAnimation

enum PlayerAnimations {
	Falling,
	Jumping,
	Idle,
	Dying,
	Moving,
	Climbing,
	Crouching,
}

var current_animation: PlayerAnimations = PlayerAnimations.Idle
var current_frame = 0
var total_frames = 0

func reset_current_frame() -> void:
	current_frame = 0
	
func play_falling_animation() -> void:
	current_animation = PlayerAnimations.Falling
	play("Falling")
	
func play_jumping_animation() -> void:
	current_animation = PlayerAnimations.Jumping
	play("Jumping")
	
func play_idle_animation() -> void:
	current_animation = PlayerAnimations.Idle
	play("Idle")
	
func play_moving_animation() -> void:
	current_animation = PlayerAnimations.Moving
	play("Moving")
	
func play_dying_animation() -> void:
	current_animation = PlayerAnimations.Dying
	play("Dying")
	
func play_climbing_animation() -> void:
	current_animation = PlayerAnimations.Climbing
	
	animation = "Climbing"
	
	stop()
	
	total_frames = sprite_frames.get_frame_count("Climbing")
	
	var new_frame = current_frame + 1
	
	if new_frame > total_frames:
		new_frame = 0
		
	current_frame = new_frame
	
	frame = current_frame
	
func play_crouching_animation() -> void:
	current_animation = PlayerAnimations.Crouching
	play("Crouching")

func applyAlpha(a: float) -> void:
	self_modulate.a = a

func flip(value: bool) -> void:
	flip_h = value
