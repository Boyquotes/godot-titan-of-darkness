# Allows its owner to detect hits and take damage
class_name HurtBox, "HurtBox.svg"
extends Area2D


func _init() -> void:
	monitorable = false


func setup_layer_and_mask(layer : int, mask : int) -> void:
	collision_layer = layer
	collision_mask = mask


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(hitbox: HitBox) -> void:
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox)
