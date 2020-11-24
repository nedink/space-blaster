extends Node2D

class_name Ship

export var hp = 3

var velocity = Vector2()

onready var body = $Body




func damage(amt:float):
	hp -= amt
	if hp < 1:
		queue_free()

func _physics_process(delta):
	position += velocity
