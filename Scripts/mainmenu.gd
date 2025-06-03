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

func _ready() -> void:
	$SettingsPanel.visible = false


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_settings_pressed() -> void:
	$SettingsPanel.visible = !$SettingsPanel.visible


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_music_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.volume = 0
		$AudioStreamPlayer.stream_paused = true
	else:
		Global.volume = 1
		$AudioStreamPlayer.stream_paused = false


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	Global.volume = -50+($SettingsPanel/HSlider.value/2)
	$AudioStreamPlayer.volume_db = Global.volume


func _on_delete_pressed() -> void:
	$SettingsPanel/AcceptDialog.popup()


func _on_accept_dialog_confirmed() -> void:
	FileAccess.open("user://save.dat", FileAccess.WRITE).store_var(Global.savepreset)
	$SettingsPanel/HSlider.value = 100
	Global.money = 0
	Global.volume = 0
