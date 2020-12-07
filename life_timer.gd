extends Timer


func _on_LifeTimer_timeout():
	get_parent().queue_free()
	
