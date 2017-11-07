class CSVprocessor:
	var path
	var file

	var table
	var columns
	var rows
	
	func _init(path):
		self.path = path
		self.file = File.new()
		if(file.file_exists(path)):
			get_node("../ErrorMsg").set_text("file found")
			file.open(path, file.READ)
			self.columns = file.get_csv_line(",")
			self.table = []
			self.rows = []
			#fill things
			while(!file.eof_reached()):
				var line = file.get_csv_line(",")
				self.table.append(line)
		else:
			get_node("../ErrorMsg").set_text("No file")