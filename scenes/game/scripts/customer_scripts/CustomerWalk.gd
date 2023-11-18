extends State
class_name CustomerWalk

@export var player : CharacterBody2D
@export var speed = 300
@export var sprite : Sprite2D
@export var animator : AnimationPlayer

func Enter():
	pass
	
func Physics_Update(delta: float):
	##Find available room location
	##Walk towards available room
	##Once collide with room collider, set visible=false
	if (player.global_position.x < player.goto_location.x):
		player.global_position.x += 300 * delta
		print(player.global_position.x,", ", player.goto_location.x)

