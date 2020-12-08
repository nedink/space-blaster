extends KinematicBody2D

class_name Player

export var mass = 1.0
export var speed = 100

var inputs = {
	"up": false,
	"down": false,
	"left": false,
	"right": false,
}
var velocity = Vector2.ZERO
var queue_move = false # set position next physics loop

onready var body = $CollisionPolygon2D




func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	
	
#	if position.distance_to(get_global_mouse_position()) > 16:
#		var displacement = Vector2(get_global_mouse_position() - position).clamped(position.distance_to(get_global_mouse_position()) - 16)
#		position += displacement
	
#	position.angle_to_point()
	
#	position = position += position.ang if queue_move else position
	
#	if position.distance_to(get_global_mouse_position()) > 16:
#		position += 
	
	# move with wasd
	velocity = Vector2.ZERO
	if inputs["up"]:
		velocity += Vector2.UP
	if inputs["down"]:
		velocity += Vector2.DOWN
	if inputs["left"]:
		velocity += Vector2.LEFT
	if inputs["right"]:
		velocity += Vector2.RIGHT
	velocity = velocity.normalized() * speed
	
	
	var step = move_and_slide(velocity)
	
	for i in get_slide_count():
		modulate = Color.red
	
	if get_slide_count() == 0:
		modulate = Color.white
#	position += 
	
	
	
	# wrap
	position.x = wrapf(position.x, 0, get_viewport_rect().end.x)
	position.y = wrapf(position.y, 0, get_viewport_rect().end.y)



func _input(event:InputEvent):
	
	if event.is_action_pressed("primary"):
		$Gun.firing = true
	if event.is_action_released("primary"):
		$Gun.firing = false
	
#	if event is InputEventMouseMotion:
#		if event.is_pressed():
#			print("drag")
#		if event.position.distance_to(position) > 16:
#			queue_move = true
		
#		event.tilt
#		event.pressure
#		event.speed
#		event.position
#		event.relative
		
#		queue_position = position
#		global_transform = Transform2D(event.relative.angle(), event.position if (event.position - position).length() > 16 else position)
#		event.relative.angle()
		
		
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



#func _on_Player_input_event(viewport, event, shape_idx):
#
#	pass # Replace with function body.

func damage(amt:float):
	print("ouch " + str(amt))
