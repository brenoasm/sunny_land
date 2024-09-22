extends Node
class_name FollowTargets

@export var transition_delay: float = 1
@export var speed: float = 90

var targets: Array[Vector2] = []
var current_target_index: int = 0
var target: Vector2
var parent: AnimatableBody2D = null
var reversed: bool = false
var transitioning = false

func _ready() -> void:
	parent = get_parent()
	assert(parent is AnimatableBody2D, "This node must be used inside a AnimatableBody2D")
	
	targets.append(parent.position)
	
	for child: Node2D in get_children():
		targets.append(child.position)
	
	if targets.size() <= 1:
		return
		
	transition()
	
func _physics_process(delta: float) -> void:
	if not transitioning:
		return
	
	if parent.position.distance_to(target) <= 0:
		transitioning = false
		
		transition()
		
		return
		
	parent.position = parent.position.move_toward(target, delta * speed)

func transition() -> void:
	var new_target_index: int = 0
	
	await get_tree().create_timer(transition_delay).timeout
	
	if reversed:
		new_target_index = current_target_index - 1
	else:
		new_target_index = current_target_index + 1
		
	if new_target_index >= targets.size() - 1 and not reversed:
		reversed = true
	elif new_target_index <= 0 and reversed:
		reversed = false
	
	current_target_index = new_target_index
	target = targets[current_target_index]
	transitioning = true
	
