extends Enemy
class_name Frog

@export var jump_delay = 3

signal died()

@onready var animation_player: FrogAnimation = $AnimatedSprite2D
@onready var frog_collision: FrogCollision = $PhysicsHitbox

var dying = false

func kill() -> void:
	dying = true
	died.emit()

func _on_offensive_area_body_entered(body: Node2D) -> void:
	if body is Player and not dying:
		body.kill()
