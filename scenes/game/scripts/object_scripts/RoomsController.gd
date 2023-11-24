extends Node2D
class_name RoomsController

var rooms = []

func _ready():
	rooms = get_tree().get_nodes_in_group("room")

func check_room_is_available():
	for room in rooms:
		if (room.hasCustomer == false):
			return room
	return false
			
func assign_customer_to_room(customer, room):
	if (room.hasCustomer == false):
		room.set_has_customer()
		room.set_customer_in_room(customer)
