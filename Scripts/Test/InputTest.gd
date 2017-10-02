extends Node2D

var InputReader = load("res://Scripts/Implemented/Universal/InputReader.gd")

var reader
var reader2


func _ready():
	#how button maps are registered. In an actual game, this would be set semi-dynamically at the start.
	var aButtons = [2]
	var bButtons = [0, 5]
	var cButtons = [3, 5]
	var dButtons = [1]
	#initialize controllers. They will do things
	reader = InputReader.InputReader.new(0, aButtons, bButtons, cButtons, dButtons, 15, false)
	reader2 = InputReader.InputReader.new(1, aButtons, bButtons, cButtons, dButtons, 15, true)
	set_process(true)


func _process(delta):
	#check controllers
	reader.updateBuffer()
	reader2.updateBuffer()
	#display output
	get_node("Control/P1Input").set_text(reader.getDisplayBuffer())
	get_node("Control/P2Input").set_text(reader2.getDisplayBuffer())