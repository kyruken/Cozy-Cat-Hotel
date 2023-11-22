extends Node2D
#Responsibility of GameController is to facilitate the game
#Game is run by adding customers to the queues, moving them to rooms, and leaving
@export var queue_controller : QueueController
@export var rooms_controller : RoomsController

func _process(delta):
	move_queued_customer_to_room()
	print(rooms_controller.rooms)

func move_queued_customer_to_room():
	var potential_available_room = rooms_controller.check_room_is_available()
	if (potential_available_room and !queue_controller.is_empty()):
		var available_customer = queue_controller.pop()
		rooms_controller.assign_customer_to_room(available_customer, potential_available_room)
	
func _on_customer_spawner_customer_spawned(customer):
	queue_controller.add_customer_to_queue(customer)
