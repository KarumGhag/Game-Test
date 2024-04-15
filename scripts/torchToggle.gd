extends PointLight2D

@onready var player = $".."

func _ready():
	enabled = true
	player.modulate.a = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	
	if Input.is_action_just_pressed("torch"):
		if enabled:
			enabled = false
			player.modulate.a = 0.135
		else:
			enabled = true
			player.modulate.a = 1
			

		
