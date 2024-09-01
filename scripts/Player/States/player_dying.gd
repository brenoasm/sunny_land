extends PlayerGrounded
class_name PlayerDying

func physics_update(delta: float) -> void:
	super(delta)
	
	player.move_and_slide()
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.player_collision.disable_terrain_collision()
	player.player_collision.disable_collectable_collision()
	player.animation_player.playDyingAnimation()
	player.input.apply_y_velocity(player.died_jump_velocity)
	player.input.apply_x_velocity(0)
