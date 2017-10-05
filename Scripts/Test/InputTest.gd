extends Node2D

var InputReader = load("res://Scripts/Implemented/Universal/InputReader.gd")
var CSVreader = load("res://Scripts/Implemented/Universal/CSVreader.gd")
var InputTranslator = load("res://Scripts/Implemented/Universal/InputTranslator.gd")
var reader
var reader2
var converter
var csv
var state


func _ready():
	#how button maps are registered. In an actual game, this would be set semi-dynamically at the start.
	var aButtons = [2]
	var bButtons = [0, 5]
	var cButtons = [3, 5]
	var dButtons = [1]
	#initialize controllers. They will do things
	csv = CSVreader.CSVreader.new("res://Assets/Test/GestureDemo.csv")
	reader = InputReader.InputReader.new(0, aButtons, bButtons, cButtons, dButtons, 15, false)
	reader2 = InputReader.InputReader.new(1, aButtons, bButtons, cButtons, dButtons, 15, true)
	converter = InputTranslator.InputTranslator.new(csv, reader)
	set_process(true)


func _process(delta):
	#check controllers
	reader.updateBuffer()
	reader2.updateBuffer()
	state = converter.getGesture()
	if(state != -1):
		get_node("Control/CSV").set_text(state)
	#display output

	get_node("Control/P1Input").set_text(reader.getDisplayBuffer())
	get_node("Control/P2Input").set_text(reader2.getDisplayBuffer())