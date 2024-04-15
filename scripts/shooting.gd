extends Node2D

@onready var gun = $".."
@onready var currentGun = gun.currentGun


@onready var shootPoint = $"."

@onready var bullet = preload("res://bullet.tscn")
var bulletSpeed = 1000

var canShoot = true
var shootTimer = 0.0
var shootTimerToggle = false

var fireRate
var bulletStrength


func _process(delta):
	currentGun = gun.currentGun
	if currentGun == 0:
		fireRate = 0.25
		bulletStrength = 1
	if currentGun == 1:
		fireRate = 0.5
		bulletStrength = 1.3
	if currentGun == 2:
		fireRate = 0.15
		bulletStrength = 0.9
		
	if  Input.is_action_just_pressed("fire") or Input.is_action_pressed("fire"):
		shoot(delta, fireRate, bulletStrength)

		

		
func shoot(delta, fireRate, bulletStrength):
	if canShoot:
		shootTimer = 0
		canShoot = false
		shootTimerToggle = true
		
		var bulletInstance = bullet.instantiate()
		bulletInstance.position = get_global_position()
		bulletInstance.rotation_degrees = gun.rotation_degrees
		bulletInstance.linear_velocity = Vector2((bulletSpeed * bulletStrength), 0).rotated(gun.rotation)
		get_tree().get_root().add_child(bulletInstance)
		print(bulletInstance.rotation_degrees)
		print($"..".rotation_degrees)
		
	else:
		if shootTimerToggle:
			shootTimer += delta
	
		if shootTimer >= fireRate:
			canShoot = true
			shootTimerToggle = false
