extends PlayerState
class_name PlayerAir

var is_jumping = true
var is_on_floor = false

func physics_update(delta: float) -> void:
	super(delta)
	
	player.move_and_slide()
	
	is_on_floor = player.is_on_floor()
	
	if is_on_floor:
		finished.emit(MOVING, {})
		
		return
	
	if player.velocity.y > 0 and is_jumping:
		finished.emit(FALLING, {})
		
		return
	
	if not is_on_floor:
		player.apply_y_velocity(player.velocity.y + player.gravity * delta)
		
	if player.direction_x:
		player.apply_x_velocity(player.direction_x * player.jump_movement_speed)
		
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	is_jumping = state_machine.current_state.name == JUMPING
	
