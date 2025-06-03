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

@export var damage = 30

func _ready() -> void:
	self.visible = false

func _on_spawn_timer_timeout() -> void:
	self.visible = true
	$AnimatedSprite2D.play()
	
func _physics_process(delta: float) -> void:
	if $AnimatedSprite2D.frame == 8:
		$AnimatedSprite2D.stop()
	elif $AnimatedSprite2D.frame == 4:
		for enemy in $Area2D.get_overlapping_bodies():
			enemy.hp -= damage
