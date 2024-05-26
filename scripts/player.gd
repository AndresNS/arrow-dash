extends CharacterBody2D

const SPEED: float = 50.0

@onready var player_sprite = $PlayerSprite
@onready var arrow_container = $ArrowContainer
@onready var arrow_animation = $ArrowContainer/AnimationPlayer

var direction = Vector2.UP
var arrow_speed: float = 1.5

func _ready():
	arrow_animation.speed_scale = arrow_speed

func _physics_process(delta):
	var arrow_angle = arrow_container.rotation
	
	if Input.is_action_just_pressed("ui_accept"):
		player_sprite.rotation = arrow_angle
		direction = Vector2(cos(arrow_angle - PI/2), sin(arrow_angle - PI/2))
	
	position += SPEED * direction * delta
