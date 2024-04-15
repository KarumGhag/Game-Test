extends AnimatedSprite2D

@onready var player = $".."
@onready var mainAnim = $"../no arms"
@onready var arms = $"."

var timer = 0.0
var startTimer = false
var on = false
func _process(delta):

	if player.velocity.x == 0:
		arms.play("idle")
	elif player.velocity.x != 0 and player.velocity.y == 0:
		arms.play("running")
	if player.velocity.y != 0:
		arms.play("jumping")

	
	if player.lastDirection == 1:
		arms.flip_h = false
	elif player.lastDirection == -1:
		arms.flip_h = true
