var pointer_null = preload("res://ui/1-0.png")
var pointer = preload("res://ui/2-1.png")
var pointer_talk = [
	preload("res://ui/3-1.png"),
	preload("res://ui/3-2.png"),
	preload("res://ui/3-3.png")
]
var pointer_door = [
	preload("res://ui/4-1.png"),
	preload("res://ui/4-2.png"),
	preload("res://ui/4-3.png")
]
var pointer_talk_hotspot = Vector2(29, 26)
var pointer_talk_anim_speed = 15
var pointer_door_hotspot = Vector2(0, 0)
var pointer_door_anim_speed = 15
var current_pointer_index = 1

func pointer_null():
	Input.set_custom_mouse_cursor(pointer_null)

func pointer():
	Input.set_custom_mouse_cursor(pointer)

func talk():
	if (current_pointer_index == 1 * pointer_talk_anim_speed):
		Input.set_custom_mouse_cursor(pointer_talk[0], pointer_talk_hotspot)
	elif (current_pointer_index == 2 * pointer_talk_anim_speed):
		Input.set_custom_mouse_cursor(pointer_talk[1], pointer_talk_hotspot)
	elif (current_pointer_index == 3 * pointer_talk_anim_speed):
		Input.set_custom_mouse_cursor(pointer_talk[2], pointer_talk_hotspot)
	current_pointer_index += 1
	if (current_pointer_index > 3 * pointer_talk_anim_speed):
		current_pointer_index = 1

func door():
	if (current_pointer_index == 1 * pointer_door_anim_speed):
		Input.set_custom_mouse_cursor(pointer_door[0], pointer_door_hotspot)
	elif (current_pointer_index == 2 * pointer_door_anim_speed):
		Input.set_custom_mouse_cursor(pointer_door[1], pointer_door_hotspot)
	elif (current_pointer_index == 3 * pointer_door_anim_speed):
		Input.set_custom_mouse_cursor(pointer_door[2], pointer_door_hotspot)
	current_pointer_index += 1
	if (current_pointer_index > 3 * pointer_door_anim_speed):
		current_pointer_index = 1