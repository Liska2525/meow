extends Node2D

@export var speed = 100

var destination

func _ready() -> void:
	self.global_position = get_parent().get_parent().get_parent().get_node("Cat").position
	destination = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	$TTL.start()

func _physics_process(delta: float) -> void:
	self.position += destination * speed * delta
	self.rotation += PI/100 * speed * delta
	
func _on_ttl_timeout() -> void:
	self.queue_free()
