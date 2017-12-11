extends Node2D
# NPC的一些公用方法

var cursor_anim = preload("res://script/cursor_anim.gd").new()

func _ready():
	var pos = self.get_pos()
	set_z(pos.y)
	get_node("area").connect("mouse_enter", self, "on_mouse_enter")
	get_node("area").connect("mouse_exit", self, "on_mouse_exit")

func on_mouse_enter():
	get_owner().set_process_input(false)
	set_process_input(true)
	set_process(true)

func on_mouse_exit():
	get_owner().set_process_input(true)
	set_process_input(false)
	set_process(false)
	cursor_anim.pointer()

func _process(delta):
	cursor_anim.talk()

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON and event.pressed and event.button_index == 1):
		print('talk')
