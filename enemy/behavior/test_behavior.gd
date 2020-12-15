extends Node2D

enum State {
	MOVING,
	AIMING,
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
		if (target_pos - ship.position).length() < 50:
			set_state(State.AIMING)
		else:
			pass
#			ship.look_at(target_pos)
#			ship.move_and_slide(Vector2.RIGHT.rotated(ship.get_angle_to(target_pos)) * 50)
		
	if state == State.AIMING:
		pass
#		ship.
		
	if state == State.FIRING:
		pass
#		ship.velocity = Vector2()
	
#	ship.velocity = move_step
	



#func _on_Tween_tween_completed(object, key):
#	# look at player, shoot
#	pass

func set_state(s):
	state = s
	if state == State.MOVING:
		# pick random location
		target_pos = Vector2(rand_range(0, get_viewport_rect().end.x), rand_range(0, get_viewport_rect().end.y))
#		ship.get_node("Gun").firing = false
		$FiringTimer.stop()
		$AimingTimer.stop()
		$MovingTimer.start()
	
	if state == State.AIMING:
		# pick player position
		target_pos = player.position
#		ship.get_node("Gun").firing = false
		$FiringTimer.stop()
		$MovingTimer.stop()
		$AimingTimer.start()
	
	if state == State.FIRING:
#		ship.get_node("Gun").firing = true
		$MovingTimer.stop()
		$AimingTimer.stop()
		$FiringTimer.start()
	

func get_state():
	return state

func _on_MovingTimer_timeout():
	set_state(State.FIRING)

func _on_FiringTimer_timeout():
	set_state(State.MOVING)
