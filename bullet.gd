extends Node2D

class_name Bullet

var velocity = Vector2.RIGHT


func _physics_process(delta):
	position += velocity
