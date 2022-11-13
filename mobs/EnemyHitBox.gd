# Detected by HitBox
class_name EnemyHitBox, "res://utilities/HurtHitbox/HitBox.svg"
extends HitBox


func _init() -> void:
	setup_layer_and_mask(2, 0)
