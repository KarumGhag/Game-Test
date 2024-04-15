extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)

func _process(delta):
	var mousePos = get_global_mouse_position()
	position = mousePos
