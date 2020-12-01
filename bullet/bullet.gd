extends Node2D

class_name Bullet

var lifeTimerScene = preload("res://LifeTimer.tscn")

export (float, 0, 100) var velocity = 10
export var damage = 1.0;

onready var world = get_tree().root.get_node("World")
onready var gun = get_parent()
onready var ship = gun.get_parent()
onready var trail = $ParticleTrail


func _ready():
	$Trajectory.collision_mask = ship.body.collision_mask
	$MuzzleFlash.emitting = true
	$ParticleTrail.angle = rad2deg(sin(global_rotation))
#	$ParticleTrail.angular_velocity = rand_range(-800, 800)
#	print(global_rotation)



func _physics_process(delta):
	# scal to velocity
	$Trajectory.cast_to = $Trajectory.cast_to.normalized() * velocity
	# test raycast
	if $Trajectory.is_colliding():
		var collider:Node2D = $Trajectory.get_collider()
		collider.get_parent().damage(damage)
		position = $Trajectory.get_collision_point()
#		position = $Trajectory.get_collision_point()
		# reparent emitter
		var particles = $ParticleTrail
		remove_child(particles)
		world.add_child(particles)
		particles.owner = world
		particles.emitting = false
		particles.one_shot = true
		var lifeTimer = lifeTimerScene.instance()
		add_child(lifeTimer)
#		particles.get_node("LifeTimer").start(1)
		
		queue_free()
	# move 
	else:
		position += transform.x * velocity
#		position += transform.x * velocity
	
	if $LifeTimer.is_stopped():
		queue_free()

