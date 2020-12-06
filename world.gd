extends Node2D



func _process(delta):
#	$Label.text = str(get_tree().get_nodes_in_group("bullet").size())
	
#	$Label.text = str(get_tree().get_node_count())
	$Label.text = str(Engine.get_frames_per_second())
	
	var text = ""
	for c in get_children():
		text += c.name[0] + " "
	
	for c in get_children():
		if c is CPUParticles2D:
			print("particles")
	
	
#	$Label.text = text
#	$Label.text = text
	
	
	
#	for c in get_children():
#		if c is CPUParticles2D:
#			print(c.name)

