extends CharacterBody2D
class_name Player

@export var movement_speed = 250.0
@export var jump_movement_speed = 150.0
@export var jump_velocity = -400.0
@export var invencibilityDuration: float = .2
@export var hurt_recoil_speed = 300.0

signal enemy_hit(enemy: Enemy)

@onready var animation_player: PlayerAnimation = $AnimatedSprite2D
@onready var player_collision: PlayerCollision = $physics_hitbox
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction_x: float
var input_enabled = true

func _physics_process(delta: float) -> void:
	if input_enabled:
		direction_x = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left")

func apply_x_velocity(xVelocity: float) -> void:
	velocity.x = xVelocity
		
	if direction_x > 0:
		animation_player.flip_h = false
	elif (direction_x < 0):
		animation_player.flip_h = true

func apply_y_velocity(yVelocity: float) -> void:
	velocity.y = yVelocity

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy and player_state_machine.can_hit_enemy():
		enemy_hit.emit(body)
		body.kill()
		
