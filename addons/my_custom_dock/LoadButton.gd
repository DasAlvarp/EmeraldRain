extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	pass

func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		get_node("../ErrorMsg").set_text("hi")
		get_node("../ItemList").generate(get_node("../Path").get_text())