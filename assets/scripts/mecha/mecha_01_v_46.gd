extends CharacterBody2D

@onready var player = $"../Player"
@onready var collisionMecha = $CollisionMecha

var enterPlayer = false

#  вход игрока
func _on_detection_area_body_entered(body: Node2D) -> void:
	$DetectionArea/ShowEntryInformation.visible = true
	enterPlayer = true
	player.visible = false
	GPlayer.enterMecha = true
	
#  выход игрока
func _on_detection_area_body_exited(body: Node2D) -> void:
	$DetectionArea/ShowEntryInformation.visible = false
	enterPlayer = false
	player.visible = true
	GPlayer.enterMecha = false

#  позиция Мехи уменьшается в сторону игрока, создается эффект как будто мы упровляем мехай, 
#  самом деле, просто все время он двигается в нашу строну 
func enterPlayerVehicle():
	var player_position = player.position
	position += player_position - position 
	

func _process(delta: float) -> void:
	if enterPlayer:
		enterPlayerVehicle()
		collisionMecha.disabled = true
		
