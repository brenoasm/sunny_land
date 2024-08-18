extends PlayerState
class_name PlayerGrounded

func physics_update(delta: float) -> void:
	super(delta)
	
	var input_pressed = Input.is_action_just_pressed("ui_accept")
	
	if input_pressed && player.is_on_floor():
		finished.emit(JUMPING, {})
