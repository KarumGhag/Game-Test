extends Node2D

var gunHeld = preload("res://scenes/gunHeld.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var gunHeldInstance = gunHeld.instantiate()
	gunHeldInstance.position = position
	add_child(gunHeldInstance)
