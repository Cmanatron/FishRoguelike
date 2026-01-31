extends Node2D
var speed = 10
var stopping = 1
@export var health = 10
@export var air = 100

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		$CharacterBody2D.velocity.y -= 1
	elif Input.is_action_pressed("down"):
		$CharacterBody2D.velocity.y += 1
	elif Input.is_action_pressed("right"):
		$CharacterBody2D.velocity.x += 1
	elif Input.is_action_pressed("left"):
		$CharacterBody2D.velocity.x -= 1
	else:
		if($CharacterBody2D.velocity.x != 0):
			if($CharacterBody2D.velocity.x >0):
				$CharacterBody2D.velocity.x -= stopping
			else:
				$CharacterBody2D.velocity.x += stopping
		if($CharacterBody2D.velocity.y != 0):
			if($CharacterBody2D.velocity.y >0):
				$CharacterBody2D.velocity.y -= stopping
			else:
				$CharacterBody2D.velocity.y += stopping
		
		$CharacterBody2D.move_and_slide()
