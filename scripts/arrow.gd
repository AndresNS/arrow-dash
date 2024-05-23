extends Sprite2D

const ARROW_SPEED = 3*PI/2  # angular speed
const RADIUS = 30.0

var arrow_angle = -PI/2

@onready var player = $".."

func _process(delta):
	arrow_angle += ARROW_SPEED * delta
	
	# Keep the angle within the range of 0 to 2π for simplicity
	if arrow_angle > TAU:
		arrow_angle -= TAU
		
	rotation = arrow_angle + PI/2
	position = Vector2(RADIUS * cos(arrow_angle), RADIUS * sin(arrow_angle))
