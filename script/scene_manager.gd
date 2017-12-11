extends Node

var target_map = null
var target_warp = null
var cursor_anim = preload("res://script/cursor_anim.gd").new()

func warp(map, warp):
	if(is_game()):
		target_map = map
		target_warp = warp
		set_process(true)

func _process(delta):
	var current_map = get_tree().get_nodes_in_group("map")[0]
	call_deferred("do_warp", current_map, target_map, target_warp)

func is_game():
	return "game" == get_tree().get_current_scene().get_name()

func do_warp(current_map, map, warp):
	var game = get_tree().get_current_scene()
	var mask = game.get_node("mask")
	if mask.before_mask_on():
		current_map.set_process_input(false)
		mask.mask_on()
		cursor_anim.pointer_null()
	else:
		if mask.mask_on_finished():
			current_map.free()
			var new_map = ResourceLoader.load(map).instance()
			new_map.add_to_group("map")
			game.add_child(new_map)
			var target = new_map.find_node(warp)
			if(target and target extends Position2D):
				set_player_pos(target.get_pos())
			mask.mask_off()
		else:
			if mask.after_mask_off():
				cursor_anim.pointer()
				mask.clear_playing()
				set_process(false)
	#game.set_camera_limits(new_map.map_size)

func set_player_pos(pos):
	for body in get_tree().get_nodes_in_group("player"):
		body.play_direction_anim(false)
		body.set_pos(pos)
		break
