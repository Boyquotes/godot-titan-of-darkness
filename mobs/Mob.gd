class_name Mob
extends KinematicBody2D

export var damage := 1
export var health := 2
export var speed := 250.0


var velocity := Vector2.ZERO


onready var sprite := $Sprite
onready var anim_player := $AnimationPlayer

