extends Node2D



func _process(delta):
	$Label.text = str(get_tree().get_nodes_in_group("bullet").size())
