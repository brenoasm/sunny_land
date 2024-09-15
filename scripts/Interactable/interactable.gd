extends Area2D
class_name Interactable

@export var enable_log = false
@export var interact_delay: float = 1

var interact_timer: float = 0
var can_be_interacted = true

func _physics_process(delta: float) -> void:
	if interact_timer <= 0:
		can_be_interacted = true
		
		return
		
	interact_timer -= delta

func interact() -> void:
	if enable_log:
		print("Intercting with ", name)
		
	interact_timer = interact_delay
	can_be_interacted = false
	
func can_interact() -> bool:
	return can_be_interacted
