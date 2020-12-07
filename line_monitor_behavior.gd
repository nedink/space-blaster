extends Path2D

var vertex = 0


func _physics_process(delta):
	step(delta)


func step(delta): 
	$PathFollow2D.offset += 80 * delta
#	pass
	# enemies follow line already
	# move offset toward vector
#	if not $Tween.is_active():
#		$Tween.interpolate_property($PathFollow2D, "offset", curve.get_point_position(vertex), curve.get_point_position(vertex + 1), 0.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
#		$Tween.start()
	
	
#	if $Tween.interpol
	# when @ vector:
	# if @ end vector:
	# done
	# else:
	# turn toward player
	# shoot n times
	# turn back to path
	# go next leg


func _on_Tween_tween_completed(object, key):
	vertex += 1
	if vertex >= curve.get_point_count():
		vertex = 0
