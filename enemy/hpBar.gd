extends TextureProgress


export var parent_path: NodePath = ""
onready var parent = get_node(parent_path)

func _ready():
	max_value = parent.hp
	value = parent.hp


func _process(delta):
	
	pass

#func _physics_process(delta):
#	rect_global_rotation = Vector2.RIGHT
#	global_rotation = Vector2.RIGHT
