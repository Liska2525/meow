extends Node2D

var mouse = preload("res://Scenes/mouse.tscn")


func _on_spawn_timer_timeout() -> void:
	var instance = mouse.instantiate()
	add_child(instance)
