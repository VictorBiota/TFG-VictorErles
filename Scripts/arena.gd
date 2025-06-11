extends Control

class_name  arena

@onready var vidaActual = Global.vidaActual
@onready var vidaMaxima = Global.vidaMaxima
@onready var fuerzaPersonaje :int
@onready var fuerzaEnemigo :int
@onready var defensaPersonaje : int
@onready var defensaEnemigo: int
@onready var agilidadPersonaje: int
@onready var agilidadEnemigo: int
@onready var contador: int = 0

func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/mapa.tscn")

func _equipo_enemigo() -> Array:
	var listaEquipo: Array = []
	var equipo = "user://equipoenemigo" + Global.partidaSeleccionada
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

func _process(_float) -> void:
	$ProgressBar.max_value = vidaMaxima
	$ProgressBar.value = vidaActual
	$ProgressBar2.max_value = Global.vidaEnemigoMaxima
	$ProgressBar2.value = Global.vidaEnemigoActual
	if $ProgressBar2.value == 0:
		$BoxContainer3.visible = false
		$BoxContainer.visible = true
		$BoxContainer2.visible = false
		$Fondo/Pergamino2/BoxContainer2/Info2.text = "Has muerto"
		if Global.nivelArena == 10:
			$BoxContainer.visible = false
			$Terminar.visible = true
	if $ProgressBar.value == 0:
		$Muerte.visible = true
		$Fondo/Pergamino1/BoxContainer1/info1.text = "Has muerto"

func _equipo_personaje() -> Array:
	var listaEquipo: Array = []
	var equipo = "user://equipo" + Global.partidaSeleccionada
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

func _on_ready() -> void:
	var equipoEnemigo: Array = _equipo_enemigo()
	var statsEnemigo = "user://enemigo" + Global.partidaSeleccionada
	if FileAccess.file_exists(statsEnemigo):
			var file = FileAccess.open(statsEnemigo, FileAccess.READ)
			var contenido = file.get_as_text()
			file.close()
			var json = JSON.parse_string(contenido)
			if json is Dictionary:
				var texto = (
					"Nombre: " + str(json.get("nombre")) + "\n" +
					"Nivel: " + str(json.get("nivelPersonaje")) + "\n" +
					"Oro: " + str(json.get("oro")) + "\n" +
					"Arena: " + str(json.get("nivelArena")) + "\n" +
					"VidaMaxima: " + str(json.get("vida")) + " + " + str((equipoEnemigo[1].vitalidad + equipoEnemigo[3].vitalidad) * 2) + "\n" +
					"Fuerza: " + str(json.get("fuerza")) + " + " + str(equipoEnemigo[0].fuerza + equipoEnemigo[3].fuerza) + "\n" +
					"Vitalidad: " + str(json.get("vitalidad")) + " + " + str(equipoEnemigo[1].vitalidad + equipoEnemigo[3].vitalidad) + "\n" +
					"Defensa: " + str(json.get("defensa")) + " + " + str(equipoEnemigo[1].defensa + equipoEnemigo[2].defensa) + "\n" +
					"Agilidad: " + str(json.get("agilidad"))
				)
				$Fondo/Pergamino2/BoxContainer2/Info2.text = texto
				fuerzaEnemigo = json.get("fuerza") + equipoEnemigo[0].fuerza + equipoEnemigo[3].fuerza
				defensaEnemigo = json.get("defensa") + equipoEnemigo[1].defensa + equipoEnemigo[2].defensa
				agilidadEnemigo = json.get("agilidad")
				Global.vidaEnemigoMaxima = json.get("vida") + ((equipoEnemigo[1].vitalidad + equipoEnemigo[3].vitalidad) * 2)
				Global.vidaEnemigoActual = json.get("vida") + ((equipoEnemigo[1].vitalidad + equipoEnemigo[3].vitalidad) * 2)
	var equipoPersonaje: Array = _equipo_personaje()
	var statsPersonaje = "user://" + Global.partidaSeleccionada
	if FileAccess.file_exists(statsPersonaje):
			var file = FileAccess.open(statsPersonaje, FileAccess.READ)
			var contenido = file.get_as_text()
			file.close()
			var json = JSON.parse_string(contenido)
			if json is Dictionary:
				var texto = (
					"Nombre: " + str(json.get("nombre")) + "\n" +
					"Nivel: " + str(json.get("nivelPersonaje")) + "\n" +
					"Oro: " + str(json.get("oro")) + "\n" +
					"Arena: " + str(json.get("nivelArena")) + "\n" +
					"VidaMaxima: " + str(vidaMaxima) + " + " + str((equipoPersonaje[1].vitalidad + equipoPersonaje[3].vitalidad) * 2)  + "\n" +
					"VidaActual: " + str(vidaActual) + " + " + str((equipoPersonaje[1].vitalidad + equipoPersonaje[3].vitalidad) * 2) +  "\n" + 
					"Fuerza: " + str(json.get("fuerza")) + " + " + str(equipoPersonaje[0].fuerza + equipoPersonaje[3].fuerza) + "\n" +
					"Vitalidad: " + str(json.get("vitalidad")) + " + " + str(equipoPersonaje[1].vitalidad + equipoPersonaje[3].vitalidad) + "\n" +
					"Defensa: " + str(json.get("defensa")) + " + " + str(equipoPersonaje[1].defensa + equipoPersonaje[2].defensa) + "\n" +
					"Agilidad: " + str(json.get("agilidad"))
				)
				$Fondo/Pergamino1/BoxContainer1/info1.text = texto
				fuerzaPersonaje = json.get("fuerza") + equipoPersonaje[0].fuerza + equipoPersonaje[3].fuerza
				defensaPersonaje = json.get("defensa") + equipoPersonaje[1].defensa + equipoPersonaje[2].defensa
				agilidadPersonaje = json.get("agilidad")
				vidaMaxima = vidaMaxima + (equipoPersonaje[1].vitalidad + equipoPersonaje[3].vitalidad) * 2
				vidaActual = vidaActual + (equipoPersonaje[1].vitalidad + equipoPersonaje[3].vitalidad) * 2
	$ProgressBar.max_value = vidaMaxima
	$ProgressBar.value = vidaActual
	$ProgressBar2.max_value = Global.vidaEnemigoMaxima
	$ProgressBar2.value = Global.vidaEnemigoMaxima


func _on_pelear_pressed() -> void:
	$Fondo/BoxContainer.visible = false
	$BoxContainer3.visible = true
	$BoxContainer2.visible = true
	$Fondo/Pergamino1/BoxContainer1/info1.text = ""
	$Fondo/Pergamino2/BoxContainer2/Info2.text = ""

func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")


func _on_subir_nivel_pressed() -> void:
	var equipoPersonaje: Array = _equipo_personaje()
	Global.vidaActual = $ProgressBar.value - (equipoPersonaje[1].vitalidad + equipoPersonaje[3].vitalidad) * 2
	get_tree().change_scene_to_file("res://Escenas/subir_nivel.tscn")

func _esquivar_enemigo() -> bool:
	randomize()
	var esquivar = agilidadEnemigo
	if esquivar > 50:
		esquivar = 50
	var porcentaje = randi_range(1, 100)
	return porcentaje <= esquivar

func _esquivar_personaje() -> bool:
	randomize()
	var esquivar = agilidadPersonaje
	if esquivar > 50:
		esquivar = 50
	var porcentaje = randi_range(1, 100)
	return porcentaje <= esquivar

func _on_atacar_pressed() -> void:
	if contador <= 12:
		contador += 1
	else:
		$Fondo/Pergamino1/BoxContainer1/info1.text = ""
		$Fondo/Pergamino2/BoxContainer2/Info2.text = ""
		contador = 0
	var dañoPersonaje = fuerzaPersonaje - defensaEnemigo
	var dañoEnemigo = fuerzaEnemigo - defensaPersonaje
	var accion = randi_range(0, 99)
	var textoPersonaje = ""
	var textoEnemigo = ""
	if accion > 45:
		if dañoPersonaje > 0:
			Global.vidaEnemigoActual = Global.vidaEnemigoActual - dañoPersonaje
		if dañoEnemigo > 0:
			vidaActual = vidaActual - dañoEnemigo
		textoPersonaje = "Daño hecho: " + str(dañoPersonaje) + "\n"
		textoEnemigo = "Daño hecho: " + str(dañoEnemigo) + "\n"
	else:
		if _esquivar_enemigo():
			if dañoPersonaje > 0:
				Global.vidaEnemigoActual = Global.vidaEnemigoActual - dañoPersonaje
				textoPersonaje = "Daño hecho: " + str(dañoPersonaje) + "\n" 
				textoEnemigo = "No has esquivado \n"
		else:
			textoPersonaje = "Te ha esquivado \n"
			textoEnemigo = "Has esquivado \n"
	$Fondo/Pergamino1/BoxContainer1/info1.text = $Fondo/Pergamino1/BoxContainer1/info1.text + textoPersonaje
	$Fondo/Pergamino2/BoxContainer2/Info2.text = $Fondo/Pergamino2/BoxContainer2/Info2.text + textoEnemigo
	

func _on_esquivar_pressed() -> void:
	if contador <= 11:
		contador += 1
	else:
		$Fondo/Pergamino1/BoxContainer1/info1.text = ""
		$Fondo/Pergamino2/BoxContainer2/Info2.text = ""
		contador = 0
	var dañoEnemigo = fuerzaEnemigo - defensaPersonaje
	var textoPersonaje = ""
	var textoEnemigo = ""
	if _esquivar_personaje():
		if dañoEnemigo > 0:
			vidaActual = vidaActual - dañoEnemigo
			textoPersonaje = "No has esquivado \n"
			textoEnemigo = "Daño hecho: " + str(dañoEnemigo) + "\n"
	else:
		textoPersonaje = "Has esquivado \n"
		textoEnemigo = "Te ha esquivado \n"
	$Fondo/Pergamino1/BoxContainer1/info1.text = $Fondo/Pergamino1/BoxContainer1/info1.text + textoPersonaje
	$Fondo/Pergamino2/BoxContainer2/Info2.text = $Fondo/Pergamino2/BoxContainer2/Info2.text + textoEnemigo

func _on_muerte_close_requested() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")
	var partida = "user://" + Global.partidaSeleccionada
	var file_enemigo = "user://enemigo" + Global.partidaSeleccionada
	var itemsHerrero = "user://herrero" + Global.partidaSeleccionada
	var itemsPersonaje = "user://equipo" + Global.partidaSeleccionada
	var equipoEnemigo = "user://equipoenemigo" + Global.partidaSeleccionada
	if FileAccess.file_exists(partida):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove(Global.partidaSeleccionada)
	if FileAccess.file_exists(file_enemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("enemigo" + Global.partidaSeleccionada) 
	if FileAccess.file_exists(itemsHerrero):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("herrero" + Global.partidaSeleccionada)
	if FileAccess.file_exists(itemsPersonaje):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipo" + Global.partidaSeleccionada)
	if FileAccess.file_exists(equipoEnemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipoenemigo" + Global.partidaSeleccionada)
	Global.nivelArena = 1

func _on_ok_pressed() -> void:
	_on_muerte_close_requested()

func _on_terminar_close_requested() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")
	var partida = "user://" + Global.partidaSeleccionada
	var file_enemigo = "user://enemigo" + Global.partidaSeleccionada
	var itemsHerrero = "user://herrero" + Global.partidaSeleccionada
	var itemsPersonaje = "user://equipo" + Global.partidaSeleccionada
	var equipoEnemigo = "user://equipoenemigo" + Global.partidaSeleccionada
	if FileAccess.file_exists(partida):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove(Global.partidaSeleccionada)
	if FileAccess.file_exists(file_enemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("enemigo" + Global.partidaSeleccionada) 
	if FileAccess.file_exists(itemsHerrero):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("herrero" + Global.partidaSeleccionada)
	if FileAccess.file_exists(itemsPersonaje):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipo" + Global.partidaSeleccionada)
	if FileAccess.file_exists(equipoEnemigo):
		var dir = DirAccess.open("user://")
		if dir:
			dir.remove("equipoenemigo" + Global.partidaSeleccionada)
	Global.nivelArena = 1


func _on_ok_2_pressed() -> void:
	_on_terminar_close_requested()
