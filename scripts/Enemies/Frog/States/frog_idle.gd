extends FrogState
class_name FrogIdle

func physics_update(delta: float) -> void:
	super(delta)
	#
	#frog.apply_x_velocity(0)
	#frog.move_and_slide()
	
	timer -= delta
	
	if timer <= 0:
		finished.emit(JUMPING, {})
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	timer = 5
	
	frog.animation_player.play("Idle")
	
	frog.apply_x_velocity(0)
	frog.move_and_slide()
