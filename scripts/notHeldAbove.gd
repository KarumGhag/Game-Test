extends Sprite2D

@onready var gunHelpScr = $"../gunHeld"
@onready var sprite = $"."
@onready var gameState = get_node("/root/GameState")

var ak47 = preload("res://art/guns/gun held/whiteAk.png")
var pistol = preload("res://art/guns/gun held/whitePistol.png")
var rifle = preload("res://art/guns/gun held/whiteRifle.png")

var guns = [ak47, pistol, rifle]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var itemProperties = gameState.giveGun()
	var nextGun = itemProperties[1]
	sprite.texture = guns[nextGun]
	
