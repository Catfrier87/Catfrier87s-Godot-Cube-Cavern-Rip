extends Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("next_slot"):
		held_slot += 1
	if Input.is_action_just_released("previous_slot"):
		held_slot -= 1
	
	if event.is_action_pressed("item_primary"):
		if inventory.slot[held_slot].has_method("use_primary"):
			inventory.slot[held_slot].use_primary(self)
	elif event.is_action_pressed("item_secondary"):
		if inventory.slot[held_slot].has_method("use_secondary"):
			inventory.slot[held_slot].use_secondary(self)
