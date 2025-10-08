extends ColorRect

@export var base_size = 44
@export var active_size = 76

func select():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "custom_minimum_size", Vector2(active_size, active_size), 0.1)
	$ItemName.visible = true

func deselect():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "custom_minimum_size", Vector2(base_size, base_size), 0.1)
	$ItemName.visible = false

func display_item(item: Item):
	
	$ItemName.text = item.item_name
	
	if item.image == "null":
		$ItemImage.texture = null
	else:
		$ItemImage.texture = load(item.image)
	
	if item.amount > 1:
		$Stack.text = item.amount
		$Stack.visible = true
	else:
		$Stack.visible = false
	
