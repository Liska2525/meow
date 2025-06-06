#MIT License
#
#Copyright (c) 2025 Filip Štefko
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

extends Node2D

@export var speed = 100
@export var damage = 100
var destination

func _ready() -> void:
	self.global_position = get_parent().get_parent().get_node("Cat").position
	destination = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	$TTL.start()

func _physics_process(delta: float) -> void:
	self.position += destination * speed * delta
	self.rotation += PI/100 * speed * delta
	for enemy in $Area2D.get_overlapping_bodies():
			enemy.hp -= damage * delta
			
	
func _on_ttl_timeout() -> void:
	self.queue_free()
