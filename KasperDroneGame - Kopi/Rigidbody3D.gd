extends RigidBody3D

@export var moveForce = 50
@export var turnForce = 3
@onready var collision_shape_3d = $CollisionShape3D
@onready var controller = $Controller
var currentscale = 1


const FORWARD_MULTIPLIER = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	set_lock_rotation_enabled(false)
	#add_constant_torque(Vector3(0,0,0))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("plus") and currentscale < 10:
		currentscale *= 1.05
		collision_shape_3d.scale *= Vector3(1.05,1.05, 1.05)
		controller.scale *= Vector3(1.05,1.05, 1.05)
		
	if Input.is_action_pressed("minus") and currentscale > 0.10:
		collision_shape_3d.scale *= Vector3(0.95,0.95, 0.95)
		controller.scale *= Vector3(0.95,0.95, 0.95)

# Called when the node enters the scene tree for the first time.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var forwardMultiplier = 1
	
	
	if Input.is_action_pressed("run") and Input.is_action_pressed("forward"):
		forwardMultiplier = FORWARD_MULTIPLIER
		
	var leftRight = clamp(Input.get_axis("left", "right"), -1.0, 1.0)
	var forwardBack = clamp(Input.get_axis("forward", "back"), -1.0, 1.0)
	var upDown = clamp(Input.get_axis("down", "up"), -1.0, 1.0)
	var turn = clamp(Input.get_axis("turn_left", "turn_right"), -1.0, 1.0)
	
	var moveVector = (self.basis.z * forwardBack * forwardMultiplier) + (self.basis.x * leftRight) + (self.basis.y * upDown)
	
	apply_central_force(moveVector * moveForce)
	
	apply_torque(Vector3(0,-turn*turnForce,0))


	
	
	if Input.is_action_pressed("run"):
		pass
		#rotate_y(deg_to_rad(rotation_y * delta * 200))

# Called every frame. 'delta' is the elapsed time since the previous frame.
