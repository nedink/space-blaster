extends CPUParticles2D

class_name ParticleTrail



func _on_Timer_timeout():
	queue_free()
