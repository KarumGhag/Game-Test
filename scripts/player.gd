class_name Player
extends CharacterBody2D

var speed = 450.0
var accel = 30
var direction = Input.get_axis("left","right")

var jumpPower = -900.0
var gravity = 1500

var jumpCounter = 0

var cayoteTimer = 0.0
var cayoteTimerToggle = false
var canCayote = false

var canDoubleJump = false

var isDashing = false
var dashLen = 1.0
var dashTimerToggle = false
var dashCoolDown = 3.0
var dashCoolDownToggle = false
var canDash = true
var canMove = true
var storedVel : float

@onready var anim = $animator
@onready var dashAnim = $"dash animator"



func _physics_process(delta):
	var mousePos = get_global_mouse_position()	
	
	if !isDashing:
		if mousePos[0] > position.x:
			anim.flip_h = false
			dashAnim.flip_h = false
		else:
			anim.flip_h = true
			dashAnim.flip_h = true


	#Issac Newton shit
	if not is_on_floor():
		velocity.y += (gravity * 1.5) * delta
		cayoteTimerToggle = true
		if jumpCounter < 2:
			canDoubleJump = true
		else:
			canDoubleJump = false
		



	#Very anti Issac Newton shit
	if is_on_floor():
		canCayote = true
		cayoteTimerToggle = false
		cayoteTimer = 0.0
		jumpCounter = 0
		canDoubleJump = true
		
	if cayoteTimerToggle:
		cayoteTimer += delta
	if cayoteTimer > 0.15:
		canCayote = false
	
	if (not is_on_floor() and jumpCounter == 0) and not canCayote:
		jumpCounter += 1

	#anti Issac Newton shit
	if not isDashing:
		if Input.is_action_just_pressed("jump") and (is_on_floor() or canCayote or canDoubleJump):
			if canCayote:
				canCayote = false
			velocity.y = jumpPower
			jumpCounter += 1

		if Input.is_action_pressed("jump") and is_on_floor():
			velocity.y = jumpPower
			if jumpCounter == 0:
				jumpCounter += 1

		if Input.is_action_just_released("jump"):
			velocity.y *= 0.6


	if isDashing:
		canMove = false
	else:
		canMove = true
	#left and right
	if canMove:
		direction = Input.get_axis("left","right")
		
	if direction or isDashing:
		velocity.x = move_toward(velocity.x, speed * direction, accel)
	else:
		#makes you stop 
		velocity.x = move_toward(velocity.x, 0, accel)



	if Input.is_action_just_pressed("dash") and (canDash and not isDashing):
		velocity.y = 0
		gravity = 0
		if direction == 0:
			if anim.flip_h == false:
				direction = 1
			else:
				direction = -1
		dashLen = 0.25

		isDashing = true
		dashTimerToggle = true
		speed = 1000
		accel = 80
		

	if dashTimerToggle:
		dashLen -= delta

	if isDashing:
		canDash = false

	if dashLen <= 0:
		gravity = 1500
		dashLen = 1
		canDash = false
		speed = 450
		dashTimerToggle = false
		dashCoolDown = 3.0
		dashCoolDownToggle = true
		isDashing = false
		accel = 30

	if dashCoolDown <= 0:
		canDash = true
		dashCoolDownToggle = false
		dashCoolDown = 3.0

	if dashCoolDownToggle:
		dashCoolDown -= delta
		

	#movin
	move_and_slide()
