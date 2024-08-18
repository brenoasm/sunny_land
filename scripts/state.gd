extends Node

class_name State

@warning_ignore("unused_signal")
signal finished(next_state: String, data: Dictionary)

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
	
func enter(previous_state: String, data: Dictionary) -> void:
	pass
	
func exit() -> void:
	pass
