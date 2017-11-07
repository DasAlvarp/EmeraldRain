extends ItemList

#probably going to have to implement a CSVreader for tools, or at least this is what it's looking like
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_max_columns(10)