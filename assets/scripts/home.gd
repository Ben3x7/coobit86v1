extends StaticBody2D

@export var room: PackedScene
@onready var displayPush: Label = $DisplayPush/OpenInfo


var insidePlayerArea = false

func _on_display_push_body_entered(_body: CollisionObject2D):
	displayPush.visible = true
	insidePlayerArea = true


func _on_display_push_body_exited(_body: CollisionObject2D):
	displayPush.visible = false

func _process(_delta: float):
	if insidePlayerArea and Input.is_action_just_pressed("interaction"):
		if room is PackedScene:
			get_tree().change_scene_to_packed(room)
		else:
			displayPush.text = 'NO-ROOT-TSCN'
