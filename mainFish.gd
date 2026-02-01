extends Node2D

@export var enemScene: PackedScene

@onready var spawnPath = $Path2D/PathFollow2D

@onready var enem = enemScene.instantiate()

func _ready():
	enem = enemScene.instantiate()
	get_tree().current_scene.add_child(enem)
	$AudioStreamPlayer.play()
	

func _process(delta):
	$enemSpawn.wait_time -= 0.0000001 * Global.multiplier 
	print ($enemSpawn.wait_time)

func _on_enem_spawn_timeout():
	#Creates enemy
	enem = enemScene.instantiate()
	spawnPath.progress_ratio = randf()
	enem.global_position = spawnPath.global_position
	
	get_tree().current_scene.add_child(enem)
	print("spawn")
	print(enem.global_position)

	pass # Replace with function body.
