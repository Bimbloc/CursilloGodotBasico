extends Node3D
@export var  donut : PackedScene
var lifetime :float
# Called when the node enters the scene tree for the first time.
func _ready():
	lifetime = 10#en 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): #deltaes un flaot y est aen segundos 

		
	
	pass
	
func _input(event):
	if event.is_action_pressed("salto"):
		var instance = donut.instantiate()
		
		get_tree().get_root().add_child(instance)
		instance.global_position = self.global_position
		instance.get_child(0).global_rotation = self.global_rotation
		
