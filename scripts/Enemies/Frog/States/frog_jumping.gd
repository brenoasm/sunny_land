extends FrogAir
class_name FrogJumping
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	frog.animation_player.playJumpingAnimation()
	
	frog.apply_y_velocity(frog.jump_velocity)
	frog.apply_x_velocity(-1 * frog.movement_speed)
