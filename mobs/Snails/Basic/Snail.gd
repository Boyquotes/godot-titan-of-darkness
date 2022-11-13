class_name BasicSnail
extends Mob

export var direction := -1.0
export var can_move := true

var random_directions := [-1.0, 1.0]

onready var raycast_front := $Raycasts/Front
onready var raycast_back := $Raycasts/Back


#func _ready() -> void:
#	randomize()
#	direction = random_directions[randi() % random_directions.size()]
	
	
func _physics_process(delta: float) -> void:
	_update_direction()
	_movement()
	_flip_sprite()
		
		
func _update_direction() -> void:
	if !raycast_front.is_colliding():
		direction = -1.0
	elif !raycast_back.is_colliding():
		direction = 1.0


func _movement() -> void:
	if can_move:
		velocity = Vector2(speed * direction, 0.0)
	velocity = move_and_slide(velocity, Vector2.UP)


func _flip_sprite() -> void:
	if velocity.x > 0.0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true



func take_damage(hitbox: HitBox) -> void:
	health -= hitbox.damage

	if health <= 0:
		queue_free()



	
	
