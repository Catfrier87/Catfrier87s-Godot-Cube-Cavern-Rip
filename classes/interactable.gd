@abstract
class_name Interactable
extends StaticBody3D

@export var hover_text: String = "This is the default hover text for Interactables."
@export var description: String = "Lorem Ipsum"

var debounce: bool = false

@abstract func interact(player)
