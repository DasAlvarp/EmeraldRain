class Player:
	var character #paths to char will be generated.
	var skin
	var inputReader
	
	var hp
	var maxHp
	var xVelocity
	var yVelocity
	var xPos
	var yPos
	var otherChar #true if other char is to the RIGHT
	var dirFacing#true if facing to the RIGHT
	var canTurn
	var physics

	var counterHit
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
		self.character = load("res://Scripts/Implemented/Character/" + character + "/Controller.gd").Controller.new(skin, inputReader)
		self.skin = skin
		self.maxHp = self.character.getMaxHp()
		self.hp = maxHp
		xVelocity = 0
		yVelocity = 0
		dirFacing = playerNum != 0
		otherChar = playerNum != 0
		canTurn = true
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
		self.counterHit = false


	#returns weight for hitstun decay, etc.
	func getWeight():
		return weight


	#updates player info.
	func updatePlayerInfo():
		state = character.character.getState(state, statelock, meter, resource, physics, flow)
		statelock -= 1


	#this is the part that the big controller would control
	func hitPlayer(damage, hitType, hitstun, xPow, yPow):
		hp -= damage