extends FrogState
class_name FrogIdle

func physics_update(delta: float) -> void:
	super(delta)
	
	if frog.disabled:
		return
	
	frog.apply_x_velocity(0)
	frog.move_and_slide()
	
	timer -= delta
	
	if timer <= 0:
		finished.emit(JUMPING, {})
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	timer = frog.jump_delay
	
	frog.animation_player.playIdleAnimation()
