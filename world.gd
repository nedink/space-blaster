extends Node2D


var hpBarScene = preload("res://enemy/HpBar.tscn")
var enemyScene = preload("res://enemy/Enemy.tscn")


func _process(delta):
#	$Label.text = str(get_tree().get_nodes_in_group("bullet").size())
	
	$Label.text = str(Engine.get_frames_per_second())
	$Label2.text = str(get_tree().get_node_count())
	
	var text = ""
	for c in get_children():
		text += c.name[0] + " "
	
	for c in get_children():
		if c is CPUParticles2D:
			print("particles")
	


func _input(event):
	if event.is_pressed():
		if event.is_action("pause"):
			get_tree().paused = !get_tree().paused
		if event.is_action("cancel"):
			get_tree().quit(1)
