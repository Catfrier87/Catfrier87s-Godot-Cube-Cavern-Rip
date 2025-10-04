extends RayCast3D

@onready var hover_text = %GameUI.get_node("HoverText")
var target: Node = null

func _process(_delta: float):
	#print(get_collider() == null)
	target = get_collider()
	
	hover_text.visible = false
	
	if target != null:
		if "hover_text" in target:
			hover_text.visible = true
			hover_text.text = target.hover_text

func _input(event):
	if event.is_action_pressed("interact"):
		if target.has_method("interact"):
			target.interact(get_parent().get_parent())
