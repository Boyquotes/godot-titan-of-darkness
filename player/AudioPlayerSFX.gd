extends AudioStreamPlayer2D


export(Array, AudioStreamSample) var jump_sfx_arr
export(Array, AudioStreamSample) var land_sfx_arr
export(Array, AudioStreamSample) var hit_sfx_arr


func _ready() -> void:
	randomize()


func play_jump_sfx() -> void:
	if jump_sfx_arr:
		stream = jump_sfx_arr[rand_range(0, jump_sfx_arr.size())]
		play()


func play_land_sfx() -> void:
	if land_sfx_arr:
		stream = land_sfx_arr[rand_range(0, land_sfx_arr.size())]
		play()
		
		
func play_hit_sfx() -> void:
	if hit_sfx_arr:
		stream = hit_sfx_arr[rand_range(0, land_sfx_arr.size())]
		play()
