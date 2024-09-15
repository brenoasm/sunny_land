extends CharacterBody2D
class_name Player

@export var movement_speed = 200.0
@export var jump_movement_speed = 150.0
@export var jump_velocity = -350.0
@export var died_jump_velocity = -300.0
@export var floor_check_delay: float = 1
@export var climb_speed: float = 2

@export var game_state_manager: GameStateManager

signal enemy_hit(enemy: Enemy)
signal died()
signal finished_dying()

@onready var animation_player: PlayerAnimation = $AnimatedSprite2D
@onready var player_collision: PlayerCollision = $PhysicsHitbox
@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var input: PlayerInput = $Input
@onready var sound_effects: PlayerSoundEffects = $PlayerSoundEffects
@onready var interact_area: PlayerInteraction = $PlayerInteractArea
@onready var climbable_area: PlayerClimbableArea = $PlayerClimbableArea

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
