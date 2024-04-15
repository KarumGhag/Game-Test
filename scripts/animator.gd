extends AnimatedSprite2D


@onready var player = $".."
@onready var playerVelocity = player.velocity

@onready var walking = $"../particels/walking"
@onready var falling = $"../particels/falling"

var currentAnimation : String
var allPlayed : Array
var isFalling : bool

func _ready():
	play("idle")

func _process(delta):
		
	playerVelocity = player.velocity
	

	if playerVelocity.y < 0:
		play("jumping")
		currentAnimation = "jumping"
		walking.emitting = false
		falling.emitting = true
		addAnim("jumping")

	elif playerVelocity.y > 0:
		play("falling")
		currentAnimation = "falling"
		walking.emitting = false
		falling.emitting = true
		addAnim("falling")
		
	elif playerVelocity.x != 0:
		play("running")
		currentAnimation = "running"
		walking.emitting = true
		falling.emitting = false
		addAnim("running")
		
	elif playerVelocity.x == 0 and playerVelocity.y == 0:
		play("idle")
		currentAnimation = "idle"
		walking.emitting = false
		falling.emitting = false
		addAnim("idle")
		
	
		
func addAnim(anim : String):
	if len(allPlayed) > 3:
		allPlayed.clear()
	if len(allPlayed) != 0:
		if anim != allPlayed[len(allPlayed) - 1]:
			allPlayed.append(anim)
		else:
			return
	else:
		allPlayed.append(anim)
