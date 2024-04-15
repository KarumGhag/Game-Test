extends Label

@onready var player = $".."
@onready var playerVel = player.velocity
@onready var animations = $"../animator"
@onready var gun = $"../Gun"



var on = false
func _ready():
	hide()


func _process(delta):
	playerVel =  player.velocity
	var canCayote = player.canCayote
	var fps = round (1 / delta)
	var canDoubleJump = player.canDoubleJump
	var jumpCounter = player.jumpCounter
	var floor = player.is_on_floor()
	var dashLen = player.dashLen
	var canDash = player.canDash
	var isDashing = player.isDashing
	var dashCoolDown = player.dashCoolDown
	var dashCoolDownToggle = player.dashCoolDownToggle
	
	var currentAnimation = animations.currentAnimation
	var allPlayed = animations.allPlayed
	
	var nextGun = gun.nextGun
	var lastGun = gun.lastGun
	var currentGun = gun.currentGun
	var nextUp = gun.nextGunUpdate
	var lastUp = gun.lastGunUpdate	
		
	text = "FPS: " +str(fps) + "\nXV: "+str(playerVel.x) + "\nYV: "+str(playerVel.y) + "\nCan Cayote: " +str(canCayote) + "\nCan double jump: " +str(canDoubleJump) + "\nJumps: " +str(jumpCounter) + "\nFloor: " +str(floor) + "\nDash len: " +str(dashLen) + "\nCan dash: "+str(canDash) + "\nis dashing: "+str(isDashing) + "\ncooldown: "+str(dashCoolDown) + "\n cooldown on: " +str(dashCoolDownToggle) + "\nanim: "+str(currentAnimation) + "\nlast 3: " +str(allPlayed) + "\nNext gun: "+str(nextGun) + "\nLast gun: " +str(lastGun) + "\nCurrent gun: " +str(currentGun) + "\nNext update: "+str(nextUp)+ "\nLast update: "+str(lastUp)

	
	if Input.is_action_just_pressed("debug"):
		on = !on
		toggle(on)
	
	
func toggle(on):
	if on:
		hide()
	else:
		show()
