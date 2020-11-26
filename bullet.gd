extends Node2D

class_name Bullet


export (float, 0, 100) var velocity = 10
export var damage = 1.0;

onready var world = get_tree().root.get_node("World")
onready var gun = get_parent()
onready var ship = gun.get_parent()


func _ready():
	$Trajectory.collision_mask = ship.body.collision_mask



func _physics_process(delta):
	# scal to velocity
	$Trajectory.cast_to = $Trajectory.cast_to.normalized() * velocity
	# test raycast
	if $Trajectory.is_colliding():
		var collider:Node2D = $Trajectory.get_collider()
		collider.get_parent().damage(damage)
		position = $Trajectory.get_collision_point()
		# reparent emitter
		var particles = $ParticleTrail
		remove_child(particles)
		world.add_child(particles)
		particles.owner = world
		particles.emitting = false
		particles.one_shot = true
		particles.get_node("LifeTimer").start(1)
		
		queue_free()
	# move 
	else:
		position += transform.x * velocity
	
	if $LifeTimer.is_stopped():
		queue_free()

