extends PlayerGrounded
class_name PlayerDying

func physics_update(delta: float) -> void:
	super(delta)
	
	player.move_and_slide()
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	player.animation_player.play_dying_animation()
	player.sound_effects.play_hurt_sound()
	
	player.input.apply_y_velocity(player.died_jump_velocity)
	player.input.apply_x_velocity(0)
