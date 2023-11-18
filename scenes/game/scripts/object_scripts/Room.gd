extends Node2D

var hasCustomer = false
var customer_in_room
@onready var location = self.global_position

func set_has_customer():
	if !hasCustomer:
		$Timer.start()
	else:
		$Timer.stop()
	hasCustomer = !hasCustomer

func _on_timer_timeout():
	set_has_customer()
	customer_in_room.room_timer_timeout()
