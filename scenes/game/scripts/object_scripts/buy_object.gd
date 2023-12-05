extends Node2D

signal bought_object(object)

var player_inside = false

var player
@export var spawn_object : PackedScene

func _process(delta):
	if player_inside:
		buy_object(player)

func buy_object(body):
	#sets room to not hasCustomer, customer is null, etc.
	if (body.is_in_group("player") and Input.is_action_pressed("ui_action")):
		var new_object = spawn_object.instantiate()
		print(new_object)
		get_tree().get_root().get_node("Main").add_child(new_object)
		new_object.global_position = self.global_position
		bought_object.emit(new_object)
		queue_free()
		
func _on_text_box_area_2d_body_entered(body):
	player = body
	player_inside = true


func _on_text_box_area_2d_body_exited(body):
	player_inside = false
