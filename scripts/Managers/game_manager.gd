extends Node

var current_scene = null

const FOREST_1 = preload("res://scenes/Level/forest_1.tscn")

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(get_child_count()-1)

func restart_scene() -> void:
	get_tree().reload_current_scene()
	
func win_level(scene: PackedScene) -> void:
	call_deferred("deffered_next_level", scene)

func deffered_next_level(scene: PackedScene) -> void:
	current_scene.free()
	
	current_scene = scene.instantiate()
	
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
