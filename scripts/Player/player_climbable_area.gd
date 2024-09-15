extends Area2D
class_name PlayerClimbableArea

var can_climb_up_callable: Callable
var can_climb = false

func _on_area_entered(climbable: Climbable) -> void:
	can_climb = true
	can_climb_up_callable = climbable.can_climb_up

func _on_area_exited(climbable: Climbable) -> void:
	can_climb = false
	can_climb_up_callable = func(): return false

func can_climb_up() -> bool:
	var result: bool = can_climb_up_callable.call()
	
	return result
