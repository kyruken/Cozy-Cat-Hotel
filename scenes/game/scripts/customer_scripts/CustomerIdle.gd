extends State
class_name CustomerIdle

@export var player : CharacterBody2D
@export var animator : AnimationPlayer

func Enter():
	owner.velocity = Vector2.ZERO
	
func Update(delta: float):
	if (player.hasLocation == true):
		Transitioned.emit(self, "WalkToRoom")
