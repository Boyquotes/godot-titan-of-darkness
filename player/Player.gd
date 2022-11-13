class_name Player
extends KinematicBody2D




var unit_size := 128.0
var speed := 4.0 * unit_size

var velocity := Vector2.ZERO
var gravity
var max_jump_velocity 
var min_jump_velocity

var can_jump := true
var can_move := true
var taking_damage := false

var jump_duration = 0.6
var max_jump_height = 3.25 * unit_size
var min_jump_height = 0.0 * unit_size

var knockback_height = 2.0 * unit_size
var knockback_distance = 2.5 * unit_size
var knockback_vector := Vector2.ZERO
var knockback_direction : float		

onready var skin := $Skin
onready var dust_particles = $Skin/DustParticles2D
onready var anim_player := $AnimationPlayer
onready var state_machine := $StateMachine
onready var position_blood_particles = $Skin/PositionBloodParticles
onready var camera := $Camera2D
onready var sfx_player := $AudioPlayerSFX
onready var anim_state = $AnimationTree.get("parameters/playback")
onready var hurt := $Hurt

var blood_particles := preload("res://player/particles/BloodParticles2D.tscn")


func _ready():
	gravity = 2 * max_jump_height / pow(jump_duration, 2)
	max_jump_velocity = -sqrt(2 * gravity * max_jump_height)
	min_jump_velocity = -sqrt(2 * gravity * min_jump_height)
	knockback_height = -sqrt(2 * gravity * knockback_height)
	$AnimationTree.active = true
	
	
func _on_area_entered() -> void:
	print("player getting dmg")

func _physics_process(delta: float) -> void:
	if can_move:
		if velocity.x < 0.0 and Input.is_action_pressed("move_left"):
			skin.scale.x = -1.0
		elif velocity.x > 0.0 and Input.is_action_pressed("move_right"):
			skin.scale.x = 1.0
		

func take_damage(area) -> void:
	taking_damage = true
	_create_blood_particles()
	sfx_player.play_hit_sfx()
	camera.set_shake_intensity(1.0)

	if area.global_position.x > global_position.x:
		knockback_direction = -1.0
	else:
		knockback_direction = 1.0


func _create_blood_particles() -> void:
	var bp_instance = blood_particles.instance()
	skin.add_child(bp_instance)

	



