class InputReader:
	var deviceNum
	
	var aList
	var bList
	var cList
	var dList
	
	var buffSize
	
	#horizontal and vertical dir buffers
	var hBuffer
	var vBuffer
	
	#a buffers. Held = 1. Pressed = 2, nothing = 0, released = -1 
	var aPressedBuffer
	var bPressedBuffer
	var cPressedBuffer
	var dPressedBuffer


	func _init(deviceNum, aList, bList, cList, dList, bufferLen):
		self.deviceNum = deviceNum
		self.aList = aList
		self.bList = bList
		self.cList = cList
		self.dList = dList
		
		self.aPressedBuffer = []
		self.bPressedBuffer = []
		self.cPressedBuffer = []
		self.dPressedBuffer = []
		self.hBuffer = []
		self.vBuffer = []
		
		for x in range(bufferLen):
			self.aPressedBuffer.append(0)
			self.bPressedBuffer.append(0)
			self.cPressedBuffer.append(0)
			self.dPressedBuffer.append(0)
			self.hBuffer.append(0)
			self.vBuffer.append(0)


	#returns directions in anime notation. Not used for anything but display.
	func getDirNum(horizontal, vertical):
		return (horizontal + 2) + (vertical + 1) * 3


	#updates this guy.
	func updateBuffer():
		#first, we take everything off the end of the buffer
		for x in range(hBuffer.size() - 1):
			aPressedBuffer[x] = aPressedBuffer[x+1]
			bPressedBuffer[x] = bPressedBuffer[x+1]
			cPressedBuffer[x] = cPressedBuffer[x+1]
			dPressedBuffer[x] = dPressedBuffer[x+1]
			hBuffer[x] = hBuffer[x+1]
			vBuffer[x] = vBuffer[x+1]
			
		hBuffer[-1] = getDirectional(15, 14)#15 is right, 14 is left
		vBuffer[-1] = getDirectional(12, 13)#12 is up, 13 is down
		aPressedBuffer[-1] = getVirtualButton(1, aPressedBuffer[-2])
		bPressedBuffer[-1] = getVirtualButton(2, bPressedBuffer[-2])
		cPressedBuffer[-1] = getVirtualButton(3, cPressedBuffer[-2])
		dPressedBuffer[-1] = getVirtualButton(4, dPressedBuffer[-2])


	#returns a string of the buttons pressed.
	func getDisplayBuffer():
		var displayMe = ""
		for x in range(hBuffer.size()):
			displayMe = displayMe + str(getDirNum(hBuffer[x], vBuffer[x]))
			displayMe = displayMe + getButtonLetter("a", aPressedBuffer[x])
			displayMe = displayMe + getButtonLetter("b", bPressedBuffer[x])
			displayMe = displayMe + getButtonLetter("c", cPressedBuffer[x])
			displayMe = displayMe + getButtonLetter("d", dPressedBuffer[x])
			displayMe = displayMe + "\n"
		return displayMe


	func getButtonLetter(letter, pressiness):
		if(pressiness < 1):
			return ""
		elif(pressiness == 1):
			return letter
		else:
			return letter.to_upper()


	func getDirectional(positiveID, negativeID):
		var dirNum = 0
		if(Input.is_joy_button_pressed(deviceNum, positiveID)):
			dirNum += 1
		elif(Input.is_joy_button_pressed(deviceNum, negativeID)):
			dirNum -= 1
		return dirNum


	func getVirtualButton(buttonArrNum, prevState):
		#this determines which button list to iterate through
		var buttonList
		if(buttonArrNum == 1):
			buttonList = aList
		elif(buttonArrNum == 2):
			buttonList = bList
		elif(buttonArrNum == 3):
			buttonList = cList
		elif(buttonArrNum == 4):
			buttonList = dList
		else:
			return 0
		
		var isDown = getVirtualButtonDown(buttonList)
		if(prevState < 1):
			if(isDown):
				return 2
			else:
				return 0
		else:
			if(isDown):
				return 1
			else:
				return -1


	#just checking if the button is down. Return true if it's down, but there might be others if it isn't.
	func getVirtualButtonDown(buttonList):
		for x in buttonList:
			if(Input.is_joy_button_pressed(deviceNum, x)):
				return true
		return false