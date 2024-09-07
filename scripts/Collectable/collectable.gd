extends Area2D
class_name Collectable

const COLLECTING = "Collecting"

signal collected()

@export var animation_player: AnimatedSprite2D

var can_be_collected = true
	
func collect() -> void:
	monitorable = false
	can_be_collected = false
	animation_player.play(COLLECTING)
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished() -> void:
	collected.emit()
