extends PlayerAir
class_name PlayerClimbing

const ANIMATION_DELAY = 0.1

func physics_update(delta: float) -> void:
	super(delta)
	
	timer -= delta
	
	if player.input.is_pressing_jump():
		finished.emit(JUMPING, {})
		
		return
		
	var action_pressed = false
	var climb_y_speed = 0
	
	if player.climbable_area.can_climb_up() and player.input.is_pressing_up():
		climb_y_speed = -player.climb_speed
		action_pressed = true
	elif player.input.is_pressing_down():
		climb_y_speed = player.climb_speed
		action_pressed = true
		
	if action_pressed:
		player.translate(Vector2(0, climb_y_speed))
		player.move_and_slide()
		
		if timer <= 0:
			player.animation_player.play_climbing_animation()
			timer = ANIMATION_DELAY
		
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.input.disable_movement()
	apply_gravity = false
	
func exit() -> void:
	super()
	
	player.input.enable_movement()
	
