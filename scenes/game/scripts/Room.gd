extends Node2D
class_name Room

var hasCustomer = false
var customer_in_room
@onready var location = self.global_position

func set_customer_in_room(node):
	customer_in_room = node
