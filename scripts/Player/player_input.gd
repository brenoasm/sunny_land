extends Node2D
class_name PlayerInput

signal movement_direction_changed(direction: float)

var direction_x: float
var input_enabled = true
var movement_enabled = true
var jump_pressed = false
var interact_pressed = false
var up_pressed = false
var down_pressed = false

var player: Player

func _ready() -> void:
	assert(owner is Player, "This node must be used inside a Player")
	
	player = owner
	
	player.game_state_manager.game_state_changed.connect(_on_game_state_changed)

func _physics_process(delta: float) -> void:
	if input_enabled:
		direction_x = Input.get_action_strength("ui_right") -  Input.get_action_strength("ui_left")
		up_pressed = Input.is_action_pressed("ui_up")
		down_pressed = Input.is_action_pressed("ui_down")
		jump_pressed = Input.is_action_just_pressed("ui_accept")
		interact_pressed = Input.is_key_pressed(KEY_E) 
	else:
		up_pressed = false
		down_pressed = false
		jump_pressed = false
		interact_pressed = false
		

func apply_x_velocity(xVelocity: float) -> void:
	player.velocity.x = xVelocity
	
	movement_direction_changed.emit(direction_x)

func apply_y_velocity(yVelocity: float) -> void:
	player.velocity.y = yVelocity

func disable() -> void:
	input_enabled = false
	
func enable() -> void:
	input_enabled = true
	
func disable_movement() -> void:
	movement_enabled = false
	
func enable_movement() -> void:
	movement_enabled = true

func is_enabled() -> bool:
	return input_enabled

func is_pressing_move() -> bool:
	return input_enabled and movement_enabled and direction_x != 0
	
func is_pressing_jump() -> bool:
	return input_enabled and jump_pressed
	
func is_pressing_interact() -> bool:
	return input_enabled and interact_pressed
	
func is_pressing_up() -> bool:
	return input_enabled and up_pressed
	
func is_pressing_down() -> bool:
	return input_enabled and down_pressed

func _on_game_state_changed(game_state: GameStateManager.GameState) -> void:
	if game_state == GameStateManager.GameState.LEVEL_WIN:
		input_enabled = false
