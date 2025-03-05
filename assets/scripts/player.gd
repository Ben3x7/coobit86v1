extends CharacterBody2D

@export var speed = GPlayer.speed
@export var acceleration = GPlayer.acceleration


func get_input() -> void:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("left", "right")
	input_vector.y = Input.get_axis("up", "down")
	velocity = input_vector.normalized() * speed

	if Input.is_action_pressed("acceleration"):
		velocity = input_vector.normalized() * speed * acceleration
	if Input.is_action_just_pressed('restart'):
		get_tree().change_scene_to_file("res://scenes/main_world.tscn")

func animationSprite():
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true

	if velocity.x < 0:
		$AnimationPlayer.play("walk")
	if velocity.x > 0:
		$AnimationPlayer.play("walk")
	if velocity.y < 0:
		$AnimationPlayer.play("walk")
	if velocity.y > 0:
		$AnimationPlayer.play("walk")

func Mecha():
	if GPlayer.enterMecha == true:
		speed = speed + GPlayer.speedMecha
	if GPlayer.enterMecha == false:
		speed = 100
	if speed > 500:
		speed = 500


func _process(_delta: float):



	get_input()
	animationSprite()
	move_and_slide()


func _on_sword_child_entered_tree(node: Node) -> void:
	pass
