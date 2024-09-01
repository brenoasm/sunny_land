extends Node2D
class_name PlayerInput

signal movement_direction_changed(direction: float)

var direction_x: float
var input_enabled = true
var jump_pressed = false

var player: Player

func _ready() -> void:
	assert(owner is Player, "This node must be used inside a Player")
	
	player = owner

func _physics_process(delta: float) -> void:
	if input_enabled:
		direction_x = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left")
		jump_pressed = Input.is_action_just_pressed("ui_accept")
	else:
		jump_pressed = false

func apply_x_velocity(xVelocity: float) -> void:
	player.velocity.x = xVelocity
	
	movement_direction_changed.emit(direction_x)

func apply_y_velocity(yVelocity: float) -> void:
	player.velocity.y = yVelocity

func disable() -> void:
	input_enabled = false
	
func enable() -> void:
	input_enabled = true

func is_enabled() -> bool:
	return input_enabled

func is_pressing_move() -> bool:
	return input_enabled and direction_x != 0
	
func is_pressing_jump() -> bool:
	return input_enabled and jump_pressed
