extends Node

var camerapos = Vector2.ZERO
var volume = 0
var xp = 0
var level = 1
var money = 0
var savepreset = {"money":0,"volume":0}

func load_json(json_file_path):
	return JSON.parse_string(FileAccess.open(json_file_path, FileAccess.READ).get_as_text())
	
func save():
	FileAccess.open("user://save.dat", FileAccess.WRITE).store_var({"money":money,"volume":volume})
func loadsave():
	var file = FileAccess.open("user://save.dat", FileAccess.READ)
	if FileAccess.get_open_error() == 7:
		FileAccess.open("user://save.dat", FileAccess.WRITE).store_var(savepreset)
	return savepreset
