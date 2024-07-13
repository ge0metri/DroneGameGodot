extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play():
	visible = true
	var i = 0
	while i < 28:
		texture.region.position = Vector2(i*512,0)
		await get_tree().create_timer(0.05).timeout
		i += 1
		

