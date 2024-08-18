extends State

class_name EnemyState

var enemy: Enemy
var state_machine: EnemyStateMachine

var timer: float = 0

func _ready() -> void:
	await owner.ready
	enemy = owner as Enemy
	assert(enemy != null, "A EnemyState must have a Enemy as owner.")
	
func initialize(state_machine: EnemyStateMachine) -> void:
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
	timer = 0
	
	if state_machine.log_state_transition:
		print("Leaving " + self.name + " state")
