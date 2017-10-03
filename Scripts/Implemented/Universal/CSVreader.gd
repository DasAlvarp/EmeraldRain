class CSVreader:
	var dictionary
	var path
	var file
	var headers

	func _init(path):
		self.path = path
		self.file = File.new()
		file.open(path, file.READ)
		self.headers = file.get_csv_line(",")


	func getColumns():
		var cols = ""
		for header in headers:
			cols = cols + header + ", "
		return cols