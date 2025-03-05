extends CharacterBody2D

@export_category(':: Управление Персонажем ::')
@export var hp: int = 100
@export var damage: int = 5
@export_category('Enemy Paraments')
@export var speed = 100

@onready var player = get_node("/root/MainWorld/Player")
@onready var detect_player = false

var damage_detect = false


func _process(delta: float):
# Func begin
	playerMovement()
	var a = str(hp)
	$hp_bar/Label.text = a
	
	if damage_detect:
		hp -= 1 * delta
		#if hp <= 0:
			#$Fx/Death.play()
			#$Fx.connect("finishFxDeleteEnemy", deathEnemy)
		if hp == 0 or damage_detect == true:
			$Fx/Death.play()
			$Fx.connect("finishFxDeleteEnemy", deathEnemy)

func _on_detect_player_body_entered(body) -> void:

	detect_player = true


func _on_detect_player_body_exited(body) -> void:

	detect_player = false



func playerMovement():
	if detect_player:
		var player_pos = player.position
		position += (player_pos - position)/speed


func _on_damege_zone_area_entered(area: Area2D) -> void:
	damage_detect = true


func _on_damege_zone_area_exited(area: Area2D) -> void:
	damage_detect = false


func deathEnemy():
	queue_free()
