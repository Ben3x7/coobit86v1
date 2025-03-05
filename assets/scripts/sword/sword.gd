extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position()) # отслеживает позицию курсора
	


func _on_hit_body_entered(body: CollisionObject2D) -> void:
	Sigbus.damage.emit()
	

func _on_hit_body_exited(body: CollisionObject2D) -> void:
	pass
