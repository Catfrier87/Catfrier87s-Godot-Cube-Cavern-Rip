extends RayCast3D



func _process(_delta: float):
	#print(get_collider() == null)
	var target = get_collider()
	
	%GameUI.get_node("HoverText").text = "I am trapped in your sewer, help me charlie"
	
	if target != null:
		if "hover_text" in target:
			print(target.hover_text)
