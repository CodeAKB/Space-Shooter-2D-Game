extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
var bullet_scene = preload("res://Entities/Bullet/bullet.tscn")
var shoot_time:= 1.0
var shoot_counter = 0
var score:int = 0

var direction:int = 0
var speed:int = 300
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shoot_counter += delta
	if Input.is_action_pressed("fire") and shoot_counter >= shoot_time:
		shoot_counter = 0
		var bullet_instantiate = bullet_scene.instantiate() #It actually brings the bullet to the scene which is already preloaded
		bullet_instantiate.position.x = position.x
		bullet_instantiate.position.y = position.y-29
		get_parent().get_node("Bullets").add_child(bullet_instantiate)
		
	
	if Input.is_action_pressed("left direction"):
		direction = -1
	elif Input.is_action_pressed("right direction"):
		direction = 1
	else:
		direction = 0
	position.x += direction*speed*delta
	if position.x > 600-20:
		position.x = 580
	elif position.x < 20:
		position.x = 20
		
func add_score() -> void:
	score += 1
	get_node("../CanvasLayer/ScoreLabel").text = "Score: " + str(score)
