extends Node2D


var hpBarScene = preload("res://HpBar.tscn")
var enemyScene = preload("res://Enemy.tscn")


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
	


func _physics_process(delta):
	if get_tree().get_nodes_in_group("enemy").empty():
		var enemy = enemyScene.instance()
		$Wave1/LineMonitorBehavior/PathFollow2D.add_child(enemy)
		
		


func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
