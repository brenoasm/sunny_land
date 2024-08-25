extends AnimatedSprite2D
class_name FrogAnimation

enum FrogAnimations {
	Idle,
	Jumping,
	Falling,
	Dying
}

var currentAnimation: FrogAnimations = FrogAnimations.Idle

func playIdleAnimation() -> void:
	currentAnimation = FrogAnimations.Idle
	play("Idle")
	
func playJumpingAnimation() -> void:
	currentAnimation = FrogAnimations.Jumping
	play("Jumping")
	
func playFallingAnimation() -> void:
	currentAnimation = FrogAnimations.Falling
	play("Falling")
	
func playDyingAnimation() -> void:
	currentAnimation = FrogAnimations.Dying
	play("Dying")
