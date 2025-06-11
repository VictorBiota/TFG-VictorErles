extends Control

@onready var popup = $Window
@onready var nivelArena = Global.nivelArena

var fuerzaInicial = 0
var agildadInicial = 0
var vitalidadInicial = 0
var nivelArenaInicial = 0
var nivelPersonajeInicial = 0

func subir_nivel_guardar_json() -> void:
	var oroGanado: int = randi_range(70, 150)
	Global.oro = Global.oro + oroGanado
	var ruta = "user://" + Global.partidaSeleccionada
	var file = FileAccess.open(ruta, FileAccess.READ)
	var contenido = file.get_as_text()
	file.close()
	var json = JSON.parse_string(contenido)
	var vidaMaxima = 100 + ((int($BoxContainerAtributos/Atributos/Vitalidad.text) - 10) * 2)
	var vidaActual = Global.vidaActual + ((int($BoxContainerAtributos/Atributos/Vitalidad.text) - int(vitalidadInicial)) * 2)
	json["fuerza"] = int($BoxContainerAtributos/Atributos/Fuerza.text)
	json["vitalidad"] = int($BoxContainerAtributos/Atributos/Vitalidad.text)
	json["agilidad"]  = int($BoxContainerAtributos/Atributos/Agilidad.text)
	json["nivelArena"] = Global.nivelArena
	json["nivelPersonaje"] = Global.nivelArena
	json["vidaMaxima"] = vidaMaxima
	json["vidaActual"] = vidaActual
	json["oro"] = Global.oro
	file = FileAccess.open(ruta, FileAccess.WRITE)
	file.store_string(JSON.stringify(json))
	file.close()
	Global._timer()

func _on_ready() -> void:
	var partida = "user://" + Global.partidaSeleccionada
	if FileAccess.file_exists(partida):
		var file = FileAccess.open(partida, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		nivelPersonajeInicial = json.get("nivelPersonaje")
		nivelArenaInicial = json.get("nivelArena")
		fuerzaInicial = str(json.get("fuerza"))
		agildadInicial = str(json.get("agilidad"))
		vitalidadInicial = str(json.get("vitalidad"))
		$BoxContainerAtributos/Atributos/Agilidad.text = agildadInicial
		$BoxContainerAtributos/Atributos/Fuerza.text = fuerzaInicial
		$BoxContainerAtributos/Atributos/Vitalidad.text = vitalidadInicial

func _process(_float) -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Fuerza.text)
	if fuerza == int(fuerzaInicial):
		$BoxContainerAtributos/Restar/RestarFuerza.disabled = true
	else:
		$BoxContainerAtributos/Restar/RestarFuerza.disabled = false
	var vitalidad = int($BoxContainerAtributos/Atributos/Vitalidad.text)
	if vitalidad == int(vitalidadInicial):
		$BoxContainerAtributos/Restar/RestarVitalidad.disabled = true
	else:
		$BoxContainerAtributos/Restar/RestarVitalidad.disabled = false
	var agilidad = int($BoxContainerAtributos/Atributos/Agilidad.text)
	if agilidad == int(agildadInicial):
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


func _on_restar_agilidad_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Agilidad.text) - 1
	$BoxContainerAtributos/Atributos/Agilidad.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) + 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_restar_vitalidad_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Vitalidad.text) - 1
	$BoxContainerAtributos/Atributos/Vitalidad.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) + 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_restar_fuerza_pressed() -> void:
	var fuerza = int($BoxContainerAtributos/Atributos/Fuerza.text) - 1
	$BoxContainerAtributos/Atributos/Fuerza.text = str(fuerza)
	var diponibles = int($PuntosDisonibles/Disponibles.text) + 1
	$PuntosDisonibles/Disponibles.text = str(diponibles)


func _on_window_close_requested() -> void:
	popup.hide()


func _on_subir_nivel_pressed() -> void:
	var disponibles = int($PuntosDisonibles/Disponibles.text)
	Global.nivelArena = nivelArena + 1
	if disponibles == 0:
		var ImportEnemigo = Enemigo.new()
		ImportEnemigo.enemigo()
		subir_nivel_guardar_json()
		_cambiar_items()
		get_tree().change_scene_to_file("res://Escenas/mapa.tscn")
	else:
		popup.popup_centered()

func _cambiar_items() -> void:
	var itemsHerreria = herreria.new()
	var listaItems = itemsHerreria._items_herreria(Global.nivelArena)
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
	var file = FileAccess.open("user://herrero" + Global.partidaSeleccionada, FileAccess.WRITE)
	file.store_string(JSON.stringify(datosItems))
	file.close()
	Global._timer()
	
