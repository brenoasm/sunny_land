extends PlayerAir
class_name PlayerJumping

func physics_update(delta: float) -> void:
	super(delta)
	
	player.move_and_slide()
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.playJumpingAnimation()
	
	player.input.apply_y_velocity(player.jump_velocity)
	
