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
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
extends Node2D

var looking
@export var damage = 10

func _ready() -> void:
	self.visible = false

func _on_spawn_timer_timeout() -> void:
	looking = get_parent().looking
	match looking:
		"right":
			self.rotation = 0
		"rightdown":
			self.rotation = 1/4.0 * PI 
		"down":
			self.rotation = 1/2.0 * PI
		"leftdown":
			self.rotation = 3/4.0 * PI
		"left":
			self.rotation = PI
		"leftup":
			self.rotation = 5/4.0 * PI
		"up":
			self.rotation = 3/2.0 * PI
		"rightup":
			self.rotation = 7/4.0 * PI
	self.visible = true
	$AnimatedSprite2D.play()
	
func _physics_process(delta: float) -> void:
	if $AnimatedSprite2D.frame == 7:
		for enemy in $Area2D.get_overlapping_bodies():
			enemy.hp -= damage
		self.visible = false
		$AnimatedSprite2D.stop()
