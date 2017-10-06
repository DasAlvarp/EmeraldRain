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
			var moveState = getMove(int(input))
			if(moveState > 0):
				return moveState
		return -1


	func getMove(row):
		var gesture = moveList.getEntry("direction", row)
		#for reading buttons:
		#if a button is pressed, check for 2s.
		#if the button state doesn't matter, check for 0s
		#if the button needs to be down, check for 1s.
		#if the button needs to be up check for -1s.
		#if the button needs to be released, check for -2s.
		#buffer[0] = aPressedBuffer
		#buffer[1] = bPressedBuffer
		#buffer[2] = cPressedBuffer
		#buffer[3] = dPressedBuffer
		#buffer[4] = getDirectionalBuffer()
		
		#first make sure inputs are fine. Only have to worry about f1, so yeah.
		var inputs = inputReader.getReadBuffer()
		var a = moveList.getEntry("a", row)
		var b = moveList.getEntry("b", row)
		var c = moveList.getEntry("c", row)
		var d = moveList.getEntry("d", row)
		
		#for now, we'll just care about button pressed
		if(getButtonInput(a, str(inputs[0][-1])) && getButtonInput(b, str(inputs[1][-1])) && getButtonInput(c, str(inputs[2][-1])) && getButtonInput(d, str(inputs[3][-1]))):
			if(matchGesture(gesture, inputs)):
				return moveList.getEntry("state", row)
			else:
				print("oop" + inputReader.getDisplayBuffer())
				return -1
		else:
			return -1


	func matchGesture(gesture, inputs):
		var stickiness = gesture.right(gesture.length() - 1)
		var gestureContents = getTop(gesture.substr(0, gesture.length() - 1))
		var gestureKillers = gestureContents[1]
		var topIndex = gestureContents[0]
		gesture = gestureContents[2]
		for direction in range(inputs[4].size() - 1):
			if(gestureKillers.has(str(inputs[4][-direction]))):
				return false
			elif(topIndex == str(direction)):
				gestureContents = getTop(gesture.substr(0, gesture.length()))
				gestureKillers = gestureContents[1]
				topIndex = gestureContents[0]
				gesture = gestureContents[2]
				if(gesture.length() == 0):
					return true
		
		return false


	func getTop(gesture):
		var gestureKillers = []
		var inBrackets = false
		for negIndex in range(gesture.length() - 1):
			var topChar = gesture.substr(gesture.length() - (1 + negIndex), 1)
			if(topChar == "]"):
				inBrackets = true
			elif(topChar == "["):
				inBrackets = false
			elif(inBrackets):
				gestureKillers.append(topChar)
			else:
				var returnMe = []
				returnMe.append(topChar)
				returnMe.append(gestureKillers)
				returnMe.append(gesture.substr(0, gesture.length() - negIndex))
				return returnMe
	
	
	func getButtonInput(buttonLetter, realInput):
		if(buttonLetter != "0"):
			if(buttonLetter == str(realInput)):
				return true
			else:
				return false
		else:
			return true