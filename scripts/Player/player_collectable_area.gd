extends Area2D
class_name PlayerCollectableArea

var player: Player

func _ready() -> void:
	assert(owner is Player, "This node must be used inside a Player")
	
	player = owner

func _on_area_entered(area: Area2D) -> void:
	if area is Collectable:
		if not area.can_be_collected:
			return
		
		player.sound_effects.play_collect_sound()
		area.collect()
