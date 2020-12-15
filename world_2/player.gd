extends KinematicBody2D

export var input_speed = 100

var velocity = Vector2.ZERO


func _physics_process(delta):
	
	if Input.is_action_pressed("up"):
		velocity += Vector2()
		
