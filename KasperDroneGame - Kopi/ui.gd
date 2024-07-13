extends Node

@onready var v_box_container = $Menu/VBoxContainer
@onready var menu = $Menu
@onready var label = $Label
@onready var label_2 = $Label2
@onready var texture_rect = $TextureRect
signal snake_level

# Called when the node enters the scene tree for the first time.
func _ready():
#	var btn = Button.new()
#	v_box_container.add_child(btn)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func toggle_menu():
	menu.visible = !menu.visible

func set_score(score):
	label.text = "Score: " + str(score)
	texture_rect.play()
	var tween = get_tree().create_tween()
	tween.tween_property(label, "modulate", Color.RED, 0.5)
	tween.tween_property(label, "modulate", Color.WHITE, 0.5)

func life_loss(lives:int):
	var s = ""
	for i in range(lives):
		s += "<3 "
	label_2.text = s



func _on_button_2_pressed():
	snake_level.emit()
	pass # Replace with function body.
