extends Timer


func _on_LifeTimer_timeout():
	print("timed out")
	get_parent().queue_free()
	
