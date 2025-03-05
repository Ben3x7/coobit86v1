extends Node2D

@onready var playerCameraLimit = $Player/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerCameraLimit.limit_right = 512
	playerCameraLimit.limit_bottom = 360


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
