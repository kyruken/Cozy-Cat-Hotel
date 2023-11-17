extends CharacterBody2D

var speed := 500.0
var jump_impulse := 1200.0
var base_gravity := 4000.0
var glide_gravity := 1000.0

var _is_gliding := false
var gravity := glide_gravity if _is_gliding else base_gravity

func _physics_process(delta):
	move_and_slide()
