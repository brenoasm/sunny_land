extends CharacterBody2D
class_name Player

@export var movement_speed = 200.0
@export var jump_movement_speed = 150.0
@export var jump_velocity = -400.0
@export var died_jump_velocity = -300.0

signal enemy_hit(enemy: Enemy)
signal died()
signal finished_dying()

@onready var animation_player: PlayerAnimation = $AnimatedSprite2D
@onready var player_collision: PlayerCollision = $PhysicsHitbox
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var input: PlayerInput = $Input
@onready var sound_effects: PlayerSoundEffects = $PlayerSoundEffects

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	input.movement_direction_changed.connect(_on_movement_direction_changed)

func kill() -> void:
	input.disable()
	
	died.emit()
	
	player_state_machine.go_to_dying_state()

func _on_movement_direction_changed(direction: float) -> void:
	if direction > 0:
		animation_player.flip(false)
	elif direction < 0:
		animation_player.flip(true)
