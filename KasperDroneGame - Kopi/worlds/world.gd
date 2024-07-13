extends Node3D
class_name World

@onready var targets = $Targets
@onready var drone = $drone

var close : bool
var seen_targets = []
var target : Node3D
signal endpoint(boolean : bool)

# Called when the node enters the scene tree for the first time.
func _ready():
#	for target in targets.get_children():
#		target.get_child(0).connect("area_entered", found_a_target())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start():
	var n = targets.get_child_count()
	target = targets.get_child(randi_range(0, n-1))
	target.activate()
	target.get_child(0).connect("body_entered", found_a_target)
	target.get_child(0).connect("body_exited", lost_a_target)
	
func found_a_target(body):
	close = true

func lost_a_target(body):
	close = false
	

func scan():
	print(close)
	endpoint.emit(close)
	
