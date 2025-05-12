extends CharacterBody2D

@export var speed = 10
var direction
@export var hp = 100

func _physics_process(delta: float) -> void:
	print($Sprite2D.rotation_degrees)
	direction = (get_parent().get_parent().get_node("Cat").position - self.position).normalized()
	$Sprite2D.rotation = get_angle_to(get_parent().get_parent().get_node("Cat").position)
	if $Sprite2D.rotation_degrees > 90:
		$Sprite2D.rotation = get_angle_to(get_parent().get_parent().get_node("Cat").position) - PI/2
		$Sprite2D.flip_v = true
	position += direction * speed * delta
	if hp <= 0:
		self.queue_free()
