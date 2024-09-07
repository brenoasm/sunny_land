extends FrogAir
class_name FrogJumping
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	var jump_direction : int = frog.get_target_direction()
	
	frog.flip(jump_direction)
	frog.animation_player.playJumpingAnimation()
	
	frog.apply_y_velocity(frog.jump_velocity)
	frog.apply_x_velocity(jump_direction * frog.movement_speed)
	
	
