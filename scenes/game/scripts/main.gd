extends Node2D

var queue_of_customers = []
var rooms = []

func _ready():
	rooms = get_tree().get_nodes_in_group("room")
	
func add_customer_to_queue(customer):
	queue_of_customers.append(customer)

func pop_customer():
	queue_of_customers.pop_front()

func _on_child_entered_tree(node):
	assign_customer_to_room(node)

func assign_customer_to_room(node):
	if (node.is_in_group("customer")):
		for room in rooms:
			if (room.hasCustomer == false):
				node.set_room(room.global_position)
				room.set_has_customer()
				room.set_customer_in_room(node)
				break
