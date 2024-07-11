class_name Player extends CharacterBody2D

signal health_changed(new_health: int) 

const DebuffTimerScene = preload("res://scenes/debuff_timer.tscn")

const SPEED: float = 100.0
const INITIAL_SPEED_BOOST: float = 2.0
const INITIAL_SPEED_MULTIPLIER: float = 1.0
const INITIAL_ARROW_SPEED: float = 1.5

@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var arrow_container: Node2D = $ArrowContainer
@onready var arrow_animation: AnimationPlayer = $ArrowContainer/AnimationPlayer
@onready var hurtbox_node: Area2D = $Hurtbox
@onready var shield_timer: Timer = $ShieldTimer
@onready var shield: Shield = $Shield

var max_health: int = 100
var health: int = max_health
var hurtbox: Hurtbox
var is_boosting: bool = false
var speed_boost: float = INITIAL_SPEED_BOOST
var speed_multiplier: float = INITIAL_SPEED_MULTIPLIER
var debuffs: Dictionary = {}

func _ready() -> void:
	shield.hide()
	arrow_animation.speed_scale = INITIAL_ARROW_SPEED
	hurtbox = hurtbox_node as Hurtbox
	if hurtbox:
		hurtbox.player = self

func _physics_process(delta: float) -> void:
	var arrow_angle: float = arrow_container.rotation
		
	if Input.is_action_just_pressed("ui_accept"):
		speed_boost = INITIAL_SPEED_BOOST
		player_sprite.rotation = arrow_angle
		velocity = Vector2(cos(arrow_angle - PI/2), sin(arrow_angle - PI/2)) * SPEED
	
	var collision: KinematicCollision2D = move_and_collide((velocity * speed_boost * speed_multiplier) * delta)
	
	if collision:
		if (collision.get_collider().has_method("attack")):
			collision.get_collider().call("attack", self)
		
		velocity = velocity.bounce(collision.get_normal())
		player_sprite.rotation = velocity.angle() + PI/2
	
	if (speed_boost >= 1):
		speed_boost -= 0.05
		if (speed_boost < 1):
			speed_boost = 1
	
	if (shield.active && shield_timer.time_left <= 1.5):
		blink_shield()
	
func take_damage(amount: int) -> void:
	health -= amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)

func heal(amount: int) -> void:
	health += amount
	health = clamp(health, 0, max_health)
	emit_signal("health_changed", health)

func activate_shield(duration: float) -> void:
	if (!shield.active):
		shield.active = true
		shield_timer.start(duration)
	else:
		shield_timer.wait_time = duration

func blink_shield() -> void:
	shield.animation_player.play("blink")

func apply_debuff(debuff_type: String, duration: float) -> void:
	var debuff_timer: Timer = DebuffTimerScene.instantiate()
	add_child(debuff_timer)
	debuff_timer.timeout.connect(on_debuff_timer_timeout.bind(debuff_type, debuff_timer))
	debuff_timer.start(duration)
	debuffs[debuff_type] = debuff_timer

func remove_debuff(debuff_type: String) -> void:
	if (debuff_type == "slow_down"):
		speed_multiplier = INITIAL_SPEED_MULTIPLIER
	if (debuff_type == "arrow_speed_up"):
		arrow_animation.speed_scale = INITIAL_ARROW_SPEED

func on_debuff_timer_timeout(debuff_type:String, timer: Timer) -> void:
	if debuffs.has(debuff_type):
		debuffs.erase(debuff_type)
		remove_debuff(debuff_type)
	timer.queue_free()

func _on_shield_timer_timeout() -> void:
	if (shield.active):
		shield.active = false

