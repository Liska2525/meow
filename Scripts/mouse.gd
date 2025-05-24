extends CharacterBody2D

@export var speed = 40
var direction
@export var hp = 10

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
		self.queue_free()
