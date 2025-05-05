extends Node2D

var wool = preload("res://Scenes/wool.tscn")
@export var attackrange = 100
@export var speed = 100

func _on_spawn_timer_timeout() -> void:
	var instance = wool.instantiate()
	instance.curve.add_point(Vector2(1,1).rotated(randf_range(0,6.28)).normalized() * attackrange)
	instance.curve.add_point(get_parent().get_parent().global_position)
	instance.get_child(0).loop = false
	add_child(instance)

func _physics_process(delta: float) -> void:
	for child in self.get_children():
		if child.is_in_group("Attacks"):
			if child.get_node("PathFollow2D").progress_ratio == 1:
				child.queue_free()
			else:
				child.get_node("PathFollow2D").progress += speed * delta
