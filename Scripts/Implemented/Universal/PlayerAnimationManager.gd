class PlayerAnimationManager:
	var character
	var skin
	
	var sprite
	
	var animationList
	var CSVreader = load("res://Scripts/Implemented/Universal/CSVreader.gd")
	var animations = []
	var animationNumbers = []


	func _init(character, skin, sprite):
		self.skin = skin
		self.character = character
		self.animationList = CSVreader.CSVreader.new("res://Assets/Character/" + character + "/animations.csv")
		self.sprite = sprite
		
		#preload all the things
		for x in range(animationList.getNumRows()):
			animations.append(load(animationList.getEntry("path", x)))
			animationNumbers.append(animationList.getEntry("animNum", x))

	func draw(x, y, desc):
		sprite.set_texture(animations[animationList.getEntry("animNum", animationNumbers[int(desc)])])
		sprite.set_position(Vector2(x, y))