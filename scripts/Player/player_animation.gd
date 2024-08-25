extends AnimatedSprite2D
class_name PlayerAnimation

enum PlayerAnimations {
	Falling,
	Jumping,
	Idle,
	Hurt,
	Moving
}

var currentAnimation: PlayerAnimations = PlayerAnimations.Idle
	
func playFallingAnimation() -> void:
	currentAnimation = PlayerAnimations.Falling
	play("Falling")
	
func playJumpingAnimation() -> void:
	currentAnimation = PlayerAnimations.Jumping
	play("Jumping")
	
func playIdleAnimation() -> void:
	currentAnimation = PlayerAnimations.Idle
	play("Idle")
	
func playMovingAnimation() -> void:
	currentAnimation = PlayerAnimations.Moving
	play("Moving")
	
func playHurtAnimation() -> void:
	currentAnimation = PlayerAnimations.Hurt
	play("Hurt")

func applyAlpha(a: float) -> void:
	self_modulate.a = a
