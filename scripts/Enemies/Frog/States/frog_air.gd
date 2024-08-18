extends FrogState
class_name FrogAir

var is_on_floor = false
var is_jumping = true

func physics_update(delta: float) -> void:
	super(delta)
	
	frog.move_and_slide()
	
	is_on_floor = frog.is_on_floor()
	
	if is_on_floor:
		finished.emit(IDLE, {})
		
		return
	
	if frog.velocity.y > 0 and is_jumping:
		finished.emit(FALLING, {})
		
		return
		
	if not is_on_floor:
		frog.apply_y_velocity(frog.velocity.y + frog.gravity * delta)
		
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	is_jumping = state_machine.current_state.name == JUMPING
