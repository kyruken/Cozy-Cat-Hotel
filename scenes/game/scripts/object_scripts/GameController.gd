extends Node2D
#Responsibility of GameController is to facilitate the game
	#Facilitate spawned customers entering a queue
	#Control queued customers entering rooms
	#Control money obtained after cleaning rooms
	
@export var queue_controller : QueueController
@export var rooms_controller : RoomsController

@onready var buy_nodes = get_tree().get_nodes_in_group("buy_node")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var rooms = get_tree().get_nodes_in_group("room")
@onready var timer = $Timer

var minimum_time_in_room := 5.0
var maximum_time_in_room := 10.0

func _ready():
	for node in buy_nodes:
		node.bought_object.connect(_on_room_is_bought)
	for room in rooms:
		room.room_is_cleaned.connect(_on_room_is_cleaned)
	
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

func _on_room_is_cleaned():
	player.get_node("MoneyInventory").increment_money(2)

func _on_room_is_bought(bought_node):
	#adds new room to rooms array
	rooms_controller.add_new_room(bought_node)
	bought_node.room_is_cleaned.connect(_on_room_is_cleaned)
