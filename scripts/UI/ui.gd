extends CanvasLayer
class_name ScoreUI

@export var player: Player

@onready var gem_count: ItemCount = $GemCount

func _ready() -> void:
	player.collected.connect(_on_collectable)

func _on_collectable(collectable: Collectable) -> void:
	if collectable is Gem:
		gem_count.increment_count()
