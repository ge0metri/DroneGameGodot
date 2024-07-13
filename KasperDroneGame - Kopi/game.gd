extends Node3D
@onready var ui = $UI
var score = 10
var lives = 3
@onready var current_world = preload("res://worlds/world.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(current_world)
	connect_world()
	pass # Replace with function body.

func connect_world():
	current_world.start()
	current_world.connect("endpoint", _on_endpoint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		ui.toggle_menu()
	if Input.is_action_just_pressed("run"):
		score += 1
		ui.set_score(score)
	if Input.is_action_just_pressed("scan"):
		current_world.scan()
		pass

func _on_endpoint(close : bool):
	if close:
		score += 1
		ui.set_score(score)
	else:
		lives -= 1
		ui.life_loss(lives)
		


func _on_ui_snake_level():
	remove_child(current_world)
	current_world = preload("res://worlds/snake_head.tscn").instantiate()
	add_child(current_world)
