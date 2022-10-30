#a little helper script to get autocompletion on the player states
class_name SnailState
extends State

var snail: Snail

func _ready():
	yield(owner, "ready")
	snail = owner as Snail
	assert(snail != null)
