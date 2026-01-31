extends CharacterBody2D

var speed = 30 
var dir: Vector2
var dirOption = [Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN, Vector2.UP]
var typeFront = "SMALL"
var health = 100
var pickup = preload("res://Levels/GamePieces/Pickup.tscn")
var chase: bool

var type = [
	"SMALL", "MED", "LARGE"
]

func _ready():
	chase = false
	type.shuffle() #This is for testing! In the actual game I imagine it would start with
	#specific types and then become randomized???
	typeFront = type.front()
	print(typeFront)
	match typeFront:
		"SMALL":
			speed = 100
			$Sprite2D.texture=ResourceLoader.load("res://fish/fish1.png")
			health = 20
		"MED": 
			speed = 50
			$Sprite2D.texture=ResourceLoader.load("res://fish/fish2.png")
			health = 50
		"LARGE":
			speed = 20
			$Sprite2D.texture=ResourceLoader.load("res://fish/fish3.png")
			health = 100
	
func _process(delta):
	move(delta)
	#health -= 10
	#print(health)
	
func move(delta):
			
	if !chase:
		velocity += dir * speed * delta
		move_and_slide()
		
	if health <= 0: 
		var dropped = pickup.instantiate()
		dropped.position.x = $CollisionShape2D.global_position.x
		dropped.position.y = $CollisionShape2D.global_position.y
		get_tree().root.add_child(dropped)
		queue_free()
	
	

func _on_timer_timeout():
	$Timer.wait_time = randf_range(1.0, 2.0)
	if !chase: 
		dirOption.shuffle()
		dir = dirOption.front()
		print(dir)


# Called when the node enters the scene tree for the first time.

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
