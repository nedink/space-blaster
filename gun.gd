extends Position2D

var bulletScene = preload("res://Bullet.tscn")


func _physics_process(delta):
	if Input.is_action_just_pressed("primary"):
		var bullet = bulletScene.instance()
		add_child(bullet)
		bullet.set_as_toplevel(true)

