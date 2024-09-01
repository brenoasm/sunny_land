extends Area2D
class_name PlayerOffensiveArea

var player: Player

func _ready() -> void:
	assert(owner is Player, "This node must be used inside a Player")
	
	player = owner

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy and player.player_state_machine.can_hit_enemy():
		player.enemy_hit.emit(body)
		body.kill()
