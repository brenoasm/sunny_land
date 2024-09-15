extends PlayerGrounded
class_name PlayerIdle

func physics_update(delta: float) -> void:
	super(delta)
	
	if player.input.direction_x:
		finished.emit(MOVING, {})
	else:
		player.input.apply_x_velocity(0)
		player.move_and_slide()
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.play_idle_animation()
