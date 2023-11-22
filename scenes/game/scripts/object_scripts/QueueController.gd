extends Node2D
class_name QueueController

var queue_of_customers = []

func add_customer_to_queue(customer):
	queue_of_customers.append(customer)

func pop():
	return queue_of_customers.pop_front()

func is_empty():
	return queue_of_customers.size() == 0

