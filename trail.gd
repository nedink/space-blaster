tool
extends Particles2D

class_name ParticleTrail

export var velocity = 1.0 setget set_velocity


func set_velocity(vel):
	velocity = vel
	process_material.initial_velocity = vel
