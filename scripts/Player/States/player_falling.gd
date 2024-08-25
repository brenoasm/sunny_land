extends PlayerAir
class_name PlayerFalling

func _on_enemy_hit(enemy: Enemy) -> void:
	finished.emit(JUMPING, {})

func physics_update(delta: float) -> void:
	super(delta)
	
	player.move_and_slide()
			
func enter(previous_state: String, data: Dictionary) -> void:
	super(previous_state, data)
	
	player.animation_player.playFallingAnimation()
	
	player.enemy_hit.connect(_on_enemy_hit)

func exit() -> void:
	super.exit()
	
	player.enemy_hit.disconnect(_on_enemy_hit)
