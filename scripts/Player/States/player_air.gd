extends PlayerState
class_name PlayerAir

var is_on_floor = false

func physics_update(delta: float) -> void:
	super(delta)
	
	is_on_floor = player.is_on_floor()
	
	if is_on_floor and is_on_floor:
		finished.emit(MOVING, {})
		
		return
		
	if player.input.direction_x:
		player.input.apply_x_velocity(player.input.direction_x * player.jump_movement_speed)
		
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
