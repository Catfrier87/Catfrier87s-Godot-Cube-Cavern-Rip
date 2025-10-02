@abstract
class_name Interactable
extends StaticBody3D

@export var hover_text: String = "This is the default hover text for Interactables, if you're seeing this, something went wrong."
@export var description: String = "Lorem Ipsum"

@abstract func interact(player)
