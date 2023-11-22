extends Node2D

signal customer_spawned
@export var customer_scene : PackedScene

func _on_spawn_timer_timeout():
	var new_customer = customer_scene.instantiate()
	get_tree().get_root().get_node("Main").add_child(new_customer)
	customer_spawned.emit(new_customer)
	
