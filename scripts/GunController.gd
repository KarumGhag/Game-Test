extends Sprite2D

@onready var gameState = get_node("/root/GameState")

@onready var player = $".."
@onready var playerPos = player.position
@onready var sprite = $"."



var ak47 = preload("res://art/guns/ak47.png")
var pistol = preload("res://art/guns/pistol.png")
var rifle = preload("res://art/guns/rifle.png")

var guns = [ak47, pistol, rifle]
var gunStr = ["ak47", "pistol", "rifle"]

var lastGun = len(guns) - 1
var currentGun = 0
var nextGun = 1

var nextGunUpdate = 1
var lastGunUpdate = len(guns) - 1

var swapTimer = 0
var swapTimeStarted = false
var canSwap = true
	

func _process(delta):
	sprite.texture = guns[currentGun]
	
	var playerPosX = player.position.x
	var mousePosX = get_global_mouse_position().x
	look_at(get_global_mouse_position())
	if playerPosX > mousePosX:
		flip_v = true
	else:
		flip_v = false
	
	if canSwap:
		if Input.is_action_just_pressed("changeGunDown"):

			if (currentGun + 1) != len(guns):
				currentGun += 1
			else:
				currentGun = 0
				
			if (nextGun + 1) != len(guns):
				nextGun += 1
			else:
				nextGun = 0
			updateNext()
			canSwap = false
			swapTimeStarted = true
			swapTimer = 0
			
		if Input.is_action_just_pressed("changeGunUp"):
			if (currentGun - 1) != -1:
				currentGun -= 1
			else:
				currentGun = len(guns) - 1
			if (lastGun - 1) != -1:
				lastGun -= 1
			else:
				lastGun = (len(guns) - 1)
			updateNext()
			canSwap = false
			swapTimeStarted = true
			swapTimer = 0
			
	else:
		if swapTimeStarted:
			swapTimer += delta
		if swapTimer >= 0.1:
			canSwap = true
			swapTimeStarted = false


	gameState.updateGun(currentGun, nextGunUpdate, lastGunUpdate)

func updateNext():
	if (currentGun + 1) >= len(guns):
		nextGunUpdate = 0
	else:
		nextGunUpdate = currentGun + 1
	if (currentGun - 1) <= -1:
		lastGunUpdate = len(guns) - 1
	else:
		lastGunUpdate = currentGun - 1
		

	

