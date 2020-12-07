extends TextureProgress




func _ready():
	max_value = get_parent().hp
	value = get_parent().hp


func _process(delta):
	pass

#func _physics_process(delta):
#	rect_global_rotation = Vector2.RIGHT
#	global_rotation = Vector2.RIGHT
