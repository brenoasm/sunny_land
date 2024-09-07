extends SpawnPoint
class_name CollectableSpawnPoint

signal collected(collectable: Collectable)

@export var collectable_scene: PackedScene
@export var already_collected = false

var spawned_collectable: Collectable = null

func spawn(get_target_position: Callable) -> void:
	if already_collected: return
	
	spawned_collectable = collectable_scene.instantiate() as Collectable
	
	add_child(spawned_collectable)
	
	spawned_collectable.collected.connect(_on_collected)
	
func destroy(reset_timer: bool = true) -> void:
	super(reset_timer)
	
	if spawned_collectable != null:
		spawned_collectable.queue_free()
		spawned_collectable = null
	
func _on_collected() -> void:
	already_collected = true
	
	collected.emit(spawned_collectable)
	
	destroy()

func get_spawned_object() -> Node2D:
	return spawned_collectable

func has_spawn() -> bool:
	return get_spawned_object() != null
