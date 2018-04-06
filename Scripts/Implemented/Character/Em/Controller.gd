class Controller:
	var inputReader
	var skin
	
	var InputTranslator = load("res://Scripts/Implemented/Universal/InputTranslator.gd")
	var AnimationManager = load("res://Scripts/Implemented/Universal/PlayerAnimationManager.gd")
	
	var stateTable
	var moveList#will be array of N tables of all the cancel states. Every cahracter will have at least 15: 4 for normals (a->a+, b->c+. c->d+, d->sp+, sp->super, dashing forward, standing, techable states, and all of this shit for air. That's assuming the state is cancellable.
	var inputTranslator
	var animations
	

	func _init(skin, inputReader, sprite):
		var CSVreader = load("res://Scripts/Implemented/Universal/CSVreader.gd")
		self.skin = skin
		self.inputReader = inputReader
		stateTable = CSVreader.CSVreader.new("res://Assets/Character/Em/Tables/States.csv")
		moveList = []
		moveList.append(CSVreader.CSVreader.new("res://Assets/Character/Em/Tables/Cancel/0.csv"))
		moveList.append(CSVreader.CSVreader.new("res://Assets/Character/Em/Tables/Cancel/1.csv"))
		moveList.append(CSVreader.CSVreader.new("res://Assets/Character/Em/Tables/Cancel/2.csv"))
		self.inputTranslator = InputTranslator.InputTranslator.new(moveList[0], inputReader)
		self.animations = AnimationManager.PlayerAnimationManager.new("Em", skin, sprite)


	#not following my formatting form b/c these functions are too basic
	func getMaxHp():
		return 1000

	func getMaxMeter():
		return 3

	func getStartingMeter():
		return 0

	func getStartingRes():
		return 1

	func getStartingFlow():
		return 1

	func getMaxWeight():
		return 400


	func getStatelock(state):
		return int(stateTable.getEntry("InitialStatelock", state))


	#updates cancel states, inputs.
	func updateCancels(state):
		var cancelNum = int(stateTable.getEntry("Cancel", state))
		if(cancelNum != -1):
			inputTranslator.updateList(moveList[cancelNum])


	#returns state. Probably should return vel. info, etc.
	func getState(state, statelock, meter, resources, grounded, flow):
		inputReader.updateBuffer()
		
		if(stateTable.getEntry("Cancel", state) != "-1"):
			var newState = inputTranslator.getGesture() 
			if(newState > -1):
				return newState
		
		if(statelock > -1):
			#calculate stuff
			if(grounded && state > 4500):#aerial hitstun to the ground should end in a grounded state
				return 2#Knockdown
			else:
				return state
		else:
			#go to autocancel state
			return int(stateTable.getEntry("AutoCancel", state))


	#draw state image at position.
	func draw(x, y, state):
		animations.draw(x, y, state) 