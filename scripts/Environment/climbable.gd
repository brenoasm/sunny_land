extends Area2D
class_name Climbable

@export var limit_area: Area2D

var upper_limit_reached = false

func _ready() -> void:
	limit_area.body_entered.connect(_on_body_entered)
	limit_area.body_exited.connect(_on_body_exited)
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		upper_limit_reached = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		upper_limit_reached = false

func can_climb_up() -> bool:
	return not upper_limit_reached
