extends Area2D
# 地图传送点

export (String) var target_map_name = null
export (String, FILE) var target_map = null
export (String) var target_warp = null

var cursor_anim = preload("res://script/cursor_anim.gd").new()
var cursor_bg = ResourceLoader.load("res://scence/game/cursor_bg.tscn").instance()

var click = null
var mouse_status = null
var body_enter = false

func _ready():
	connect("body_enter", self, "on_body_enter")
	connect("mouse_enter", self, "on_mouse_enter")
	connect("mouse_exit", self, "on_mouse_exit")
	set_process_input(true)

func on_body_enter(body):
	# 避免初始化下一张地图时角色位置触发到下一张图的传送点
	if(body.is_in_group("player") and click == true):
		get_node("/root/scene_manager").warp(target_map, target_warp)
		click = false
		body_enter = true
		set_process_input(false)

func on_mouse_enter():
	mouse_status = "enter"
	cursor_bg.set_text(target_map_name)
	get_parent().add_child(cursor_bg)
	set_process(true)

func on_mouse_exit():
	mouse_status = "exit"
	get_parent().remove_child(cursor_bg)
	set_process(false)
	cursor_anim.pointer()
	
func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON and event.pressed and event.button_index == 1 and mouse_status == "enter"):
		click = true

func _process(delta):
	if !body_enter:
		cursor_bg.set_pos(get_global_mouse_pos() - Vector2(cursor_bg.get_size().x / 2 - 29/2, cursor_bg.get_size().y))
		cursor_anim.door()