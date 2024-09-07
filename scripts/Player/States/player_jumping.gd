extends PlayerAir
class_name PlayerJumping

func physics_update(delta: float) -> void:
	super(delta)
	
	player.move_and_slide()
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	var enemy_hit = data.get('hit')
	
	player.animation_player.playJumpingAnimation()
	
	if enemy_hit:
		player.sound_effects.play_enemy_hit_sound()
	else:
		player.sound_effects.play_jump_sound()
	
	player.input.apply_y_velocity(player.jump_velocity)
	
