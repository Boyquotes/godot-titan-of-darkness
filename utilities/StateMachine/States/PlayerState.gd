#a little helper script to get autocompletion on the player states
class_name PlayerState
extends State

var player: Player

func _ready():
	yield(owner, "ready")
	player = owner as Player
	assert(player != null)
