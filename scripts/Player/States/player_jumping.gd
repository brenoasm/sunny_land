extends PlayerAir
class_name PlayerJumping
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.play("Jumping")
	
	player.apply_y_velocity(player.jump_velocity)
	
