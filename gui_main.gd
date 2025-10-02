extends Control

func _ready() -> void:
	Input.set_custom_mouse_cursor(load("res://textures/gui/cursor/cursor_main.png"))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_menu"):
		$Menu.visible = not $Menu.visible
		
