extends CharacterBody2D

@export var speed = 10
var direction


func _physics_process(delta: float) -> void:
	direction = Vector2.from_angle(get_angle_to(get_node("/root/Cat").position)).normalized()
	position += direction * speed * delta
