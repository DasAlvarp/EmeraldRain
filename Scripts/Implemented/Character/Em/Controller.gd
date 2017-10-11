class Controller:
	var inputReader
	var skin


	func _init(skin, inputReader):
		self.skin = skin
		self.inputReader = inputReader
	
	func getMaxHp():
		return 1000


	func getMaxMeter():
		return 3


	func getStartingRes():
		return 1


	func getStartingFlow():
		return 1