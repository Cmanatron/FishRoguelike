extends Node2D
@export var type:int 

func _on_tree_entered() -> void:
	type = randi_range(0,7)
	match type:
		0:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/DamageUp.png")
		1:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/SpeedUp.png")
		2:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/O2Up.png")
		3:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/HealthUp.png")
		4:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/BulletSizeUp.png")
		5:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/BulletSpeedUp.png")
		6:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/Bomb.png")
		7:
			$Area2D/Sprite2D.texture = load("res://Sprites/Pickups/Battery.png")


func _on_area_2d_body_entered(body: Node2D) -> void:
	#print(body)
	if(body.is_in_group("Player")):
		match type:
			0:
				body.damage += 5
			1:
				body.speed += 5
			2:
				body.airMax += 500
			3:
				body.MaxHP += 5
			4:
				body.bulletSize += 0.5
			5:
				body.attackSpeed -= 0.5
			6:
				body.grenades += 3
			7:
				body.batteries +=1
				
		queue_free()
