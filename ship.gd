extends Node2D

class_name Ship

export var hp = 3

onready var body = $Body




func damage(amt:float):
	hp -= amt
	if hp <= 0:
		queue_free()
