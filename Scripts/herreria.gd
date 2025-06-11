extends Control

class_name  herreria

@onready var oro = Global.oro
@onready var espadaComprada: bool = false
@onready var cascoComprada: bool = false
@onready var pecheraComprada: bool = false
@onready var piernasComprada: bool = false
@onready var precioItem: int = 0

func _guardar_itemes_equipados(_items: Array) -> void:
	var itemsHerrero = "user://equipo" + Global.partidaSeleccionada
	var datosItems = []
	for item in _items:
		var datos = {
			"tipoItem": item.tipoItem,
			"tierItem": item.tierItem,
			"fuerza": item.fuerza,
			"vitalidad": item.vitalidad,
			"defensa": item.defensa,
			"precioItem": item.precioItem
		}
		datosItems.append(datos)
	var file = FileAccess.open(itemsHerrero, FileAccess.WRITE)
	file.store_string(JSON.stringify(datosItems))
	file.close()
	Global._timer()

func _guardar_itemes(_items: Array) -> void:
	var itemsHerrero = "user://herrero" + Global.partidaSeleccionada
	var datosItems = []
	for item in _items:
		var datos = {
			"tipoItem": item.tipoItem,
			"tierItem": item.tierItem,
			"fuerza": item.fuerza,
			"vitalidad": item.vitalidad,
			"defensa": item.defensa,
			"precioItem": item.precioItem
		}
		datosItems.append(datos)
	var file = FileAccess.open(itemsHerrero, FileAccess.WRITE)
	file.store_string(JSON.stringify(datosItems))
	file.close()
	Global._timer()

func _comprar_item() -> void:
	var itemsHerrero = "user://herrero" + Global.partidaSeleccionada
	var listaItems: Array
	if FileAccess.file_exists(itemsHerrero):
		var file = FileAccess.open(itemsHerrero, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		listaItems = []
		for d in json:
			var itm = items.new()
			itm.tipoItem = d["tipoItem"]
			itm.tierItem = int(d["tierItem"])
			itm.fuerza = int(d["fuerza"])
			itm.vitalidad = int(d["vitalidad"])
			itm.defensa = int(d["defensa"])
			itm.precioItem = int(d["precioItem"])
			listaItems.append(itm)
	var itemsEquipados = "user://equipo" + Global.partidaSeleccionada
	var listaItemsEquipados: Array
	if FileAccess.file_exists(itemsEquipados):
		var file = FileAccess.open(itemsEquipados, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		listaItemsEquipados = []
		for d in json:
			var itmEquipado = items.new()
			itmEquipado.tipoItem = d["tipoItem"]
			itmEquipado.tierItem = int(d["tierItem"])
			itmEquipado.fuerza = int(d["fuerza"])
			itmEquipado.vitalidad = int(d["vitalidad"])
			itmEquipado.defensa = int(d["defensa"])
			itmEquipado.precioItem = int(d["precioItem"])
			listaItemsEquipados.append(itmEquipado)
	if espadaComprada:
		listaItemsEquipados[0].tipoItem = listaItems[0].tipoItem
		listaItemsEquipados[0].tierItem = listaItems[0].tierItem
		listaItemsEquipados[0].fuerza = listaItems[0].fuerza
		listaItemsEquipados[0].vitalidad = listaItems[0].vitalidad
		listaItemsEquipados[0].defensa = listaItems[0].defensa
		listaItemsEquipados[0].precioItem = listaItems[0].precioItem
		listaItems[0].tipoItem = "comprado"
		listaItems[0].tierItem = 0
		listaItems[0].fuerza = 0
		listaItems[0].vitalidad = 0
		listaItems[0].defensa = 0
		listaItems[0].precioItem = 0
	if cascoComprada:
		listaItemsEquipados[2].tipoItem = listaItems[2].tipoItem
		listaItemsEquipados[2].tierItem = listaItems[2].tierItem
		listaItemsEquipados[2].fuerza = listaItems[2].fuerza
		listaItemsEquipados[2].vitalidad = listaItems[2].vitalidad
		listaItemsEquipados[2].defensa = listaItems[2].defensa
		listaItemsEquipados[2].precioItem = listaItems[2].precioItem
		listaItems[2].tipoItem = "comprado"
		listaItems[2].tierItem = 0
		listaItems[2].fuerza = 0
		listaItems[2].vitalidad = 0
		listaItems[2].defensa = 0
		listaItems[2].precioItem = 0
	if pecheraComprada:
		listaItemsEquipados[1].tipoItem = listaItems[1].tipoItem
		listaItemsEquipados[1].tierItem = listaItems[1].tierItem
		listaItemsEquipados[1].fuerza = listaItems[1].fuerza
		listaItemsEquipados[1].vitalidad = listaItems[1].vitalidad
		listaItemsEquipados[1].defensa = listaItems[1].defensa
		listaItemsEquipados[1].precioItem = listaItems[1].precioItem
		listaItems[1].tipoItem = "comprado"
		listaItems[1].tierItem = 0
		listaItems[1].fuerza = 0
		listaItems[1].vitalidad = 0
		listaItems[1].defensa = 0
		listaItems[1].precioItem = 0
	if piernasComprada:
		listaItemsEquipados[3].tipoItem = listaItems[3].tipoItem
		listaItemsEquipados[3].tierItem = listaItems[3].tierItem
		listaItemsEquipados[3].fuerza = listaItems[3].fuerza
		listaItemsEquipados[3].vitalidad = listaItems[3].vitalidad
		listaItemsEquipados[3].defensa = listaItems[3].defensa
		listaItemsEquipados[3].precioItem = listaItems[3].precioItem
		listaItems[3].tipoItem = "comprado"
		listaItems[3].tierItem = 0
		listaItems[3].fuerza = 0
		listaItems[3].vitalidad = 0
		listaItems[3].defensa = 0
		listaItems[3].precioItem = 0
	_guardar_itemes(listaItems)
	_guardar_itemes_equipados(listaItemsEquipados)

func _on_comprar_pressed() -> void:
	if espadaComprada:
		$Comprar.visible = true
	elif pecheraComprada:
		$Comprar.visible = true
	elif cascoComprada:
		$Comprar.visible = true
	elif piernasComprada:
		$Comprar.visible = true
	else:
		$"Seleciona Item".visible = true

func _on_salir_pressed() -> void:
	_guardar()
	get_tree().change_scene_to_file("res://Escenas/mapa.tscn")

func _process(_float) -> void:
	_on_ready()
	$BoxContainer5/Oro.text = "Oro: " + str(Global.oro)

func _on_ready() -> void:
	$BoxContainer5/Oro.text = "Oro: " + str(Global.oro)
	var itemsHerrero = "user://herrero" + Global.partidaSeleccionada
	var listaItems: Array
	if FileAccess.file_exists(itemsHerrero):
		var file = FileAccess.open(itemsHerrero, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		var json = JSON.parse_string(contenido)
		listaItems = []
		for d in json:
			var itm = items.new()
			itm.tipoItem = d["tipoItem"]
			itm.tierItem = int(d["tierItem"])
			itm.fuerza = int(d["fuerza"])
			itm.vitalidad = int(d["vitalidad"])
			itm.defensa = int(d["defensa"])
			itm.precioItem = int(d["precioItem"])
			listaItems.append(itm)
	else:
		listaItems = _items_herreria(Global.nivelArena)
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
		var file = FileAccess.open(itemsHerrero, FileAccess.WRITE)
		file.store_string(JSON.stringify(datosItems))
		file.close()
		Global._timer()
	var esp = listaItems[0]
	$LabelEspada.text = esp.tipoItem + " +" + str(esp.tierItem) + "\n" \
		+ "Fuerza: "   + str(esp.fuerza)   + "\n" \
		+ "Vitalidad: " + str(esp.vitalidad) + "\n" \
		+ "Defensa: "  + str(esp.defensa) + "\n" \
		+ "Precio: " + str(esp.precioItem) 
	var arm = listaItems[1]
	$LabelArmadura.text = arm.tipoItem + " +" + str(arm.tierItem) + "\n" \
		+ "Fuerza: "   + str(arm.fuerza)   + "\n" \
		+ "Vitalidad: " + str(arm.vitalidad) + "\n" \
		+ "Defensa: "  + str(arm.defensa) + "\n" \
		+ "Precio: " + str(arm.precioItem)
	var cas = listaItems[2]
	$LabelCasco.text = cas.tipoItem + " +" + str(cas.tierItem) + "\n" \
		+ "Fuerza: "   + str(cas.fuerza)   + "\n" \
		+ "Vitalidad: " + str(cas.vitalidad) + "\n" \
		+ "Defensa: "  + str(cas.defensa) + "\n" \
		+ "Precio: " + str(cas.precioItem)
	var pie = listaItems[3]
	$LabelPiernas.text = pie.tipoItem + " +" + str(pie.tierItem) + "\n" \
		+ "Fuerza: "   + str(pie.fuerza)   + "\n" \
		+ "Vitalidad: " + str(pie.vitalidad) + "\n" \
		+ "Defensa: "  + str(pie.defensa) + "\n" \
		+ "Precio: " + str(pie.precioItem)

func _generar_items(tipoItem: String, tierItem: int) -> items:
	var item = items.new()
	item.tipoItem = tipoItem
	match tipoItem:
		"espada":
			item.tierItem = tierItem
			item.fuerza = randi_range(5 * tierItem, 7 * tierItem)
		"armadura":
			item.tierItem = tierItem
			item.vitalidad = randi_range(5 * tierItem, 7 * tierItem)
			item.defensa = randi_range(2 * tierItem, 4 * tierItem)
		"casco":
			item.tierItem = tierItem
			item.defensa = randi_range(5 * tierItem, 7 * tierItem)
		"piernas":
			item.tierItem = tierItem
			item.fuerza = randi_range(2 * tierItem, 4 * tierItem)
			item.vitalidad = randi_range(3 * tierItem, 5 * tierItem)
	item.precioItem = int(item.fuerza * 2 + item.vitalidad * 2 + item.defensa * 2)
	return item
	
func _items_herreria(nivelArena: int) -> Array:
	var listaItems = []
	var tierItem: int
	var nivelArenaItem = nivelArena
	match nivelArenaItem:
		1, 2:
			tierItem = 1
		3, 4:
			tierItem = 2
		5, 6:
			tierItem = 3
		7, 8:
			tierItem = 4
		9, 10:
			tierItem = 5
	for tipoItem in ["espada", "armadura", "casco", "piernas"]:
		listaItems.append(_generar_items(tipoItem, tierItem))
	return listaItems


func _on_button_espada_focus_entered() -> void:
	$LabelEspada.visible = true
	espadaComprada = true
	cascoComprada = false
	piernasComprada = false
	pecheraComprada = false

func _on_button_espada_focus_exited() -> void:
	$LabelEspada.visible = false

func _on_button_casco_focus_entered() -> void:
	$LabelCasco.visible = true
	espadaComprada = false
	cascoComprada = true
	piernasComprada = false
	pecheraComprada = false

func _on_button_casco_focus_exited() -> void:
	$LabelCasco.visible = false

func _on_button_pechera_focus_entered() -> void:
	$LabelArmadura.visible = true
	espadaComprada = false
	cascoComprada = false
	piernasComprada = false
	pecheraComprada = true

func _on_button_pechera_focus_exited() -> void:
	$LabelArmadura.visible = false

func _on_button_piernas_focus_entered() -> void:
	$LabelPiernas.visible = true
	espadaComprada = false
	cascoComprada = false
	piernasComprada = true
	pecheraComprada = false

func _on_button_piernas_focus_exited() -> void:
	$LabelPiernas.visible = false


func _on_comprar_close_requested() -> void:
	espadaComprada = false
	cascoComprada = false
	piernasComprada = false
	pecheraComprada = false
	$Comprar.hide()

func _guardar() -> void:
	var ruta = "user://" + Global.partidaSeleccionada
	var file = FileAccess.open(ruta, FileAccess.READ)
	var contenido = file.get_as_text()
	file.close()
	var json = JSON.parse_string(contenido)
	json["oro"] = Global.oro
	file = FileAccess.open(ruta, FileAccess.WRITE)
	file.store_string(JSON.stringify(json))
	file.close()

func _on_si_comprar_pressed() -> void:
	var itemsHerrero = "user://herrero" + Global.partidaSeleccionada
	var listaItems: Array
	if FileAccess.file_exists(itemsHerrero):
		var file = FileAccess.open(itemsHerrero, FileAccess.READ)
		var contenido = file.get_as_text()
		file.close()
		Global._timer()
		var json = JSON.parse_string(contenido)
		listaItems = []
		for d in json:
			var itm = items.new()
			itm.tipoItem = d["tipoItem"]
			itm.tierItem = int(d["tierItem"])
			itm.fuerza = int(d["fuerza"])
			itm.vitalidad = int(d["vitalidad"])
			itm.defensa = int(d["defensa"])
			itm.precioItem = int(d["precioItem"])
			listaItems.append(itm)
	if espadaComprada:
		precioItem = listaItems[0].precioItem
	if cascoComprada:
		precioItem = listaItems[2].precioItem
	if pecheraComprada:
		precioItem = listaItems[1].precioItem 
	if piernasComprada:
		precioItem = listaItems[3].precioItem
	if (oro - precioItem) < 0:
		$Comprar.visible = false
		$"Sin oro".visible = true
	else:
		Global.oro = oro - precioItem
		_comprar_item()
		_guardar()
		$Comprar.visible = false


func _on_no_comprar_pressed() -> void:
	espadaComprada = false
	cascoComprada = false
	piernasComprada = false
	pecheraComprada = false
	$Comprar.hide()


func _on_sin_oro_close_requested() -> void:
	$"Sin oro".hide()


func _on_seleciona_item_close_requested() -> void:
	$"Seleciona Item".hide()
