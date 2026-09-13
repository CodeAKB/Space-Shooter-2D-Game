extends Node
var enemy_scene = preload("res://Entities/Enmies/enemy.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().get_node("Boundary").area_entered.connect(_the_end)
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.timeout.connect(_create_enemy)
	timer.start()
	
func _create_enemy() -> void:
	var enemy_instantiate = enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy_instantiate)

func _the_end(area:Node) -> void:
	if area is Enemy:
		get_tree().paused = true
		get_tree().change_scene_to_file("res://GameOver/game_over.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
