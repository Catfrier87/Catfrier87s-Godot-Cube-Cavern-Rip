extends RayCast3D


func check_dist(distance: float):
	target_position = Vector3.FORWARD * distance
	force_raycast_update()
	
	if get_collider():
		return get_collider()
