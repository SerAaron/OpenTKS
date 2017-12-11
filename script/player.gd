extends KinematicBody2D

# 方向值
const NORTH = 0
const WEST = 1
const SOUTH = 2
const EAST = 3
const NORTH_WEST = 4
const NORTH_EAST = 5
const SOUTH_WEST = 6
const SOUTH_EAST = 7

# 移动速度
const MOVE_SPEED = 150

# 动画参数
var anim_player = null
var anim = ""
var anim_new = ""
var anim_speed = 1.2
var anim_blend = 0

# 当前动画
var current_anim = "down_idle"

# 当前方向
var current_direction = SOUTH

# 播放方向动画
func play_direction_anim(play):
	if play:
		play_anim(current_anim)
	else:
		play_anim(str(current_anim, "_idle"))

# 播放动画
func play_anim(anim):
	anim_player.play(anim, anim_blend, anim_speed)

# 停止动画
func stop_anim():
	anim_player.stop()

# 计算两点连线角度
func get_angle(target):
	# 两点的x、y值
	var x = get_pos().x - target.x
	var y = get_pos().y - target.y
	# 斜边长度
	var hypotenuse = sqrt(pow(x, 2) + pow(y, 2))
	var _cos = x / hypotenuse
	# 求出弧度
	var _radian = acos(_cos)
	# 用弧度算出角度
	var _angle = 180 / (PI / _radian)
	if y < 0:
		_angle = -_angle
	elif (y == 0) && (x < 0):
		_angle = 180
	return _angle

# 根据直线角度判断方向
func get_angle_direction(_angle):
	if _angle >= -(90 * 7 / 4) && _angle < -(90 * 5 / 4):
		current_anim = 'down_right'
		current_direction = SOUTH_EAST
	elif _angle >= -(90 * 5 / 4) && _angle < -(90 * 3 / 4):
		current_anim = 'down'
		current_direction = SOUTH
	elif _angle >= -(90 * 3 / 4) && _angle < -(90 * 1 / 4):
		current_anim = 'down_left'
		current_direction = SOUTH_WEST
	elif _angle >= -(90 * 1 / 4) && _angle < (90 * 1 / 4):
		current_anim = 'left'
		current_direction = WEST
	elif _angle >= (90 * 1 / 4) && _angle < (90 * 3 / 4):
		current_anim = 'up_left'
		current_direction = NORTH_WEST
	elif _angle >= (90 * 3 / 4) && _angle < (90 * 5 / 4):
		current_anim = 'up'
		current_direction = NORTH
	elif _angle >= (90 * 5 / 4) && _angle < (90 * 7 / 4):
		current_anim = 'up_right'
		current_direction = SOUTH_EAST
	else:
		current_anim = 'right'
		current_direction = EAST

# 根据目标点设置当前方向参数
func set_direction(target):
	get_angle_direction(get_angle(target))

# 移动到目标点
func go_to(target):
	move_to(target)
	set_z(target.y)

func _ready():
	anim_player = get_node("AnimationPlayer")
	play_anim("down_idle")