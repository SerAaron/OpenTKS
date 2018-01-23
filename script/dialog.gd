extends Node2D

export var max_col = 10
# 单字大小 16 x 16
var single_size = Vector2(16,16)
# 内容边距
var padding = Vector2(10,8)

# 根据字数计算背景大小
func get_bg_size(num):
	var result = Vector2()
	var line = num / max_col
	var remainder = num % max_col
	if line > 0 and remainder > 0:
		line = line + 1
	if line == 0:
		result.x = num * single_size.x
		result.y = single_size.y
	else:
		result.x = max_col * single_size.x
		result.y = line * single_size.y
	return result

func _ready():
	# NPC_TALK_01_1
	# 获取富文本节点
	var rtext = get_node("rtext")
	# 获取背景面板节点
	var bg = get_node("background")
	# 获取文本内容
	# var content = TranslationServer.translate('NPC_TALK_01_1')
	var content = '获取[color=red]文本[/color]内容'
	# 设置内容到富文本节点
	rtext.set_bbcode(content)
	# 获取渲染后的字数
	var text_count = rtext.get_text().length()
	# 根据字数计算行数及背景面板大小
	var bg_size = get_bg_size(text_count)
	# 隐藏滚动条
	rtext.set_scroll_active(false)
	# 设置文本框大小
	rtext.set_size(bg_size)
	# 设置文本框位置
	rtext.set_pos(Vector2(padding.x, padding.y * 1.2))
	# 设置背景面板大小加边距
	bg.set_size(Vector2(bg_size.x + padding.x * 2, bg_size.y + padding.y * 2))
	# 设置气泡尾巴位置
	get_node("left").set_pos(Vector2(bg_size.x / 2 - get_node("left").get_size().x / 2,bg_size.y + padding.y * 2 - 4))
