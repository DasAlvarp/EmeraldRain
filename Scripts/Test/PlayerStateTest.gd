extends Node2D

var player
var keys


func _ready():
	keys = []
	keys.append([85])
	keys.append([73])
	keys.append([79])
	keys.append([80])
	
	player = load("res://Scripts/Implemented/Player/Player.gd").Player.new(0, 0, "Em", 0, keys)
	
	set_process(true)


func _process(delta):