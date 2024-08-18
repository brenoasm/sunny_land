extends FrogAir
class_name FrogJumping
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	frog.animation_player.play("Jumping")
	
	frog.apply_y_velocity(frog.jump_velocity)
