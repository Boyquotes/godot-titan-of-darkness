# Detected by HitBox
class_name PlayerHitBox, "res://utilities/HurtHitbox/HitBox.svg"
extends HitBox


func _init() -> void:
	setup_layer_and_mask(1, 0)
