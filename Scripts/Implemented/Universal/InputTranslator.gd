class InputTranslator:
	var moveList
	var inputReader


	func _init(moveList, inputReader):
		self.moveList = moveList
		self.inputReader = inputReader


	func updateList(moveList):
		self.moveList = moveList


	func getGesture():
		var size = moveList.getRows()
		for input in size:
			var moveState = getMove(moveList.getRow(input))
			if(moveState > 0):
				return moveState
		return -1


	func getMove(row):
		var gesture = moveList.getEntry("direction", row)
		var stickiness = gesture[-1]
		#for reading buttons:
		#if a button is pressed, check for 2s.
		#if the button state doesn't matter, check for 0s
		#if the button needs to be down, check for 1s.
		#if the button needs to be up check for -1s.
		#if the button needs to be released, check for -2s.