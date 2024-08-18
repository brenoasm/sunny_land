extends State

class_name PlayerState

const MOVING = "Moving"
const IDLE = "Idle"
const JUMPING = "Jumping"
const FALLING = "Falling"

var player: Player
var state_machine: PlayerStateMachine

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "A PlayerState must have a Player as owner.")
	
func initialize(state_machine: PlayerStateMachine) -> void:
	self.state_machine = state_machine

@warning_ignore("unused_parameter")
func update(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func physics_update(delta: float) -> void:
	pass
	
func enter(previous_state: String, data: Dictionary) -> void:
	if state_machine.log_state_transition:
		print("Entering " + self.name + " state")
	
func exit() -> void:
	if state_machine.log_state_transition:
		print("Leaving " + self.name + " state")
