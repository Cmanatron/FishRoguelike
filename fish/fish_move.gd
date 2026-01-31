extends CharacterBody2D

const speed = 30 
var dir: Vector2
var dirOption = [Vector2.RIGHT, Vector2.LEFT, Vector2.DOWN, Vector2.UP]

var chase: bool

func _ready():
	chase = false
	
func _process(delta):
	move(delta)
	
func move(delta):
	if !chase:
		velocity += dir * speed * delta
	move_and_slide()
		

func _on_timer_timeout():
	$Timer.wait_time = randf_range(1.0, 2.0)
	if !chase: 
		dirOption.shuffle()
		dir = dirOption.front()
		print(dir)


# Called when the node enters the scene tree for the first time.

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
