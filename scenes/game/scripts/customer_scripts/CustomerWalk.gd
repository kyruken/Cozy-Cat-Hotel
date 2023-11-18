extends State
class_name CustomerWalk

@export var player : CharacterBody2D
@export var speed = 300
@export var sprite : Sprite2D
@export var animator : AnimationPlayer

func Enter():
	pass
	
func Physics_Update(delta: float):
	pass
	##Find available room location
	##Walk towards available room
	##Once collide with room collider, set visible=false
