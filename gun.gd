extends Position2D

class_name Gun

export var bulletScene = preload("res://Bullet.tscn")
export var muzzleFlashScene = preload("res://MuzzleFlash.tscn")
export var repeating = false
export var cooldownTime = 0.2

onready var ship = get_parent()


func _ready():
	$CooldownTimer.wait_time = cooldownTime



func _physics_process(delta):
	if Input.is_action_pressed("primary"):
		if repeating:
			if $CooldownTimer.is_stopped():
				fire()
				$CooldownTimer.start()
			else:
				pass
	
	if not repeating && Input.is_action_just_pressed("primary"):
		fire()


func fire():
	var bullet = bulletScene.instance()
	bullet.set_as_toplevel(true)
	bullet.global_transform = global_transform
	add_child(bullet)
	
	var muzzleFlash = muzzleFlashScene.instance()
	muzzleFlash.emitting = true
	muzzleFlash.one_shot = true
	muzzleFlash.initial_velocity
	add_child(muzzleFlash)
#	$Particles.restart()
	
