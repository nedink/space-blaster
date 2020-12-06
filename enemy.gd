extends KinematicBody2D

class_name Enemy

# pixels per 1/60 second
export var mass = 1.0
export var speed = 1.0
export var hp = 10
export var max_speed = Vector2(50, 50)

var velocity = Vector2()

onready var hpBar = $HpBar
onready var body = $Body
onready var path = get_parent().get_node("PathFollow2D")
onready var player = get_tree().root.get_node("World/Player")

var explosionScene = preload("res://Explosion.tscn")


func _ready():
	hpBar.max_value = hp


func _physics_process(delta):
#	velocity = (Vector2.RIGHT + Vector2.DOWN) * 20
#	var displace = Vector2(lerp(position.x, player.position.x, 0.9), lerp(position.y, player.position.y, 0.9)) - position
#	displace = Vector2(min(displace.x, max_speed.x), min(displace.y, max_speed.y))
#	look_at(player.position)
#	velocity += displace
#	print(velocity)
	velocity = velocity.normalized() * speed
	var movement = move_and_slide(velocity)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider is Player:
			collision.collider.move_and_slide(velocity - movement)
			move_and_slide(velocity - movement)
			break
	
	


func damage(amt:float):
	hpBar.show()
	hp -= amt
	if hp < 1:
		var explosion = explosionScene.instance()
		explosion.global_position = global_position
		get_tree().root.get_node("World").add_child(explosion)
		queue_free()
	hpBar.value = hp


#func _draw():
#	draw_arc()
