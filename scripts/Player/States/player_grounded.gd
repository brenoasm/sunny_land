extends PlayerState
class_name PlayerGrounded

func physics_update(delta: float) -> void:
	super(delta)
	
	if not player.is_on_floor():
		return
		
	var interactable = player.interact_area.interactable
	
	if interactable != null and interactable.can_interact() and player.input.is_pressing_interact():
		interactable.interact()
		
		return
		
	if player.input.is_pressing_up() and player.climbable_area.can_climb:
		finished.emit(CLIMBING, {
			'delay_check': true
		})
		
		return
		
	if player.input.is_pressing_jump():
		finished.emit(JUMPING, {
			'delay_check': true
		})
		
		return
		
	if player.input.is_pressing_down():
		finished.emit(CROUCHING, {})
		
		return
