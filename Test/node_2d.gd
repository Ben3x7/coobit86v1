extends Node2D

@export_enum("Sword:10", "Spear", "Mace") var character_items: Array[int]

enum CharacterName {REBECCA, MARY, LEAH}
@export var character_name: CharacterName

func _ready() -> void:
	print(character_items[0])
