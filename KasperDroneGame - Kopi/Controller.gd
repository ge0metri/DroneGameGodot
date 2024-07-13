extends Node3D
# FOR THE VISUALS OF TILTING

var parent : RigidBody3D
var dampfactor = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = parent.linear_velocity
	# Forward back
	var zvel = parent.basis.z.dot(velocity)
	rotation_degrees.x = zvel * dampfactor
	# Rolling 
	var xvel = parent.basis.x.dot(velocity)
	rotation_degrees.z = -xvel * dampfactor * 0.9
	
