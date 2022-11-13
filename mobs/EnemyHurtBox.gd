# Allows its owner to detect hits and take damage
class_name EnemyHurtBox, "res://utilities/HurtHitbox/HurtBox.svg"
extends HurtBox


func _init() -> void:
	setup_layer_and_mask(0, 1)
