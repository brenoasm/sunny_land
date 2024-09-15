extends Area2D
class_name PlayerInteraction

var interactable: Interactable = null
	
func _on_area_entered(interactable: Interactable) -> void:
	self.interactable = interactable

func _on_area_exited(interactable: Interactable) -> void:
	self.interactable = null
