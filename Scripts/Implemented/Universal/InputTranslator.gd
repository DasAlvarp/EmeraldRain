class InputTranslator:
	var moveList
	var inputReader


	func _init(moveList, inputReader):
		self.moveList = moveList
		self.inputReader = inputReader


	func updateList(moveList):
		self.moveList = moveList


	func getGesture():
		var size = moveList.getNumRows()
		for input in range(size):
			#holy shit htis is hella hard. 
			