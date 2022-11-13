#DebugWindow
extends Control


onready var label_state = $ColorRect/VBoxContainer/LabelState
onready var label_velocity = $ColorRect/VBoxContainer/LabelVelocity
onready var label_gravity = $ColorRect/VBoxContainer/LabelGravity
onready var coyote = $ColorRect/VBoxContainer/HBoxContainer/Coyote
onready var jump_buffer = $ColorRect/VBoxContainer/HBoxContainer/JumpBuffer

var state_machine : StateMachine


func _ready() -> void:
	yield(owner, "ready")
	state_machine = owner.state_machine


func _process(delta: float) -> void:
	label_state.text = str(state_machine.state.name)
	label_velocity.text = str(owner.velocity)
	label_gravity.text = str(owner.is_on_floor())

	if $"../../StateMachine/Air".coyote_jump:
		coyote.color = Color("1bc44d")
	else:
		coyote.color = Color("ffffff")

	if $"../../StateMachine/Air".jump_buffer:
		jump_buffer.color = Color("1bc44d")
	else:
		jump_buffer.color = Color("ffffff")
