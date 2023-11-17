extends Node2D

@onready var teleporter_label = $RichTextLabel
@onready var player_in_range = false

@export var other_teleporter : Node2D

var player

func _process(delta):
	if Input.is_action_just_pressed("ui_action") and player_in_range:
		player.position = other_teleporter.position


func _on_collision_shape_2d_body_entered(body):
	player = body
	teleporter_label.visible = true
	player_in_range = true


func _on_collision_shape_2d_body_exited(body):
	teleporter_label.visible = false
	player_in_range = false
