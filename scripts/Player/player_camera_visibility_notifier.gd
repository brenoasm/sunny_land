extends VisibleOnScreenNotifier2D
class_name PlayerCameraVisibilityNotifier

var player: Player

func _ready() -> void:
	assert(owner is Player, "This node must be used inside a Player")
	
	player = owner

func _on_screen_exited() -> void:	
	player.finished_dying.emit()
