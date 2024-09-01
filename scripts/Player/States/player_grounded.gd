extends PlayerState
class_name PlayerGrounded

func physics_update(delta: float) -> void:
	super(delta)
		
	if player.input.is_pressing_jump() && player.is_on_floor():
		finished.emit(JUMPING, {})
		
		return
