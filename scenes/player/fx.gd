extends Node

signal finishFxDeleteEnemy

func _on_death_finished() -> void:
	finishFxDeleteEnemy.emit()
