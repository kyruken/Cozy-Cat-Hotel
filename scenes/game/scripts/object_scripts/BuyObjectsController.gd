extends Node2D

var buy_nodes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	buy_nodes = get_tree().get_nodes_in_group("buy_node")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
