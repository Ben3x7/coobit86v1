extends StaticBody2D

@onready var player_pos = get_node('/root/MainWorld/Player')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player_pos.position)
