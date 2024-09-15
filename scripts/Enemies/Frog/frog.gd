extends Enemy
class_name Frog

@export var jump_delay = 3

@onready var animation_player: FrogAnimation = $AnimatedSprite2D
@onready var frog_collision: FrogCollision = $PhysicsHitbox

var dying = false

func kill() -> void:
	dying = true
	frog_collision.disable_collision()
	frog_collision.disable_player_collision()
	can_be_hit = false
	started_dying.emit()

func _on_offensive_area_body_entered(body: Node2D) -> void:
	if body is Player and not dying:
		body.kill()
	
func flip(value: float) -> void:
	if animation_player != null:
		if value > 0:
			animation_player.flip_h = true
		elif value < 0:
			animation_player.flip_h = false
