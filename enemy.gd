extends Node2D

class_name Enemy

# pixels per 1/60 second
export var speed = 1
export var hp = 10

onready var hpBar = $HpBar
onready var body = $Body


func _ready():
	hpBar.max_value = hp


func _physics_process(delta):
	$Path2D/PathFollow2D.offset += speed
	body.transform = $Path2D/PathFollow2D.transform


func damage(amt:float):
	hpBar.show()
	hp -= amt
	if hp < 1:
		queue_free()
	hpBar.value = hp
