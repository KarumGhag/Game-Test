extends AnimatedSprite2D

@onready var player = $".."
@onready var isDashing = player.isDashing

func _ready():
	hide()



func _process(delta):		
	isDashing = player.isDashing
	

	if isDashing:
		show()
		play("dash run")
	else:
		hide()
