extends Node2D

@export var player : CharacterBody2D
@export var amount_to_add = 1
@export var amount_to_minus = 1

@onready var money_number_label = $MoneyNumberLabel

func _process(delta):
	handle_ui()	

func handle_ui():
	money_number_label.text = str(player.money)
	
func increment_money(amount):
	player.money += amount
	
func decrement_money(amount):
	player.money -= amount
