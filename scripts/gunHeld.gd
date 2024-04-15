extends Sprite2D

@onready var gameState = get_node("/root/GameState")
@onready var sprite = $"."
var gunProps : Array
var currentGun : int

var ak47 = preload("res://art/guns/gun held/whiteAk.png")
var pistol = preload("res://art/guns/gun held/whitePistol.png")
var rifle = preload("res://art/guns/gun held/whiteRifle.png")

var guns = [ak47, pistol, rifle]

func _process(delta):
	gunProps = gameState.giveGun()
	currentGun = gunProps[0]
	sprite.texture = guns[currentGun]
	
