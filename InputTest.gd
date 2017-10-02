extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var InputReader = load("./InputReader.gd")

var reader
var reader2


func _ready():
	var aButtons = [2]
	var bButtons = [0, 5]
	var cButtons = [3, 5]
	var dButtons = [1]
	reader = InputReader.InputReader.new(0, aButtons, bButtons, cButtons, dButtons, 15)
	reader2 = InputReader.InputReader.new(1, aButtons, bButtons, cButtons, dButtons, 15)
	# Called every time the node is added to the scene.
	# Initialization here

	set_process(true)
	pass
	
func _process(delta):
	reader.updateBuffer()
	reader2.updateBuffer()
	get_node("Control/P1Input").set_text(reader.getDisplayBuffer())
	get_node("Control/P2Input").set_text(reader2.getDisplayBuffer())