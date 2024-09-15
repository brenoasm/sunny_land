extends PlayerGrounded
class_name PlayerCrouching

func physics_update(delta: float) -> void:
	super(delta)
	
	if not player.input.is_pressing_down():
		finished.emit(IDLE, {})
	
	player.input.apply_x_velocity(0)
	player.move_and_slide()
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.play_crouching_animation()
