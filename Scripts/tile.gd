extends StaticBody2D

var gray = preload("res://Assets/tile_gray.png")
var red = preload("res://Assets/tile_red.png")
var blue = preload("res://Assets/tile_blue.png")
var green = preload("res://Assets/tile_green.png")
var purple = preload("res://Assets/tile_purple.png")
var yellow = preload("res://Assets/tile_yellow.png")

onready var sprite = get_node("Sprite")
var score = 1


func _ready():
	if get_parent().name == "Gray Tiles":
		sprite.set_texture(gray)
	if get_parent().name == "Red Tiles":
		sprite.set_texture(red)
		score = 1
	if get_parent().name == "Blue Tiles":
		sprite.set_texture(blue)
		score = 1
	if get_parent().name == "Green Tiles":
		sprite.set_texture(green)
		score = 1
	if get_parent().name == "Purple Tiles":
		sprite.set_texture(purple)
		score = 1
	if get_parent().name == "Yellow Tiles":
		sprite.set_texture(yellow)
		score = 1

	
	