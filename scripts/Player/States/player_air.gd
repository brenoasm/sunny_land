extends PlayerState
class_name PlayerAir

var is_on_floor = false
var floor_check_timer: float = 0

func physics_update(delta: float) -> void:
	super(delta)
	
	floor_check_timer -= delta
	
	is_on_floor = floor_check_timer <= 0 and player.is_on_floor()
	
	if is_on_floor:
		finished.emit(MOVING, {})
		
		return
		
	if player.input.is_pressing_move():
		player.input.apply_x_velocity(player.input.direction_x * player.jump_movement_speed)
		
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	var delay_check = data.get('delay_check')
	
	if delay_check:
		floor_check_timer = player.floor_check_delay
	
