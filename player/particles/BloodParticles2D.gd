extends Particles2D


onready var delete_timer := $DeleteTimer


func _ready() -> void:
	emitting = true
	delete_timer.wait_time = lifetime
	delete_timer.connect("timeout", self, "_on_delete_timer_timeout")
	delete_timer.start()


func _on_delete_timer_timeout() -> void:
	queue_free()
