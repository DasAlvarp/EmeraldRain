extends ItemList

#probably going to have to implement a CSVreader for tools, or at least this is what it's looking like
var CSVproc = load("res://Scripts/GeneralTool/CSVprocessor.gd")

var csv

func _ready():
		# Called every time the node is added to the scene.
	# Initialization here
	self.set_max_columns(20)
	
func generate(path):
	csv = CSVproc.CSVprocessor.new(path)