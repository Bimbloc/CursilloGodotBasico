extends RigidBody3D
var lifetime :float

# Called when the node enters the scene tree for the first time.
func _ready():
	lifetime = 10#en segundos
	pass # Replace with function body.

func _integrate_forces(state):
	#apply_force(4*basis.x)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	lifetime -= delta
	if lifetime <0:
		self.get_parent().queue_free()
	pass
func _physics_process(delta):	
	apply_central_force(40*basis.x)
	
func	_on_body_entered(body):
	print("ouch")
