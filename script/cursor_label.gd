extends Control
# 用于鼠标移动到地图传送点时显示目的地图名称

func set_text(text):
	get_node("node/text").set_text(text)
	set_size(get_node("node/text").get_size())
	get_node("node/bgcolor").set_size(get_node("node/text").get_size())

func _ready():
	set_text(get_node("node/text").get_text())
	get_node("node/bgcolor").set_size(get_node("node/text").get_size())
