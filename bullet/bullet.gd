extends Node2D

class_name Bullet

var lifeTimerScene = preload("res://LifeTimer.tscn")
var velocity = 0

export var acceleration = 0
export var damage = 1.0
export var damping = 0

onready var gun = get_parent()
onready var ship = gun.get_parent()


func _ready():
	$Trajectory.collision_mask = ship.body.collision_mask
#	$ParticleTrail.angle = rad2deg(sin(global_rotation))
#	$ParticleTrail.angular_velocity = rand_range(-800, 800)
#	print(global_rotation)



func _physics_process(delta):
	
	# scal sprite
	$Sprite.scale.x = velocity / 400
#	$Sprite.scale.y = 1000 /velocity
	
#	for enemy in get_tree().get_nodes_in_group("enemy"):
		# pull toward enemy
#		velocity += Vector2.RIGHT.rotated(get_angle_to(enemy))
		
	
	
	# scale raycast to velocity
	$Trajectory.cast_to = $Trajectory.cast_to.normalized() * velocity * delta
	# test raycast
	if $Trajectory.is_colliding():
		var collider:Node2D = $Trajectory.get_collider().get_parent().damage(damage)
#		collider.get_parent().damage(damage)
#		world.add_child(self)
		position = $Trajectory.get_collision_point()
		$Sprite.hide()
		$LifeTimer.start()
		
#		$ParticleTrail.emitting = false
		for c in $Effects.get_children():
			c.emitting = false
#			var lifetTimer = lifeTimerScene.instance()
#			c.add_child(lifetTimer)
		
		set_physics_process(false)
	
	# move 
	else:
		position += transform.x * velocity * delta
#		velocity += acceleration * Engine.get_frames_per_second()
#		position += transform.x * velocity
	



func _on_Timer_timeout():
	$LifeTimer.start()
