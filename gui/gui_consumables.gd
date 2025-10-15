extends VBoxContainer


func _ready() -> void:
	await GameVariables.player_loaded
	update()

func update():
	pass
