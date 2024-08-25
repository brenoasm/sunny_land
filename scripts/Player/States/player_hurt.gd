extends PlayerGrounded
class_name PlayerHurt

var collision_x: float = 1

func physics_update(delta: float) -> void:
	timer -= delta
	
	if timer <= 0 and player.is_on_floor():
		finished.emit(MOVING, {})
		return
		
	player.apply_x_velocity(collision_x * player.hurt_recoil_speed)
	player.apply_y_velocity(player.jump_movement_speed)
	
	player.move_and_slide()
	
	super(delta)
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.playHurtAnimation()
	player.animation_player.applyAlpha(.6)
	player.player_collision.disable_enemy_collision()
	
	timer = player.invencibilityDuration
	
	player.input_enabled = false
	
	var collision_normal: Vector2 = data["collision_normal"]
	
	collision_x = collision_normal.x
	
func exit() -> void:
	player.animation_player.applyAlpha(1)
	player.player_collision.enable_enemy_collision()
	
	player.input_enabled = true
