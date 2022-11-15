#Death.gd
extends PlayerState


func enter(msg := {}) -> void:
	player.velocity = Vector2.ZERO
	player.anim_state.travel("death")
	
	

#func physics_update(delta: float) -> void:
#	player.velocity = player.move_and_slide(Vector2.ZERO, Vector2.UP)
