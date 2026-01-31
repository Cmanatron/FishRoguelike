extends Node2D
@export var type:int 

func _on_tree_entered() -> void:
	type = randi_range(0,2)
	match type:
		0:
			$Area2D/Sprite2D.texture = load("res://fish/fish1.png")
		1:
			$Area2D/Sprite2D.texture = load("res://fish/fish2.png")
		2:
			$Area2D/Sprite2D.texture = load("res://fish/fish3.png")
		
