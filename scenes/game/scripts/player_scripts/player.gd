extends CharacterBody2D

var speed := 500.0

func _physics_process(delta):
	move_and_slide()
