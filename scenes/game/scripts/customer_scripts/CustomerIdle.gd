extends State
class_name CustomerIdle

@export var animator : AnimationPlayer

func Enter():
	owner.velocity = Vector2.ZERO
	
func Update(delta: float):
	pass
#	Transitioned.emit(self, "walk")
