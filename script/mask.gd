extends Node2D

var anim_player = null
var current_anim = null
var is_playing = null
var mask_on_finished = null
var mask_off_finished = null

func _ready():
	set_hidden(true)
	anim_player = get_node("AnimationPlayer")
	anim_player.connect("finished", self, "on_anim_finished")

func clear_playing():
	is_playing = null
	mask_on_finished = null
	mask_off_finished = null

func before_mask_on():
	return is_playing == null and mask_on_finished == null

func mask_on_finished():
	return mask_on_finished == true and mask_off_finished == null

func after_mask_off():
	return is_playing == false and mask_off_finished == true

func mask_on():
	set_hidden(false)
	is_playing = true
	mask_on_finished = false
	current_anim = "mask_on"
	anim_player.play("mask_on", 0.5, 1)

func mask_off():
	mask_off_finished = false
	current_anim = "mask_off"
	anim_player.play("mask_off", 0.5, 1)

func on_anim_finished():
	if current_anim == "mask_off":
		set_hidden(true)
		is_playing = false
		mask_off_finished = true
	elif current_anim == "mask_on":
		mask_on_finished = true