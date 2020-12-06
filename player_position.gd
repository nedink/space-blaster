extends Area2D

class_name PlayerPosition




func _on_1_mouse_entered():
#	print(position)
	var player:Node2D = get_tree().root.get_node("World/Player")
	player.position = global_position
#	pass
#	pass # Replace with function body.
