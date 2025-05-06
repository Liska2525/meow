extends Node2D

var looking

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
		self.visible = false
		$AnimatedSprite2D.stop()
