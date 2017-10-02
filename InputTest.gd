extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var InputReader = load("./InputReader.gd")

var reader
	
func _ready():
	var aButtons = [2]
	var bButtons = [0]
	var cButtons = [1]
	var dButtons = [3]
	reader = InputReader.InputReader.new(0, aButtons, bButtons, cButtons, dButtons, 15)
	# Called every time the node is added to the scene.
	# Initialization here
	print(reader.deviceNum)
	set_process(true)
	pass
	
func _process(delta):
	reader.updateBuffer()
	get_node("Control/P1Input").set_text(reader.getDisplayBuffer())