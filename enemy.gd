extends Ship

class_name Enemy

onready var hpBar = $HpBar


func _ready():
	hpBar.max_value = hp


func _physics_process(delta):
	._physics_process(delta)


func damage(amt:float):
	hpBar.show()
	.damage(amt)
	hpBar.value = hp
