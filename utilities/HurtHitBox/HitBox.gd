# Detected by HitBox
class_name HitBox, "HitBox.svg"
extends Area2D

export var damage := 10


func _init() -> void:
	pass


func setup_layer_and_mask(layer : int, mask : int) -> void:
	collision_layer = layer
	collision_mask = mask
