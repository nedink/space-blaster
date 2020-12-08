tool
extends Node2D

export (Resource) var poly_1
export var copy_poly = false setget set_copy


func set_copy(val):
	Polygon2D
	copy_poly = val
	print(copy_poly)


func copy_polygon(node1, node2):
	var polygon = node1.polygon.uv
	node2.polygon.uv = polygon
