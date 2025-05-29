extends Node2D


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
