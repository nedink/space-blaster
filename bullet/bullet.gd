extends Node2D

class_name Bullet

var lifeTimerScene = preload("res://LifeTimer.tscn")

export var velocity = 10
export var acceleration = 0
export var damage = 1.0;

export var speed = 1.0



onready var gun = get_parent()
onready var ship = gun.get_parent()


func _ready():
	
	
	$Trajectory.collision_mask = ship.body.collision_mask
	$ParticleTrail.angle = rad2deg(sin(global_rotation))
#	$ParticleTrail.angular_velocity = rand_range(-800, 800)
#	print(global_rotation)



func _physics_process(delta):
#	for enemy in get_tree().get_nodes_in_group("enemy"):
		# pull toward enemy
#		velocity += Vector2.RIGHT.rotated(get_angle_to(enemy))
		

	# scal to velocity
	$Trajectory.cast_to = $Trajectory.cast_to.normalized() * velocity
	# test raycast
	if $Trajectory.is_colliding():
		var collider:Node2D = $Trajectory.get_collider().get_parent().damage(damage)
#		collider.get_parent().damage(damage)
#		world.add_child(self)
		position = $Trajectory.get_collision_point()
		$Sprite.hide()
		$LifeTimer.start()
		
		$ParticleTrail.emitting = false
		set_physics_process(false)
		
		# reparent trail
#		var trail = $ParticleTrail.duplicate()
#		var world = get_tree().root.get_node("World")
#		trail.emitting = false
#		trail.
#		var lifeTimer = lifeTimerScene.instance()
#		lifeTimer.wait_time = 4
#		trail.add_child(lifeTimer)
#		world.add_child(trail)
#		trail.owner = world
#		trail.global_transform = global_transform
#		remove_child(trail)
#		if trail:
#			trail.owner = world
#			trail.emitting = false
#			trail.one_shot = true

#		var lifeTimer = lifeTimerScene.instance()
#		lifeTimer.wait_time = $ParticleTrail
#		add_child(lifeTimer)
#		particles.get_node("LifeTimer").start(1)

#		$Trajectory.enabled = false
#		$Sprite.queue_free()
#		$LifeTimer.start()

#		queue_free()
	# move 
	else:
		position += transform.x * velocity * delta
#		velocity += acceleration * Engine.get_frames_per_second()
#		position += transform.x * velocity
	



func _on_Timer_timeout():
#	print("timeuot")
	$LifeTimer.start()
