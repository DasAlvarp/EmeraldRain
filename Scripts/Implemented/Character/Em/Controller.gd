class Controller:
	var inputReader
	var skin

	var stateTable
	var inputTable#will be array of N tables of all the cancel states. Every cahracter will have at least 14: 4 for normals (a->a+, b->c+. c->d+, d->sp+, sp->super, dashing forward, standing, and all of this shit for air. That's assuming the state is cancellable.
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


	func getState(state, meter, resources, grounded):
		