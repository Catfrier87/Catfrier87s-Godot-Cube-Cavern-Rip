extends HBoxContainer

var base_slot = preload("res://gui/hotbar_slot.tscn")

func setup(slots):
	for i in range(slots):
		var new_slot = base_slot.instantiate()
		self.add_child(new_slot)
		new_slot.get_node("SlotNumber").text = str(i+1)

func display_inventory(inventory: Array):
	var slot_id = 0
	for item in inventory:
		get_child(slot_id).display_item(item)
		slot_id += 1

func clean():
	for slot in get_children():
		remove_child(slot)
		slot.queue_free() 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await GameVariables.player_loaded
	setup(GameVariables.player_body.slots)
	display_inventory(GameVariables.player_body.inventory)
	GameVariables.player_body.updated_slot.connect(func(slot_id, item):
		print(slot_id, item)
		get_child(slot_id).display_item(item)
		pass
	)

func _changed_held(new_slot, last_slot) -> void:
	get_child(last_slot).deselect()
	get_child(new_slot).select()
