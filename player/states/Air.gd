#Air.gd
extends PlayerState


onready var coyote_timer := $CoyoteTimer
onready var jump_buffer_timer := $JumpBufferTimer

var coyote_jump := false
var jump_buffer := false


func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = player.max_jump_velocity
	elif msg.has("was_on_floor"):
		coyote_jump = true
		coyote_timer.start()
		

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and coyote_jump:
		player.velocity.y = player.max_jump_velocity
		coyote_jump = false

	if event.is_action_released("jump") and player.velocity.y < player.min_jump_velocity:
			player.velocity.y = player.min_jump_velocity
			
		
func physics_update(delta: float) -> void:
	var input_direction_x: float = (
		Input.get_action_strength("move_right") -
		Input.get_action_strength("move_left")
	)
	
	if Input.is_action_just_pressed("jump") and not player.is_on_floor():
		if coyote_timer.is_stopped():
			jump_buffer = true
			jump_buffer_timer.start()
		
	
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			if jump_buffer:
				state_machine.transition_to("Idle", {jump_buffer = true})
			else:
				state_machine.transition_to("Idle")
		else:
			if jump_buffer:
				state_machine.transition_to("Run", {jump_buffer = true})
			else:
				state_machine.transition_to("Run")


func _on_CoyoteTimer_timeout() -> void:
	coyote_jump = false


func _on_JumpBufferTimer_timeout() -> void:
	jump_buffer = false
