extends AnimatedSprite2D
class_name PlayerAnimation

enum PlayerAnimations {
	Falling,
	Jumping,
	Idle,
	Dying,
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
	
func playDyingAnimation() -> void:
	currentAnimation = PlayerAnimations.Dying
	play("Dying")

func applyAlpha(a: float) -> void:
	self_modulate.a = a

func flip(value: bool) -> void:
	flip_h = value
