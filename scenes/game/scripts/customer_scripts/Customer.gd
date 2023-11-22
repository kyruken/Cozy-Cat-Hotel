extends CharacterBody2D

enum CustomerState {
	IDLE,
	MOVING_TO_ROOM,
	IN_ROOM,
	LEAVING
}

var current_state: CustomerState = CustomerState.IDLE
var target_room: Room
var room_location: Vector2 = Vector2(260, 161)
var speed := 500.0

var timer : Timer

func _ready():
	timer = get_tree().get_root().get_node("Main").get_node("RoomTimer")
	current_state = CustomerState.MOVING_TO_ROOM
	
func _process(delta):
	match current_state:
		CustomerState.IDLE:
			pass
		CustomerState.MOVING_TO_ROOM:
			move_to_room(delta, room_location)
			if (self.global_position.floor() == room_location):
				current_state = CustomerState.IDLE
		CustomerState.IN_ROOM:
			handle_in_room()
		CustomerState.LEAVING:
			pass
#			leave_hotel(delta, despawn_location.global_position)

func set_room(room):
	room_location = room
	
func move_to_room(delta, location):
	$NavigationAgent2D.target_position = location
	var dir = $NavigationAgent2D.get_next_path_position() - self.global_position
	var desired_velocity = speed * dir
	velocity = desired_velocity * delta
	move_and_slide()
	
func handle_in_room():
	if timer.is_stopped():
		print('start timer')
		timer.start()

func leave_hotel(delta, location):
	move_to_room(delta, location)
	
#func _on_timer_timeout():
#	current_state = CustomerState.LEAVING
