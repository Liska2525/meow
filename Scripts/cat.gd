extends Node2D

@export var speed = 100

var looking = Vector2.ZERO

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity != Vector2.ZERO:
		$SitTimer.stop()
		if velocity == Vector2(1,0):
			looking = "right"
		elif velocity == Vector2(1,1):
			looking = "rightdown"
		elif velocity == Vector2(0,1):
			looking = "down"
		elif velocity == Vector2(-1,1):
			looking = "leftdown"
		elif velocity == Vector2(-1,0):
			looking = "left"
		elif velocity == Vector2(-1,-1):
			looking = "leftup"
		elif velocity == Vector2(0,-1):
			looking = "up"
		elif velocity == Vector2(1,-1):
			looking = "rightup"
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play(looking)
		$SitTimer.start()
	elif "sit" in $AnimatedSprite2D.animation and $AnimatedSprite2D.frame != 5:
		pass
	elif "sit" in $AnimatedSprite2D.animation:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 5
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta


func _on_sit_timer_timeout() -> void:
	$AnimatedSprite2D.play("sit"+looking)
