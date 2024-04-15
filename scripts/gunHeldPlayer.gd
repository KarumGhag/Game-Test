extends Node2D

var gunHeldScript = preload("res://scenes/gunHeld.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var heldInstance = gunHeldScript.instantiate()
	add_child(heldInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
