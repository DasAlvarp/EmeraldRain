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
		self.dictionary = []
		while(!file.eof_reached()):
			self.dictionary.append(file.get_csv_line(","))


	func printColumns():
		var cols = ""
		for header in headers:
			cols = cols + header + ", "
		return cols


	func printRows():
		var rows = ""
		for entry in dictionary:
			for point in entry:
				rows = rows + point + ", "
			rows = rows + "\n"
		return rows