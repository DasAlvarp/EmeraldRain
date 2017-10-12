class player:
	var character #paths to char will be generated.
	var skin
	var inputReader
	
	var hp
	var maxHp
	var xVelocity
	var yVelocity
	var xPos
	var yPos
	var otherChar #true if other char is to the RIGHt
	var dirFacing	#true if facing to the RIGHT
	var physics

	var state
	var statelock
	
	var resource
	
	var meter
	var maxMeter
	
	var friction
	
	var weight
	var maxWeight
	
	var flow

	func _init(playerNum, controllerNum, character, skin, buttonMaps):
		self.inputReader = load("res://Scripts/Implemented/Universal/InputReader.gd").InputReader.new(controllerNum, buttonMaps[0], buttonMaps[1], buttonMaps[2], buttonMaps[3], 15, playerNum != 0)#if it's not player1, it's not flipped 
		self.character = load("res://Scripts/Implemented/" . character . "/Controller.gd").Controller.new(skin, inputReader)
		self.skin = skin
		self.maxHp = self.character.getMaxHp()
		self.hp = maxHp
		self.xVelocity = 0
		self.yVelocity = 0
		self.dirFacing = playerNum != 0
		self.otherChar = playerNum != 0
		self.physics = false #this means it's on the ground
		self.state = 0
		self.statelock = 0
		self.resource = self.character.getStartingRes()
		self.maxMeter = self.character.getMaxMeter()
		self.meter = self.character.getStartingMeter()
		self.flow = self.character.getStartingFlow()
		self.maxWeight = self.character.getMaxWeight()
		self.weight = self.maxWeight
		self.friction = true