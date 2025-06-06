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

extends Node

var camerapos = Vector2.ZERO
var volume = 0
var xp = 0
var level = 1
var money = 0
var savepreset = {"money":0,"volume":0}
var muted = false

func load_json(json_file_path):
	return JSON.parse_string(FileAccess.open(json_file_path, FileAccess.READ).get_as_text())
	
func save():
	FileAccess.open("user://save.dat", FileAccess.WRITE).store_var({"money":money,"volume":volume})
func loadsave():
	var file = FileAccess.open("user://save.dat", FileAccess.READ)
	if FileAccess.get_open_error() == 7:
		FileAccess.open("user://save.dat", FileAccess.WRITE).store_var(savepreset)
	return savepreset
