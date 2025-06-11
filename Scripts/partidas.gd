extends Control

class_name partidas

func _on_partida_2_pressed() -> void:
	Global.partidaSeleccionada = "partida2.json"
	var file_enemigo = "user://enemigopartida2.json"
	if FileAccess.file_exists(file_enemigo):
		var file = FileAccess.open(file_enemigo, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		Global.vidaEnemigoActual = json.get("vida")
		Global.vidaEnemigoMaxima = json.get("vida")
	var partida = "user://partida2.json"
	if FileAccess.file_exists(partida):
		var file = FileAccess.open(partida, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		Global.vidaActual = json.get("vidaActual")
		Global.vidaMaxima = json.get("vidaMaxima")
		Global.oro = json.get("oro")
		Global.nivelArena = json.get("nivelArena")
		get_tree().change_scene_to_file("res://Escenas/mapa.tscn")
	else:
		Global.nivelArena = 1
		get_tree().change_scene_to_file("res://Escenas/creacion_personaje.tscn")
	


func _on_partida_3_pressed() -> void:
	Global.partidaSeleccionada = "partida3.json"
	var file_enemigo = "user://enemigopartida3.json"
	if FileAccess.file_exists(file_enemigo):
		var file = FileAccess.open(file_enemigo, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		Global.vidaEnemigoActual = json.get("vida")
		Global.vidaEnemigoMaxima = json.get("vida")
	var partida = "user://partida3.json"
	if FileAccess.file_exists(partida):
		var file = FileAccess.open(partida, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		Global.vidaActual = json.get("vidaActual")
		Global.vidaMaxima = json.get("vidaMaxima")
		Global.oro = json.get("oro")
		Global.nivelArena = json.get("nivelArena")
		get_tree().change_scene_to_file("res://Escenas/mapa.tscn")
	else:
		Global.nivelArena = 1
		get_tree().change_scene_to_file("res://Escenas/creacion_personaje.tscn")


func _on_partida_1_pressed() -> void:
	Global.partidaSeleccionada = "partida1.json"
	var file_enemigo = "user://enemigopartida1.json"
	if FileAccess.file_exists(file_enemigo):
		var file = FileAccess.open(file_enemigo, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		Global.vidaEnemigoActual = json.get("vida")
		Global.vidaEnemigoMaxima = json.get("vida")
	var partida = "user://partida1.json"
	if FileAccess.file_exists(partida):
		var file = FileAccess.open(partida, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		Global.vidaActual = json.get("vidaActual")
		Global.vidaMaxima = json.get("vidaMaxima")
		Global.oro = json.get("oro")
		Global.nivelArena = json.get("nivelArena")
		get_tree().change_scene_to_file("res://Escenas/mapa.tscn")
	else:
		Global.nivelArena = 1
		get_tree().change_scene_to_file("res://Escenas/creacion_personaje.tscn")


func _on_borrar_2_pressed() -> void:
	var partida = "user://partida2.json"
	var file_enemigo = "user://enemigopartida2.json"
	var itemsHerrero = "user://herreropartida2.json"
	var itemsPersonaje = "user://equipopartida2.json"
	var equipoEnemigo = "user://equipoenemigopartida2.json"
	if FileAccess.file_exists(partida):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("partida2.json")
	if FileAccess.file_exists(file_enemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("enemigopartida2.json")
	if FileAccess.file_exists(itemsHerrero):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("herreropartida2.json")
	if FileAccess.file_exists(itemsPersonaje):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipopartida2.json")
	if FileAccess.file_exists(equipoEnemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipoenemigopartida2.json")

func _on_borrar_3_pressed() -> void:
	var partida = "user://partida3.json"
	var file_enemigo = "user://enemigopartida3.json"
	var itemsHerrero = "user://herreropartida3.json"
	var itemsPersonaje = "user://equipopartida3.json"
	var equipoEnemigo = "user://equipoenemigopartida3.json"
	if FileAccess.file_exists(partida):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("partida3.json")
	if FileAccess.file_exists(file_enemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("enemigopartida3.json")
	if FileAccess.file_exists(itemsHerrero):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("herreropartida3.json")
	if FileAccess.file_exists(itemsPersonaje):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipopartida3.json")
	if FileAccess.file_exists(equipoEnemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipoenemigopartida3.json")

func _on_borrar_1_pressed() -> void:
	var partida = "user://partida1.json"
	var file_enemigo = "user://enemigopartida1.json"
	var itemsHerrero = "user://herreropartida1.json"
	var itemsPersonaje = "user://equipopartida1.json"
	var equipoEnemigo = "user://equipoenemigopartida1.json"
	if FileAccess.file_exists(partida):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("partida1.json")
	if FileAccess.file_exists(file_enemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("enemigopartida1.json")
	if FileAccess.file_exists(itemsHerrero):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("herreropartida1.json")
	if FileAccess.file_exists(itemsPersonaje):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipopartida1.json")
	if FileAccess.file_exists(equipoEnemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipoenemigopartida1.json")

func _process(_float) -> void:
	var file_path = "user://partida3.json"
	if FileAccess.file_exists(file_path):
		$Fondo/Pergamino3/BoxContainer3/Borrar3.disabled = false
	else:
		$Fondo/Pergamino3/BoxContainer3/Info3.text = "Sin datos."
		$Fondo/Pergamino3/BoxContainer3/Borrar3.disabled = true
		
	file_path = "user://partida1.json"
	if FileAccess.file_exists(file_path):
		$Fondo/Pergamino1/BoxContainer1/Borrar1.disabled = false
	else:
		$Fondo/Pergamino1/BoxContainer1/Info1.text = "Sin datos."
		$Fondo/Pergamino1/BoxContainer1/Borrar1.disabled = true
		
	file_path = "user://partida2.json"
	if FileAccess.file_exists(file_path):
		$Fondo/Pergamino2/BoxContainer2/Borrar2.disabled = false
	else:
		$Fondo/Pergamino2/BoxContainer2/Info2.text = "Sin datos."
		$Fondo/Pergamino2/BoxContainer2/Borrar2.disabled = true

func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")


func _on_ready() -> void:
	var _partidas = [
		{"ruta": "user://partida3.json", "label": $Fondo/Pergamino3/BoxContainer3/Info3, "rutaEquipo": "user://equipopartida3.json"},
		{"ruta": "user://partida2.json", "label": $Fondo/Pergamino2/BoxContainer2/Info2, "rutaEquipo": "user://equipopartida2.json"},
		{"ruta": "user://partida1.json", "label": $Fondo/Pergamino1/BoxContainer1/Info1, "rutaEquipo": "user://equipopartida1.json"}
	]
	for partida in _partidas:
		if FileAccess.file_exists(partida["ruta"]):
			var listaEquipo: Array = _leer_equipo_personaje(partida["rutaEquipo"])
			var file = FileAccess.open(partida.ruta, FileAccess.READ)
			var contenido = file.get_as_text()
			file.close()
			var json = JSON.parse_string(contenido)
			if json is Dictionary:
				var texto = (
					"Nombre: " + str(json.get("nombre")) + "\n" +
					"Nivel: " + str(json.get("nivelPersonaje")) + "\n" +
					"Oro: " + str(json.get("oro")) + "\n" +
					"Arena: " + str(json.get("nivelArena")) + "\n" +
					"VidaActual: " + str(json.get("vidaActual")) + " + " + str((listaEquipo[1].vitalidad + listaEquipo[3].vitalidad) * 2 ) + "\n" +
					"VidaMaxima: " + str(json.get("vidaMaxima")) + " + "  + str((listaEquipo[1].vitalidad + listaEquipo[3].vitalidad) * 2 ) + "\n" +
					"Fuerza: " + str(json.get("fuerza")) + " + " + str(listaEquipo[0].fuerza + listaEquipo[3].fuerza) + "\n" +
					"Vitalidad: " + str(json.get("vitalidad")) + " + " + str(listaEquipo[1].vitalidad + listaEquipo[3].vitalidad) + "\n" +
					"Defensa: " + str(json.get("defensa")) + " + " + str(listaEquipo[1].defensa + listaEquipo[2].defensa) + "\n" +
					"Agilidad: " + str(json.get("agilidad"))
				)
				partida["label"].text = texto

func _leer_equipo_personaje(rutaEquipo: String) -> Array:
	var listaEquipo: Array = []
	var equipo = rutaEquipo
	if FileAccess.file_exists(equipo):
		var file = FileAccess.open(equipo, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		listaEquipo = []
		for d in json:
			var itm = items.new()
			itm.tipoItem = d["tipoItem"]
			itm.tierItem = int(d["tierItem"])
			itm.fuerza = int(d["fuerza"])
			itm.vitalidad = int(d["vitalidad"])
			itm.defensa = int(d["defensa"])
			itm.precioItem = int(d["precioItem"])
			listaEquipo.append(itm)
	return listaEquipo
