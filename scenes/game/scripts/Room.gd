extends Node2D
class_name Room

enum RoomState {
	NO_CUSTOMER,
	HAS_CUSTOMER,
	DIRTY_ROOM
}

var hasCustomer = false
var player_inside = false
var player
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
				textbox_area.visible = !textbox_area.visible 
				current_state = RoomState.DIRTY_ROOM
		RoomState.DIRTY_ROOM:
			if player_inside:
				handle_dirty_room(player)
	
func set_has_customer():
	hasCustomer = !hasCustomer

func set_customer_in_room(node):
	customer_in_room = node
	
func handle_dirty_room(body):
	#sets room to not hasCustomer, customer is null, etc.
	if (body.is_in_group("player") and Input.is_action_pressed("ui_action")):
		set_has_customer()
		set_customer_in_room(null)
		current_state = RoomState.NO_CUSTOMER
		textbox_area.visible = !textbox_area.visible 
		
func _on_text_box_area_2d_body_entered(body):
	player = body
	player_inside = true

func _on_text_box_area_2d_body_exited(body):
	player_inside = false
