extends Node2D


func _ready():
	print("exploding")
	for c in get_children():
		if c is Particles2D:
			c.emitting = true
