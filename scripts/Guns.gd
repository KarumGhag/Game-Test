extends Node2D

@onready var player = $".."
@onready var playerPos = player.position

var guns : Array = [$Pistol, $Ak47]
var option : int = 0
var selected

func _process(delta):
	var playerPosX = player.position.x
	var mousePosX = get_global_mouse_position().x
	look_at(get_global_mouse_position())
	if playerPosX > mousePosX:
		guns[option].flip_v = true
	else:
		guns[option].flip_v = false
		
	if Input.is_action_just_pressed("changeGunDown"):
		option -= 1
		selected = guns[option]
	if Input.is_action_just_pressed("changeGunUp"):
		option += 1
		selected = guns[option]
		
	print(selected)
