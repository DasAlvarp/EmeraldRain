extends Node2D

var player
var keys


func _ready():
	keys = []
	keys.append([85])
	keys.append([73])
	keys.append([79])
	keys.append([80])
	
	player = load("res://Scripts/Implemented/Player/Player.gd").Player.new(0, -1, "Em", 0, keys, get_node("Player"))
	
	set_process(true)


func _process(delta):
	player.updatePlayerInfo()
	get_node("Control/Label").set_text(str(player.getState()))