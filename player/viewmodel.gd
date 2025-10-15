extends Node3D

@onready var animator = $AnimationPlayer

func hold_item():
	pass

func _ready():
	animator.play("ArmLeft_Lower")
