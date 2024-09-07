extends SpawnPoint
class_name EnemySpawnPoint

@export var enemy_scene: PackedScene
@export var once: bool = false

var enemy_killed = false
var spawned_enemy: Enemy = null

func spawn(get_target_position: Callable) -> void:
	if once and enemy_killed: return
	
	enemy_killed = false
	spawned_enemy = enemy_scene.instantiate() as Enemy
	spawned_enemy.ready.connect(func(): spawned_enemy.setup(get_target_position))
	spawned_enemy.died.connect(_on_enemy_died)
	
	add_child(spawned_enemy)
	
func destroy(reset_timer: bool = true) -> void:
	super(reset_timer)
	
	if not enemy_killed:
		spawn_timer = 0
	
	if spawned_enemy != null:
		spawned_enemy.queue_free()
		spawned_enemy = null
	
func _on_enemy_died() -> void:
	enemy_killed = true
	
	destroy()

func get_spawned_object() -> Node2D:
	return spawned_enemy

func has_spawn() -> bool:
	return get_spawned_object() != null
