class player:
	var character #paths to char will be generated.
	var skin
	var inputReader
	
	var hp
	var maxHp
	var xVelocity
	var yVelocity
	var dirFacing
	var physics

	var state
	var statelock
	
	var resource
	
	var meter
	var maxMeter
	
	var flow

	func _init(playerNum, controllerNum, character, skin, buttonMaps):
		self.inputReader = load("res://Scripts/Implemented/Universal/InputReader.gd").InputReader.new(controllerNum, buttonMaps[0], buttonMaps[1], buttonMaps[2], buttonMaps[3], 15, playerNum != 0)#if it's not player1, it's not flipped 
		self.character = load("res://Scripts/Implemented/" . character . "/Controller.gd").Controller.new(skin, inputReader)
		