extends CharacterBody2D
class_name Player

@export var movement_speed = 300.0
@export var jump_movement_speed = 150.0
@export var jump_velocity = -400.0

@onready var animation_player: AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction_x: float

func _physics_process(delta: float) -> void:
	direction_x = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left")

func apply_x_velocity(xVelocity: float) -> void:
	velocity.x = xVelocity
		
	if direction_x > 0:
		animation_player.flip_h = false
	elif (direction_x < 0):
		animation_player.flip_h = true

func apply_y_velocity(yVelocity: float) -> void:
	velocity.y = yVelocity
