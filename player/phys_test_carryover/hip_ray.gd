extends RayCast3D

@onready var character: RigidBody3D = get_parent()

@export var strength: float = 1500.0
@export var damping: float = 50.0
@export var rest: float = 1.3
'''IMPORTANT:
	This code is broken, seriously, it doesn't work properly at all.
	
	No matter what I do I can't get the actual length of the spring to match the 'rest' value,
	it's almost ALWAYS at least -0.1 off. The only times I've been able to get it up to the correct 
	number it has caused HORRIBLE anomalies that jettisoned the controller upwards, caused bouncing 
	or caused it to jump upwards every time it walked up something.
	
	I don't know how to fix this, I really don't.
	
	The current bandaid fix is to simply increase the rest value from its intended length (1.2) to
	1.3 to compensate for the 0.1 lost.
	
	PS: The HipRay is recessed 0.1 into the controller, without this, the controller would get stuck
	if it ever touched the ground. The actual intended distance is 1.1
'''

func _ready(): 
	add_exception(character)

func get_point_velocity(point: Vector3) -> Vector3:
	return character.linear_velocity + character.angular_velocity.cross(point - character.global_position)

func _physics_process(delta: float) -> void:
	if is_colliding():
		var contact = get_collision_point()
		var up = global_basis.y
		var current_length = global_position.distance_to(contact)
		var offset = rest - current_length
		
		var spring_force = strength * offset
		
		var world_velocity = get_point_velocity(contact)
		var relative_velocity = up.dot(world_velocity)
		var damp_force = damping * relative_velocity
		
		var force_vector = (spring_force - damp_force) * up
		
		var force_pos_offset = contact - global_position # Remove later
		character.apply_force(force_vector * character.mass, force_pos_offset)
		
