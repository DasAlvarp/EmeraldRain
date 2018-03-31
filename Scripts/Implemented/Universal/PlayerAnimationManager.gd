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
		self.animationList = CSVreader.CSVreader.new("res://Assets/Character/" + character + "/Animations/animations.csv")
		self.sprite = sprite
		
		#preload all the things
		for x in range(animationList.getNumRows()):
			animations.append(load("res://Assets/Character/" + character + "/Animations/1/" + animationList.getEntry("path", x)))
			animationNumbers.append(animationList.getEntry("animNum", x))

	#draw at x, y,
	func draw(x, y, desc):
		sprite.set_texture(animations[desc]) #animationList.getEntry("animNum",desc) animationNumbers[desc]
		#sprite.set_position(Vector2(x, y))