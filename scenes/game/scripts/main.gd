extends Node2D

var queue_of_customers = []
var rooms = []

func _ready():
	rooms = get_tree().get_nodes_in_group("room")
	get_tree().call_group("room", "on_room_timeout")
	
func add_customer_to_queue(customer):
	queue_of_customers.append(customer)

func pop_customer():
	#pop_front pops front of array and reindexes whole array
	queue_of_customers.pop_front()


#func scan_for_rooms():
#	##Scan on these conditions:
#		# 1. When customer spawns
#		# 2. When customer leaves a room
#
#	## index 0 is hasCustomer, index 1 is location of room ##
#	for current_room in rooms:
#		var room_has_customer = current_room.hasCustomer
#		var room_location = current_room.location
#
#		if !room_has_customer:
#			var current_customer = queue_of_customers[0]
#			current_customer.move_to_room(room_location)
#			current_room.customer_in_room = current_customer
#			pop_customer()
#			current_room.set_has_customer()
#			break

func _on_child_entered_tree(node):
	##Need to add new customer to either a room, or to the line
	assign_customer_to_room(node)

func assign_customer_to_room(node):
	if (node.is_in_group("customer")):
		for room in rooms:
			if (room.hasCustomer == false):
				node.set_room(room.global_position)
				room.set_has_customer()
				room.set_customer_in_room(node)
				break
			else:
				node.set_room(Vector2(0,0))
