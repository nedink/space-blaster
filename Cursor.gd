extends Node2D

export var SPEED = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#	Input.MOUSE_MODE_CAPTURED
	$AnimationPlayer.connect("animation_finished", self, "animation_finished")

func _process(delta):
	global_position = get_global_mouse_position()
	rotate(delta * SPEED)


var stop_anim = false
func _input(event):
	if event.is_action_pressed("primary"):
		$AnimationPlayer.play("click", -1, 8)
	if event.is_action_released("primary"):
#		$AnimationPlayer.set_auto
		$Node2D.scale = Vector2.ONE
		$Node2D.rotation = 0

func animation_finished():
	print("finished")
	if Input.is_action_pressed("primary"):
		$AnimationPlayer.play("click")
#	$AnimationPlayer.stop()
