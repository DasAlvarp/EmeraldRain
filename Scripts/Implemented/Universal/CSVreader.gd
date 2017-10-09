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


	#used to ID the table.
	func getPath():
		return self.path

	#returns the integer index of array
	func getIndex(stringArray, entry):
		var index = 0
		for string in stringArray:
			if(string == entry):
				return index
			index += 1


	#prints out the name of all cols
	func printColumns():
		var cols = ""
		for header in columns:
			cols = cols + header + ", "
		return cols


	#prints contents of all rows.
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


	#returns number of rows
	func getNumRows():
		return rows.size()


	#returns entry at position.
	func getEntry(colName, rowNumber):
		return table[getRowNumber(rowNumber)][getColumnNumber(colName)]


	#returns row numbers. For things with big spaces in the middle.
	func getRows():
		return rows


	#returns entire row. Remember it's just an array now.
	func getRow(rowNumber):
		return table[getRowNumber(rowNumber)]