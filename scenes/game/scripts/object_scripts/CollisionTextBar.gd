extends Node

@onready var text_label := $RichTextLabel

func set_text_visibility(collision):
	if collision.is_in_group("player"):
		text_label.visible = !text_label.visible

func _on_body_entered(body):
	set_text_visibility(body)

func _on_body_exited(body):
	set_text_visibility(body)
