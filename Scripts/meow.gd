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
