extends FrogAir
class_name FrogFalling
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	frog.animation_player.play("Falling")
