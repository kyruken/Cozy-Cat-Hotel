extends CharacterBody2D

enum CustomerState {
	IDLE_IN_LINE,
	MOVING_TO_ROOM,
	IN_ROOM,
	LEAVING
}

var current_state: CustomerState = CustomerState.IDLE_IN_LINE
#Default location is the line
var location: Vector2 = Vector2(260, 161)
var speed := 500.0

@onready var stay_in_room_timer = $Timer

func _ready():
	current_state = CustomerState.IDLE_IN_LINE
	
func _process(delta):
	match current_state:
		CustomerState.IDLE_IN_LINE:
			move_to_location(delta, Vector2(260, 161))
			if (location != Vector2(260, 161)):
				current_state = CustomerState.MOVING_TO_ROOM
		CustomerState.MOVING_TO_ROOM:
			move_to_location(delta, location)
			if (self.global_position.x >= location.x):
				current_state = CustomerState.IN_ROOM
		CustomerState.IN_ROOM:
			if (stay_in_room_timer.is_stopped() == true):
				current_state = CustomerState.LEAVING
		CustomerState.LEAVING:
			leave_hotel()

func set_location(room):
	location = room
	
func move_to_location(delta, location):
	$NavigationAgent2D.target_position = location + Vector2(0.1, 0)
	var dir = $NavigationAgent2D.get_next_path_position() - self.global_position
	var desired_velocity = speed * dir
	velocity = desired_velocity * delta
	move_and_slide()
	
func leave_hotel():
	queue_free()
	
