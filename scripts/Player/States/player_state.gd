extends State

class_name PlayerState

const MOVING = "Moving"
const IDLE = "Idle"
const JUMPING = "Jumping"
const FALLING = "Falling"
const DYING = "Dying"

var player: Player
var state_machine: PlayerStateMachine

var timer: float = 0

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "A PlayerState must have a Player as owner.")
	
func initialize(state_machine: PlayerStateMachine) -> void:
	self.state_machine = state_machine

@warning_ignore("unused_parameter")
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	if player.velocity.y > 0 and state_machine.current_state is not PlayerFalling:
		finished.emit(FALLING, {})
	elif player.velocity.y < 0 and state_machine.current_state is not PlayerJumping:
		finished.emit(JUMPING, {})
		
	if not player.is_on_floor():
		player.input.apply_y_velocity(player.velocity.y + player.gravity * delta)
				
	
func enter(previous_state: String, data: Dictionary) -> void:
	timer = 0
	
	if state_machine.log_state_transition:
		print("Entering " + self.name + " state")
	
func exit() -> void:
	if state_machine.log_state_transition:
		print("Leaving " + self.name + " state")
