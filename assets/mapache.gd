extends RigidBody3D 


var forward : Vector3 
var speed : float
var maxspeed : float
var rotspeed : float
var result #para almacenar las colisiones del raycast
@export var minimumlv := 0.1
# Called when the node enters the scene tree for the first time.
func _ready():
	maxspeed=4
	speed=0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	forward = self.basis.x
	pass #print("nodo mapache ejecuta",'\n')

#se crean eventos de input desde el inputMao (Project , project settings input map)
func _input(event):
	if event.is_action_pressed("salto"):
		apply_central_impulse ( Vector3(0,5,0) )
	if event.is_action_pressed("rota"):
		#apply_central_impulse(Vector3(0,0,1))
		rotspeed = 1.2
	if event.is_action_released("rota"):
		rotspeed = 0
		
	if event.is_action_pressed("-rota"):
		#apply_central_impulse(Vector3(0,0,-1))
		rotspeed = -1.2
		
	if event.is_action_released("-rota"):
		rotspeed = 0
	
	if event.is_action_pressed("avanza"):
		#add_constant_force(3 *self.basis.x)
		speed=0.6;
	if event.is_action_released("avanza"):
		speed=0;
	
	if event.is_action_pressed("retrocede"):
		#apply_central_impulse(Vector3(-1,0,0))	
		speed= -0.4
	if event.is_action_released("retrocede"):
		speed=0	
	#print ( self.basis.x) #nuestro forward sera la x
	#print ("input called" + str(speed))
#ciclos de fisica	
func _physics_process(delta):
#	if(linear_velocity.length()<=maxspeed):
#		apply_impulse(speed*forward)
#		print ("speed" + str(speed))
	#print ("l " + str(linear_velocity))
#	if(angular_velocity.length()<= maxspeed/2):
#		#apply_torque_impulse(rotspeed*Vector3(0,1,0))	
#		angular_velocity = rotspeed*Vector3(0,1,0)
#		print("rotspeed" + str(rotspeed))
	#if(linear_velocity.length() < 0.5 and speed == 0):
	#	linear_velocity = Vector3(0,0,0)
	#raycast para saber si estamso en el suelo 
	var raylenght = 0.6
	var origin = Vector3(self.position)
	var space = get_world_3d().direct_space_state
	var ray = PhysicsRayQueryParameters3D.create(origin,Vector3(origin.x,origin.y -raylenght,origin.z))
	result = space.intersect_ray(ray)
	#print(result)
	pass
		
func _integrate_forces(state):
	
	
	if(linear_velocity.length()<=maxspeed):
		apply_impulse(speed*forward)
		print ("speed" + str(speed))
		print ("l " + str(state.linear_velocity))
	
		
	if(angular_velocity.length()<= maxspeed/2):
		#apply_torque_impulse(rotspeed*Vector3(0,1,0))	
		angular_velocity = rotspeed*Vector3(0,1,0)
		print("rotspeed" + str(rotspeed))
	#print(result.size())
	if(state.linear_velocity.length() < minimumlv and speed == 0 and result.size()!= 0  ): 
		set_linear_velocity(Vector3(0,0,0))
		gravity_scale =0;
		#state.linear_velocity= Vector3(0,0,0)
	else :
		gravity_scale =1;
		pass
		

		
		
		
		
		
		
