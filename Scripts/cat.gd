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
@onready var progressbar = $HUD/ProgressBar
@onready var moneylabel = $HUD/Label
var looking = "right"
@onready var levels = Global.load_json("res://levelup.json")
@onready var AudioPlayer = get_parent().get_node("AudioStreamPlayer")


func _ready() -> void:
	$Levelup.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	progressbar.max_value = levels["1"]
	if not Global.muted:
		AudioPlayer.playing = true
		AudioPlayer.volume_db = Global.volume

func _physics_process(delta: float) -> void:
	
	$HUD/Label.text = str(Global.money)
	
	progressbar.value = Global.xp
	if progressbar.value >= progressbar.max_value:
		Global.xp -= levels[str(Global.level)]
		progressbar.value = Global.xp
		Global.level += 1
		progressbar.max_value = levels[str(Global.level)]
		levelup()
	
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity != Vector2.ZERO:
		$SitTimer.stop()
		if velocity == Vector2(1,0):
			looking = "right"
		elif velocity == Vector2(1,1):
			looking = "rightdown"
		elif velocity == Vector2(0,1):
			looking = "down"
		elif velocity == Vector2(-1,1):
			looking = "leftdown"
		elif velocity == Vector2(-1,0):
			looking = "left"
		elif velocity == Vector2(-1,-1):
			looking = "leftup"
		elif velocity == Vector2(0,-1):
			looking = "up"
		elif velocity == Vector2(1,-1):
			looking = "rightup"
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play(looking)
		$SitTimer.start()
	elif "sit" in $AnimatedSprite2D.animation and $AnimatedSprite2D.frame != 5:
		pass
	elif "sit" in $AnimatedSprite2D.animation:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 5
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	Global.camerapos = self.global_position

func levelup():
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#$Panel.visible = true
	#get_tree().paused = true
	$HUD/TemporaryLevelupLabel.visible = true
	$HUD/TemporaryLevelupTimer.start()



func _on_sit_timer_timeout() -> void:
	$AnimatedSprite2D.play("sit"+looking)

#temporary levelup
func _on_temporary_levelup_timer_timeout() -> void:
	$HUD/TemporaryLevelupLabel.visible = false
