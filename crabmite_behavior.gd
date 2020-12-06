extends Node2D

enum State {
	MOVING,
	FIRING
}

export var state = State.MOVING setget set_state, get_state 

var move_step = Vector2()
var target_pos = Vector2()

onready var player = get_tree().root.get_node("World/Player")
onready var ship = get_parent()

# move forward on tween
# 

func _physics_process(delta):
	if state == State.MOVING:
#		var move = move_toward(ship.rotation, lerp_angle(ship.rotation, ship.get_angle_to(player.position), 1), 0.1)
#		lerp_angle()
#		ship.velocity = Vector2.RIGHT.rotated(ship.rotation) * 100
		var diff = ship.position.angle_to_point(player.position) - ship.rotation
#		ship.rotation = diff
		
#		ship.rotation = move_toward(ship.rotation, ship.position.angle_to_point(player.position), 0.1) 
#		ship.rotation = diff
#		if ship.rotation - ship.position.angle_to_point(player.position) < TAU:
#		else:
#			ship.rotate(0.1)
#		ship.rotate(move)
#		ship.look_at(ship.position + move_step)
#		if ship.position.distance_to(player.position) < 64:
#			$Tween.interpolate_property(ship, "position", ship.position, ship.position + ship.velocity.normalized() * 8, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
#			$Tween.start()
#			set_state(State.FIRING)
		
	if state == State.FIRING:
		get_parent().velocity = Vector2()
	
	ship.velocity = move_step
	



#func _on_Tween_tween_completed(object, key):
#	# look at player, shoot
#	pass

func set_state(s):
	state = s
	if state == State.MOVING:
		# position minus the bit on the way back to 
		
		target_pos = Vector2(rand_range(0, get_viewport_rect().end.x), rand_range(0, get_viewport_rect().end.y))
		var normalized = (target_pos - ship.position).normalized()
#		var rot_to_target = ship.position.angle_to_point(player.position)
		$Tween.interpolate_method(ship, "move_and_slide", normalized, normalized * 100, 1, Tween.TRANS_CUBIC, Tween.EASE_IN)
		$Tween.interpolate_method(ship, "move_and_slide", normalized * 100, normalized, 1, Tween.TRANS_CUBIC, Tween.EASE_OUT, 1)
		$Tween.start()
#		$Tween.interpolate_property(ship, "speed", 0, 200, 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN)
		
		$MovingTimer.start()
#		move_step = (player.position - ship.position).normalized() * 100
	if state == State.FIRING:
		$FiringTimer.start()
#		move_step = Vector2()
	

func get_state():
	return state

func _on_MovingTimer_timeout():
	set_state(State.FIRING)

func _on_FiringTimer_timeout():
	set_state(State.MOVING)
