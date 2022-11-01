class_name Player
extends KinematicBody2D

var unit_size := 128.0
var speed := 4.0 * unit_size

var velocity := Vector2.ZERO
var gravity
var max_jump_velocity 
var min_jump_velocity



var max_jump_height = 2.25 * unit_size
var min_jump_height = 0.8 * unit_size
var jump_duration = 0.5

onready var skin := $Skin
onready var coyote_timer := $CoyoteTimer


func _ready():
	gravity = 2.0 * max_jump_height / pow(jump_duration, 2.0)
	max_jump_velocity = -sqrt(2.0 * gravity * max_jump_height)
	min_jump_velocity = -sqrt(2.0 * gravity * min_jump_height)


func _physics_process(delta: float) -> void:
	if velocity.x < 0.0:
		skin.scale.x = -1.0
	elif velocity.x > 0.0:
		skin.scale.x = 1.0


func _process(delta: float) -> void:
#	print(str($StateMachine.state.name))
	print(velocity.y)
	$Control/ColorRect/VBoxContainer/State.text = str($StateMachine.state.name)
	$Control/ColorRect/VBoxContainer/Velocity.text = str(velocity.x)
	

	
