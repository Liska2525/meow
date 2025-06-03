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

extends CharacterBody2D

@export var speed = 40
var direction
@export var hp = 10
@export var xp = 10
@export var money = 1

func _ready() -> void:
	var camerapos = Global.camerapos
	match  randi_range(1,4):
		1:
			self.position = Vector2(randi_range(camerapos.x - 1000,camerapos.x + 1000),camerapos.y-600)
		2:
			self.position = Vector2(randi_range(camerapos.x - 1000,camerapos.x + 1000),camerapos.y+600)
		3:
			self.position = Vector2(camerapos.x - 1000,randi_range(camerapos.y-600,camerapos.y+600))
		4:
			self.position = Vector2(camerapos.x + 1000,randi_range(camerapos.y-600,camerapos.y+600))

func _physics_process(delta: float) -> void:
	direction = (get_parent().get_parent().get_node("Cat").position - self.position).normalized()
	if direction.x < 0:
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.flip_h = false
	position += direction * speed * delta
	if hp <= 0:
		Global.xp += xp
		Global.money += money
		self.queue_free()
