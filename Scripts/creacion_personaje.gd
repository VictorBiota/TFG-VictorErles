extends Control

@onready var popup = $Window

func _on_restar_fuerza_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Fuerza.text) - 1
	$BoxContainerAtributos/Atributos/Fuerza.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) + 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_restar_vitalidad_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Vitalidad.text) - 1
	$BoxContainerAtributos/Atributos/Vitalidad.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) + 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_restar_agilidad_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Agilidad.text) - 1
	$BoxContainerAtributos/Atributos/Agilidad.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) + 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_sumar_fuerza_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Fuerza.text) + 1
	$BoxContainerAtributos/Atributos/Fuerza.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) - 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_sumar_vitalidad_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Vitalidad.text) + 1
	$BoxContainerAtributos/Atributos/Vitalidad.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) - 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_sumar_agilidad_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Agilidad.text) + 1
	$BoxContainerAtributos/Atributos/Agilidad.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) - 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)

func _on_crear_pressed() -> void:
	var nombre = $NombreJugador.text.strip_edges().length()
	var disponibles = int($PuntosDisonibles/Disponibles.text)
	if nombre > 0 and disponibles == 0:
		var listaItems: Array = _crear_equipo()
		crear_y_guardar_json(listaItems)
		get_tree().change_scene_to_file("res://Escenas/mapa.tscn")
	else:
		popup.popup_centered()

func crear_y_guardar_json(listaItems: Array) -> void:
	var ImportEnemigo = Enemigo.new()
	ImportEnemigo.enemigo()
	var datos = {
		"nivelPersonaje": 1,
		"nivelArena": 1,
		"oro": 100,
		"nombre": $NombreJugador.text,
		"fuerza": int($BoxContainerAtributos/Atributos/Fuerza.text),
		"vitalidad": int($BoxContainerAtributos/Atributos/Vitalidad.text),
		"agilidad": int($BoxContainerAtributos/Atributos/Agilidad.text),
		"defensa": 0,
		"vidaMaxima": 100 + ((int($BoxContainerAtributos/Atributos/Vitalidad.text) - 10) * 2),
		"vidaActual": 100 + ((int($BoxContainerAtributos/Atributos/Vitalidad.text) - 10) * 2)
	}
	Global.vidaActual = datos["vidaActual"]
	Global.vidaMaxima = datos["vidaMaxima"]
	var file_path = "user://" + Global.partidaSeleccionada
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(datos))
	file.close()
	Global._timer()

func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/partidas.tscn")

func _process(_float) -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Fuerza.text)
	if fuerza == 10:
		$BoxContainerAtributos/Restar/RestarFuerza.disabled = true
	else:
		$BoxContainerAtributos/Restar/RestarFuerza.disabled = false
	var vitalidad = int($BoxContainerAtributos/Atributos/Vitalidad.text)
	if vitalidad == 10:
		$BoxContainerAtributos/Restar/RestarVitalidad.disabled = true
	else:
		$BoxContainerAtributos/Restar/RestarVitalidad.disabled = false
	var agilidad = int($BoxContainerAtributos/Atributos/Agilidad.text)
	if agilidad == 10:
		$BoxContainerAtributos/Restar/RestarAgilidad.disabled = true
	else:
		$BoxContainerAtributos/Restar/RestarAgilidad.disabled = false
	var disponibles = int($PuntosDisonibles/Disponibles.text)
	if disponibles == 0:
		$BoxContainerAtributos/Sumar/SumarFuerza.disabled = true
		$BoxContainerAtributos/Sumar/SumarVitalidad.disabled = true
		$BoxContainerAtributos/Sumar/SumarAgilidad.disabled = true
	else:
		$BoxContainerAtributos/Sumar/SumarFuerza.disabled = false
		$BoxContainerAtributos/Sumar/SumarVitalidad.disabled = false
		$BoxContainerAtributos/Sumar/SumarAgilidad.disabled = false


func _on_window_close_requested() -> void:
	popup.hide()
	

func _crear_equipo() -> Array:
	var itemsPersonaje = "user://equipo" + Global.partidaSeleccionada
	var listaItems: Array
	var importHerreria = herreria.new()
	for tipoItem in ["espada", "armadura", "casco", "piernas"]:
		listaItems.append(importHerreria._generar_items(tipoItem, 1))
	var datosItems = []
	for item in listaItems:
		var datos = {
			"tipoItem": item.tipoItem,
			"tierItem": item.tierItem,
			"fuerza": item.fuerza,
			"vitalidad": item.vitalidad,
			"defensa": item.defensa,
			"precioItem": item.precioItem
		}
		datosItems.append(datos)
	var file = FileAccess.open(itemsPersonaje, FileAccess.WRITE)
	file.store_string(JSON.stringify(datosItems))
	file.close()
	Global._timer()
	return listaItems
