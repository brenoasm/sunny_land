extends EnemyState
class_name FrogState

const JUMPING = "Jumping"
const FALLING = "Falling"
const IDLE = "Idle"

var frog: Frog

func _ready() -> void:
	await owner.ready
	frog = owner as Frog
	assert(frog != null, "A FrogState must have a Frog as owner.")
	
	frog.started_dying.connect(_on_started_dying)
	
func _on_started_dying() -> void:
	finished.emit(DYING, {})
