extends Node2D
class_name Room

var hasCustomer = false
var customer_in_room

@onready var room_timer = $Timer
@onready var location = self.global_position

func _process(delta):
	if (room_timer.is_stopped() and customer_in_room):
		set_has_customer()
		set_customer_in_room(null)
	
func set_has_customer():
	hasCustomer = !hasCustomer

func set_customer_in_room(node):
	customer_in_room = node


