extends CharacterBody2D

var speed = 30 
var dir: Vector2
var dirOption = [Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN, Vector2.UP]
var typeFront = "SMALL"
var health = 100
@onready var player = get_node("../../Player")
var area
var pickup = preload("res://Levels/GamePieces/Pickup.tscn")
var chase: bool

var type = [
	"SMALL", "MED", "LARGE"
]

func _ready():
	#chase = true
	area = $Area2D
	type.shuffle() #This is for testing! In the actual game I imagine it would start with
	#specific types and then become randomized???
	typeFront = type.front()
	print(typeFront)
	match typeFront:
		"SMALL":
			speed = 75
			$Sprite2D.texture=ResourceLoader.load("res://fish/fish1.png")
			health = 20
			chase = false
		"MED": 
			speed = 50
			$Sprite2D.texture=ResourceLoader.load("res://fish/fish2.png")
			health = 50
			chase = false 
			$CollisionShape2D.scale *= 2
			
		"LARGE":
			speed = 20
			$Sprite2D.texture=ResourceLoader.load("res://fish/fish3.png")
			health = 100
			chase = true
			$CollisionShape2D.scale *= 4
			
			
	
func _physics_process(delta):
	#move(delta)
	#health -= 10
	#print(health)
	
				
	#if area.overlaps_body(player):
		#chase = true		
		
	if chase: 
		dir = global_position.direction_to(player.position)
		velocity = dir * speed #* delta
		look_at(player.global_position)
		#dir.x = abs(velocity.x) / velocity.x	
	
	elif !chase:
		velocity += dir * speed * delta
		
	#print(get_viewport().get_mouse_position())	
		
	#print(player.position) 
	
	#print(chase)
	
		
	if health <= 0: 
		var dropped = pickup.instantiate()
		dropped.position.x = $CollisionShape2D.global_position.x
		dropped.position.y = $CollisionShape2D.global_position.y
		get_tree().root.add_child(dropped)
		Global.multiplier += 0.2 
		queue_free()
		
		
	move_and_slide()
	
#func move(delta):

	
	

func _on_timer_timeout():
	$Timer.wait_time = randf_range(1.0, 2.0)
	if !chase: 
		dirOption.shuffle()
		dir = dirOption.front()
		print(dir)
		
	elif chase:
		pass 


# Called when the node enters the scene tree for the first time.

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_area_2d_body_entered(body: Node2D):
	if body == player:
		chase = true
	
	print(body)
	print(chase)
	pass # Replace with function body.
