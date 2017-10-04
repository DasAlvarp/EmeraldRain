class CSVreader:
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
			self.rows.append(line[0])


	#returns the integer index of array
	func getIndex(stringArray, entry):
		var index = 0
		for string in stringArray:
			if(string == entry):
				return index
			index += 1


	func printColumns():
		var cols = ""
		for header in columns:
			cols = cols + header + ", "
		return cols


	func printRows():
		var rows = ""
		for entry in table:
			for point in entry:
				rows = rows + point + ", "
			rows = rows + "\n"
		return rows


	#returns (very) obfiscated column number
	func getColumnNumber(colName):
		return getIndex(columns, colName)


	#gets the obfiscated row number
	func getRowNumber(index):
		return getIndex(rows, str(index))


	func getNumRows():
		return rows.size()


	#returns entry at position.
	func getEntry(colName, rowNumber):
		return table[getRowNumber(rowNumber)][getColumnNumber(colName)]