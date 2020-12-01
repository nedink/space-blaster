extends Node2D



func _process(delta):
#	$Label.text = str(get_tree().get_nodes_in_group("bullet").size())
	
	$Label.text = str(get_tree().get_node_count())
	
	var text = ""
	for c in get_children():
		text += c.name[0] + " "
	
	
#	$Label.text = text
#	$Label.text = text
	
	
	
#	for c in get_children():
#		if c is CPUParticles2D:
#			print(c.name)

