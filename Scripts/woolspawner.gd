extends Node2D

var wool = preload("res://Scenes/wool.tscn")


func _on_spawn_timer_timeout() -> void:
	var instance = wool.instantiate()
	add_child(instance)
