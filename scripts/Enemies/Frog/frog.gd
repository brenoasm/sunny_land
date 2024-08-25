extends Enemy
class_name Frog

@export var jump_delay = 3

signal died()

@onready var animation_player: FrogAnimation = $AnimatedSprite2D
@onready var frog_collision: FrogCollision = $CollisionShape2D

func kill() -> void:
	died.emit()
