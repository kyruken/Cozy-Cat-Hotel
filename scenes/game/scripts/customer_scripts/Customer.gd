extends CharacterBody2D

enum CustomerState {
	IDLE,
	MOVING_TO_ROOM,
	IN_ROOM,
	LEAVING
}

var current_state: CustomerState = CustomerState.IDLE
var target_room: Room
var room_location: Vector2
var has_room: bool = false
var speed := 500.0
var time_in_room: float = 5.0
var max_stay_time: float = 60.0  # Set the maximum stay time in seconds

var despawn_location: Node2D

func _ready():
	despawn_location = get_tree().get_root().get_node("Main").get_tree().get_nodes_in_group("despawn")[0]
	current_state = CustomerState.MOVING_TO_ROOM
	
func _process(delta):
	match current_state:
		CustomerState.IDLE:
			pass
		CustomerState.MOVING_TO_ROOM:
			move_to_room(delta, room_location)
		CustomerState.IN_ROOM:
			handle_in_room()
			pass
		CustomerState.LEAVING:
			leave_hotel(delta, despawn_location.global_position)

func find_nearest_target():
	var nearest_target = null
	var nearest_distance = INF
	for node in get_tree().get_root().get_node("Main").get_tree().get_nodes_in_group("room"):
		if (node is Room) and (node.hasCustomer == false):
			print(node)
			var distance = position.distance_to(node.global_position)
			if (node.hasCustomer == false):
				nearest_target = node
				break
	
	if (nearest_target):
		current_state = CustomerState.MOVING_TO_ROOM

func set_room(room):
	room_location = room
	
func move_to_room(delta, location):
	$NavigationAgent2D.target_position = location
	var dir = $NavigationAgent2D.get_next_path_position() - self.global_position
	var desired_velocity = speed * dir
	velocity = desired_velocity * delta
	move_and_slide()
	
	if (self.global_position.floor() == room_location):
		current_state = CustomerState.IDLE

func finish_time_in_room():
	current_state = CustomerState.IN_ROOM

func handle_in_room():
	if $Timer.is_stopped():
		$Timer.start()

func leave_hotel(delta, location):
	move_to_room(delta, location)
	
func _on_timer_timeout():
	print('leave da room')
	current_state = CustomerState.LEAVING
