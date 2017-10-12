class Controller:
	var inputReader
	var skin

	var stateTable
	var inputTable#will be array of N tables of all the cancel states. Every cahracter will have at least 15: 4 for normals (a->a+, b->c+. c->d+, d->sp+, sp->super, dashing forward, standing, techable states, and all of this shit for air. That's assuming the state is cancellable.
	var inputTranslator


	func _init(skin, inputReader):
		self.skin = skin
		self.inputReader = inputReader
		self.inputTranslator = load("res://Scripts/Implemented/Universal/InputTranslator.gd").InputTranslator.new(inputTable[0], inputReader)


	#not following my formatting form b/c these functions are too basic
	func getMaxHp():
		return 1000

	func getMaxMeter():
		return 3

	func getStartingRes():
		return 1

	func getStartingFlow():
		return 1

	func getMaxWeight():
		return 400


	func getState(state, statelock, meter, resources, grounded, flow):
		if(statelock > 0):
			#calculate stuff
			if(grounded && state > 4500):#aerial hitstun to the ground should end in a grounded state
				return KNOCKDOWN#probably make a universal knockdown state.
		else:
			#return to neutral state.