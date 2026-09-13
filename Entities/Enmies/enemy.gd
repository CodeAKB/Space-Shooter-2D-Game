class_name Enemy
extends Area2D

# Called when the node enters the scene tree for the first time.
var speed = 80;
func _ready() -> void:
	randomize()
	position = Vector2(randi_range(20, 580), 0) #Here vector is like tuple which says that where actually the x and y position or axis goes.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed*delta


func _on_area_entered(area: Area2D) -> void:
	if area.name == "BulletArea":
		get_node("../../player").add_score()
		area.get_parent().queue_free()
		queue_free()
		
