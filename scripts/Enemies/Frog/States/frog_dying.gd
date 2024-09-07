extends FrogState
class_name FrogDying
	
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	frog.animation_player.animation_finished.connect(_on_animation_finished)
	frog.animation_player.playDyingAnimation()
	
func _on_animation_finished() -> void:
	frog.animation_player.animation_finished.disconnect(_on_animation_finished)
	
	frog.queue_free()
	
	frog.died.emit()
