extends CanvasLayer
class_name ScoreUI

@export var collectables_manager: CollectablesManager

@onready var gem_count: ItemCount = $GemCount

func _ready() -> void:
	collectables_manager.collected.connect(_on_collectable)

func _on_collectable(collectable: Collectable) -> void:
	if collectable is Gem:
		gem_count.increment_count()
