extends PlayerGrounded
class_name PlayerMoving

func physics_update(delta: float) -> void:
	super(delta)
	
	if player.direction_x:
		player.apply_x_velocity(player.direction_x * player.movement_speed)
		player.move_and_slide()
	else:
		finished.emit(IDLE, {})
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.playMovingAnimation()
