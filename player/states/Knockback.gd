#Air.gd
extends PlayerState


func enter(_msg := {}) -> void:
	player.taking_damage = false
	player.can_move = false
	player.velocity.y = player.knockback_height
	player.hurt.monitoring = false
	player.anim_state.travel("take_hit")
			
		
func physics_update(delta: float) -> void:
	player.velocity.x = player.knockback_distance * player.knockback_direction
	player.velocity.y += player.gravity * delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")

	if player.velocity.x > 0.0:
		player.skin.scale.x = -1.0
	else:
		player.skin.scale.x = 1.0


func exit() -> void:
	player.can_move = true
	player.anim_player.play("RESET")
	player.hurt.monitoring = true
	player.anim_state.travel("idle")
