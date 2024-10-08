extends Node
class_name PlayerStateMachine

@export var log_state_transition: bool = false

var current_state: PlayerState

func _ready() -> void:
	_loadStates()

func _process(delta: float) -> void:
	current_state.update(delta)
	
func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
	
func _transition_to_next_state(next_state: String, data: Dictionary) -> void:
	if current_state is PlayerDying:
		return
		
	var previous_state_name = current_state.name
	current_state.exit()
	
	current_state = get_node(next_state)
	
	current_state.enter(previous_state_name, data)

func _loadStates() -> void:
	for state_node: PlayerState in find_children("*", "PlayerState"):
		state_node.initialize(self)
		state_node.finished.connect(_transition_to_next_state)
		
		if current_state == null:
			current_state = state_node
			
	await owner.ready
	
	current_state.enter("", {})

func can_hit_enemy() -> bool:
	return current_state is PlayerFalling

func go_to_dying_state() -> void:
	_transition_to_next_state(current_state.DYING, {})
