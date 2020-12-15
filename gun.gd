extends Position2D

class_name Gun

export var bulletScene = preload("res://bullet/Bullet.tscn")
#export var muzzleFlashScene = preload("res://MuzzleFlash.tscn")
export var firing = false
export var repeating = false
export var cooldownTime = 0.2
export var spread = 0.0
export var splits = 1
export var velocityRatio = 1
export var muzzleVelocity = 100



onready var world = get_tree().root.get_node("World")
onready var ship = get_parent()


func _ready():
	$CooldownTimer.wait_time = cooldownTime


func _physics_process(delta):
	if firing and $CooldownTimer.is_stopped():
		fire()
		$CooldownTimer.start()
	
#	if Input.is_action_pressed("primary"):
#		if repeating:
#			if $CooldownTimer.is_stopped():
#				fire()
#				$CooldownTimer.start()
#			else:
#				pass
	
#	if Input.is_action_just_pressed("primary"):
#		fire()
	


func fire():
	for s in splits:
		# choose angle, based on 
#		var angle = 
		
		var bullet = bulletScene.instance()
		bullet.set_as_toplevel(true)
		bullet.global_transform = global_transform
		bullet.velocity = muzzleVelocity
		add_child(bullet)
	
#	var muzzleFlash = muzzleFlashScene.instance()
#	muzzleFlash.emitting = true
#	muzzleFlash.one_shot = true
#	muzzleFlash.initial_velocity
#	muzzleFlash.global_transform = global_transform
#	world.add_child(muzzleFlash)

#	add_child(muzzleFlash)
#	$Particles.restart()
	
