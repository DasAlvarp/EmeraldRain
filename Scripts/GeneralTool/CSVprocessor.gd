class CSVprocessor:
	var path
	var file

	var table
	var columns
	var rows
	
	func _init(path):
		self.path = path
		self.file = File.new()
		file.open(path, file.READ)
		self.columns = file.get_csv_line(",")
		self.table = []
		self.rows = []
		#fill things
		while(!file.eof_reached()):
			var line = file.get_csv_line(",")
			self.table.append(line)