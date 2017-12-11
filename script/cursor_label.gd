extends Control

func set_text(text):
	get_node("node/text").set_text(text)
	set_size(get_node("node/text").get_size())
	get_node("node/bgcolor").set_size(get_node("node/text").get_size())

func _ready():
	set_text(get_node("node/text").get_text())
	get_node("node/bgcolor").set_size(get_node("node/text").get_size())
