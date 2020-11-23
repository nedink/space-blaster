extends Ship

class_name Player

var velocity = Vector2()
var inputs = {
	"up": false,
	"down": false,
	"left": false,
	"right": false,
}


func _physics_process(delta):
	$Tween.interpolate_property(self, "rotation", rotation, (get_global_mouse_position() - global_position).angle(), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tween.start()
#	if inputs["up"]:
#		velocity += Vector2.UP * 0.1
#	if inputs["down"]:
#		velocity += Vector2.DOWN * 0.1
	if inputs["left"]:
		if position.x > 16:
			velocity = Vector2.LEFT * 2
	if inputs["right"]:
		if position.x < 128 - 16:
			velocity = Vector2.RIGHT * 2
	
#	if position.x < 32 || :
#		velocity *= 0.8
		
	position += velocity
	
	velocity = Vector2.ZERO

func _input(event):
	if event.is_pressed():
		if event.is_action("cancel"):
			get_tree().quit(1)
		if event.is_action("up"):
			inputs["up"] = true
		if event.is_action("down"):
			inputs["down"] = true
		if event.is_action("left"):
			inputs["left"] = true
		if event.is_action("right"):
			inputs["right"] = true
	else:
		if event.is_action("up"):
			inputs["up"] = false
		if event.is_action("down"):
			inputs["down"] = false
		if event.is_action("left"):
			inputs["left"] = false
		if event.is_action("right"):
			inputs["right"] = false
