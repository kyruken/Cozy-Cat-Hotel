extends CharacterBody2D

@export var main : Node2D
var speed := 500.0
var goto_location
var despawn_location = Vector2(964, 94)
var hasLocation = false

func _ready():
	main = get_tree().get_root().get_node("Main")
	main.add_customer(self)
	main.scan_for_rooms()

func move_to_room(location : Vector2):
	##call function in customer_queue to move customer to that location
	print("moving to")
	print(location)
	goto_location = location
	hasLocation = true
