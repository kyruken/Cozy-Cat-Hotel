extends Node2D
#Responsibility of GameController is to facilitate the game
#Game is run by adding customers to the queues, moving them to rooms, and leaving
@export var queue_controller : QueueController
@export var rooms_controller : RoomsController
@onready var timer = $Timer

var minimum_time_in_room := 5.0
var maximum_time_in_room := 10.0

func _process(delta):
	move_queued_customer_to_room()

func move_queued_customer_to_room():
	var potential_available_room = rooms_controller.check_room_is_available()
	if (potential_available_room and !queue_controller.is_empty()):
		var available_customer = queue_controller.pop()
		rooms_controller.assign_customer_to_room(available_customer, potential_available_room)
		available_customer.set_location(potential_available_room.global_position)
		
		var timer_instance = timer.duplicate()
		var rng = RandomNumberGenerator.new()
		add_child(timer_instance)
		timer_instance.start(rng.randf_range(minimum_time_in_room, maximum_time_in_room))
		potential_available_room.room_timer = timer_instance
		available_customer.stay_in_room_timer = timer_instance
	
func _on_customer_spawner_customer_spawned(customer):
	queue_controller.add_customer_to_queue(customer)

