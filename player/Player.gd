class_name Player
extends KinematicBody2D


var unit_size := 64.0
var speed := 4.0 * unit_size

var velocity := Vector2.ZERO
var gravity
var max_jump_velocity 
var min_jump_velocity

var can_jump := true

var max_jump_height = 4.25 * unit_size
var min_jump_height = 0.8 * unit_size
var jump_duration = 0.6

onready var skin := $Skin
onready var dust_particles = $Skin/Particles2D


func _ready():
	gravity = 2 * max_jump_height / pow(jump_duration, 2)
	max_jump_velocity = -sqrt(2 * gravity * max_jump_height)
	min_jump_velocity = -sqrt(2 * gravity * min_jump_height)
	

func _physics_process(delta: float) -> void:
	if velocity.x < 0.0:
		skin.scale.x = -1.0
	elif velocity.x > 0.0:
		skin.scale.x = 1.0


func _process(delta: float) -> void:
	print(velocity.x)
	$Control/ColorRect/VBoxContainer/State.text = str($StateMachine.state.name)
	$Control/ColorRect/VBoxContainer/Velocity.text = str(velocity)
	$Control/ColorRect/VBoxContainer/Gravity.text = str(is_on_floor())

	if $StateMachine/Air.coyote_jump:
		$Control/ColorRect/VBoxContainer/HBoxContainer/Coyote.color = Color("1bc44d")
	else:
		$Control/ColorRect/VBoxContainer/HBoxContainer/Coyote.color = Color("ffffff")

	if $StateMachine/Air.jump_buffer:
		$Control/ColorRect/VBoxContainer/HBoxContainer/JumpBuffer.color = Color("1bc44d")
	else:
		$Control/ColorRect/VBoxContainer/HBoxContainer/JumpBuffer.color = Color("ffffff")
	



