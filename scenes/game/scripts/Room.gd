extends Node2D
class_name Room

enum RoomState {
	NO_CUSTOMER,
	HAS_CUSTOMER,
	DIRTY_ROOM
}

var hasCustomer = false
var customer_in_room
var current_state: RoomState = RoomState.NO_CUSTOMER

@onready var room_timer = $Timer
@onready var textbox_area := $TextBoxArea2D
@onready var location = self.global_position


func _process(delta):
	match current_state:
		RoomState.NO_CUSTOMER:
			if (customer_in_room):
				current_state = RoomState.HAS_CUSTOMER
		RoomState.HAS_CUSTOMER:
			if (room_timer.is_stopped()):
				set_has_customer()
				set_customer_in_room(null)
				textbox_area.visible = !textbox_area.visible 
				current_state = RoomState.DIRTY_ROOM
		RoomState.DIRTY_ROOM:
			pass
			
	
func set_has_customer():
	hasCustomer = !hasCustomer

func set_customer_in_room(node):
	customer_in_room = node
	
func handle_dirty_room():
	pass
