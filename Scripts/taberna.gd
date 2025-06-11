extends Control

@onready var vidaActual = Global.vidaActual
@onready var vidaMaxima = Global.vidaMaxima
@onready var oro = Global.oro

func _guardar() -> void:
	var listaItems: Array = arena.new()._equipo_personaje()
	var ruta = "user://" + Global.partidaSeleccionada
	var file = FileAccess.open(ruta, FileAccess.READ)
	var contenido = file.get_as_text()
	file.close()
	var json = JSON.parse_string(contenido)
	json["vidaActual"] = vidaActual - (listaItems[1].vitalidad + listaItems[3].vitalidad) * 2
	json["vidaMaxima"] = vidaMaxima - (listaItems[1].vitalidad + listaItems[3].vitalidad) * 2
	json["oro"] = Global.oro
	file = FileAccess.open(ruta, FileAccess.WRITE)
	file.store_string(JSON.stringify(json))
	file.close()
	Global._timer()

func _on_salir_pressed() -> void:
	_guardar()
	get_tree().change_scene_to_file("res://Escenas/mapa.tscn")


func _on_dormir_pressed() -> void:
	$"Popup Dormir".visible = true


func _on_descansar_pressed() -> void:
	$"Popup Descansar".visible = true



func _on_si_dormir_pressed() -> void:
	if (Global.oro - 100) >= 0:
		vidaActual = vidaMaxima
		Global.oro = Global.oro - 100
		Global.vidaActual = Global.vidaMaxima
		$"Popup Dormir".hide()
		$BoxContainer3/Descansar.disabled = true
		$BoxContainer3/Dormir.disabled = true
	else:
		$"Sin oro".visible = true


func _on_no_dormir_pressed() -> void:
	$"Popup Dormir".hide()


func _on_si_descansar_pressed() -> void:
	if (Global.oro - 30) >= 0:
		vidaActual = vidaActual + (vidaMaxima * 20 / 100)
		if vidaActual > vidaMaxima:
			vidaActual = vidaMaxima
			Global.vidaActual = Global.vidaMaxima
		Global.vidaActual = Global.vidaActual + + (Global.vidaMaxima * 20 / 100)
		Global.oro = Global.oro - 30
		$"Popup Descansar".hide()
		$BoxContainer3/Descansar.disabled = true
		$BoxContainer3/Dormir.disabled = true
	else:
		$"Sin oro".visible = true

func _on_no_descansar_pressed() -> void:
	$"Popup Descansar".hide()

func _process(_float) -> void:
	$BoxContainer4/Oro.text = "Oro: " + str(Global.oro)
	$ProgressBar.max_value = vidaMaxima
	$ProgressBar.value = vidaActual

func _on_ready() -> void:
	var listaItems: Array = arena.new()._equipo_personaje()
	vidaMaxima = vidaMaxima + (listaItems[1].vitalidad + listaItems[3].vitalidad) * 2
	vidaActual = vidaActual + (listaItems[1].vitalidad + listaItems[3].vitalidad) * 2
	$ProgressBar.max_value = vidaMaxima
	$ProgressBar.value = vidaActual
	$BoxContainer4/Oro.text = "Oro: " + str(Global.oro)
	if (oro - 30) >= 0:
		$BoxContainer3/Descansar.disabled = false
	else:
		$BoxContainer3/Descansar.disabled = true
	if (oro - 100) >= 0:
		$BoxContainer3/Dormir.disabled = false
	else:
		$BoxContainer3/Dormir.disabled = true

func _on_accept_dialog_close_requested() -> void:
	$"Sin oro".hide()


func _on_accept_dialog_confirmed() -> void:
	$"Sin oro".hide()


func _on_popup_descansar_close_requested() -> void:
	$"Popup Descansar".hide()


func _on_sin_oro_close_requested() -> void:
	$"Sin oro".hide()


func _on_popup_dormir_close_requested() -> void:
	$"Popup Dormir".hide()
