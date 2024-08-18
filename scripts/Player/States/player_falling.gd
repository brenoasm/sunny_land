extends PlayerAir
class_name PlayerFalling

func physics_update(delta: float) -> void:
	super(delta)
			
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.play("Falling")
