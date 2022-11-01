# Idle.gd
extends PlayerState


# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func update(_delta: float) -> void:
	# If you have platforms that break when standing on them, you need that check for 
	# the character to fall.
	if not owner.is_on_floor():
		state_machine.transition_to("CoyoteJump")
		return
	

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")
				
	if Input.is_action_just_pressed("jump"):
		# As we'll only have one air state for both jump and fall, we use the `msg` dictionary 
		# to tell the next state that we want to jump.
		state_machine.transition_to("Air", {do_jump = true})
		
		
func physics_update(_delta: float) -> void:
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
