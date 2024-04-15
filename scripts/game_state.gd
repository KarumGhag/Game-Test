extends Node2D

var currentGun : int
var nextGun = 1
var lastGun = 2
var gunProps : Array

func updateGun(current, next, last):
	gunProps = [current, next, last]

func giveGun():
	return gunProps
	
	
