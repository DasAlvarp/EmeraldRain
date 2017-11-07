tool
extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _enter_tree():
	# Called every time the node is added to the scene.
	# Initialization here
	connect("pressed", self, "clicked")

func clicked():
	print("been clicked")
