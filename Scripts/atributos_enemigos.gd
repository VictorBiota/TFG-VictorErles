extends Control

func arma() -> void:
	var algo

func enemigo() -> void:
	var nivelArena = 0
	var partidaSeleccionada = Global.partidaSeleccionada
	if partidaSeleccionada != "":
		var file = FileAccess.open(partidaSeleccionada, FileAccess.READ)
		if file:  # Verifica si el archivo se abrió correctamente
			var contenido = file.get_as_text()
			file.close()
			var json = JSON.parse_string(contenido)
			if json is Dictionary:
				nivelArena = int(json.get("nivelArena"))
	if nivelArena != 0:
		var fuerza = 10
		var vitalidad = 10
		var agilidad = 10
		match nivelArena:
			1:
				var disponibles = randi_range(10, 12)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			2:
				var disponibles = randi_range(15, 17)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			3:
				var disponibles = randi_range(20, 22)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			4:
				var disponibles = randi_range(25, 27)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			5:
				var disponibles = randi_range(30, 32)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			6:
				var disponibles = randi_range(35, 37)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			7:
				var disponibles = randi_range(40, 42)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			8:
				var disponibles = randi_range(45, 47)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			9:
				var disponibles = randi_range(50, 52)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			10:
				var disponibles = randi_range(55, 57)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
