extends State
class_name CustomerLeave

@export var player : CharacterBody2D

func Enter():
	pass
	
func Physics_Update(delta: float):
	if (player.global_position.x < player.despawn_location.x):
		player.global_position.x += 300 * delta
	else:
		despawn()

func despawn():
	get_parent().get_parent().queue_free()
