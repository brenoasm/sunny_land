extends Camera2D
class_name Camera

@export var player: Player

var follow_player = true

func _ready() -> void:
	follow_player = true
	player.died.connect(_on_player_died)
	
func _physics_process(delta: float) -> void:
	if follow_player:
		position = player.position

func _on_player_died() -> void:
	follow_player = false
	player.died.disconnect(_on_player_died)
