extends CharacterBody2D

const SPEED = 50.0

@onready var arrow = $Arrow
@onready var player_sprite = $PlayerSprite
var direction = Vector2.UP

func _physics_process(delta):
	var arrow_angle = arrow.arrow_angle
	
	if Input.is_action_just_pressed("ui_accept"):
		player_sprite.rotation = arrow_angle + PI/2
		direction = Vector2(cos(arrow_angle), sin(arrow_angle))
	
	position += SPEED * direction * delta
