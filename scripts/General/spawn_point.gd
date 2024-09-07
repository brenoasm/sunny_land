extends Area2D
class_name SpawnPoint

signal destroyed()

@export var spawn_delay: float = 2

var spawn_timer: float

func _ready() -> void:
	spawn_timer = 0

func _physics_process(delta: float) -> void:
	if spawn_timer <= 0:
		return
		
	spawn_timer -= delta

func spawn(get_target_position: Callable) -> void:
	pass
	
func destroy(reset_timer: bool = true) -> void:
	if reset_timer:
		spawn_timer = spawn_delay
		
	destroyed.emit()
	
func can_spawn() -> bool:
	return spawn_timer <= 0
	
func get_spawned_object() -> Node2D:
	return null
