extends Control

@onready var oro = Global.oro

func _on_ready() -> void:
	$BoxContainer4/Oro.text = "Oro: " + str(oro)
	var statsPersonaje = "user://" + Global.partidaSeleccionada
	var equipoPersonaje = "user://equipo" + Global.partidaSeleccionada
	var listaItems: Array
	if FileAccess.file_exists(equipoPersonaje):
		var file = FileAccess.open(equipoPersonaje, FileAccess.READ)
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
	var esp = listaItems[0]
	$LabelEspada.text = esp.tipoItem + " +" + str(esp.tierItem) + "\n" \
		+ "Fuerza: "   + str(esp.fuerza)   + "\n" \
		+ "Vitalidad: " + str(esp.vitalidad) + "\n" \
		+ "Defensa: "  + str(esp.defensa) 
	var arm = listaItems[1]
	$LabelArmadura.text = arm.tipoItem + " +" + str(arm.tierItem) + "\n" \
		+ "Fuerza: "   + str(arm.fuerza)   + "\n" \
		+ "Vitalidad: " + str(arm.vitalidad) + "\n" \
		+ "Defensa: "  + str(arm.defensa) 
	var cas = listaItems[2]
	$LabelCasco.text = cas.tipoItem + " +" + str(cas.tierItem) + "\n" \
		+ "Fuerza: "   + str(cas.fuerza)   + "\n" \
		+ "Vitalidad: " + str(cas.vitalidad) + "\n" \
		+ "Defensa: "  + str(cas.defensa) 
	var pie = listaItems[3]
	$LabelPiernas.text = pie.tipoItem + " +" + str(pie.tierItem) + "\n" \
		+ "Fuerza: "   + str(pie.fuerza)   + "\n" \
		+ "Vitalidad: " + str(pie.vitalidad) + "\n" \
		+ "Defensa: "  + str(pie.defensa) 
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
					"VidaMaxima: " + str(Global.vidaMaxima) + "\n" +
					"VidaActual: " + str(Global.vidaActual) + "\n" +
					"Fuerza: " + str(json.get("fuerza")) + "\n" +
					"Vitalidad: " + str(json.get("vitalidad")) + "\n" +
					"Defensa: " + str(json.get("defensa")) + "\n" +
					"Agilidad: " + str(json.get("agilidad")) + "\n" +
					esp.tipoItem + " +" + str(esp.tierItem) + "   F: "   + str(esp.fuerza) + "   V: " + str(esp.vitalidad) + "   D: "  + str(esp.defensa) + "\n" +
					arm.tipoItem + " +" + str(arm.tierItem) + "   F: "   + str(arm.fuerza) + "   V: " + str(arm.vitalidad) + "   D: "  + str(arm.defensa) + "\n" +
					cas.tipoItem + " +" + str(cas.tierItem) + "   F: "   + str(cas.fuerza) + "   V: " + str(cas.vitalidad) + "   D: "  + str(cas.defensa) + "\n" +
					pie.tipoItem + " +" + str(pie.tierItem) + "   F: "   + str(pie.fuerza) + "   V: " + str(pie.vitalidad) + "   D: "  + str(pie.defensa)
				)
				$Pergamino1/BoxContainer1/info1.text = texto


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/mapa.tscn")


func _on_button_espada_focus_entered() -> void:
	$LabelEspada.visible = true

func _on_button_espada_focus_exited() -> void:
	$LabelEspada.visible = false

func _on_button_casco_focus_entered() -> void:
	$LabelCasco.visible = true

func _on_button_casco_focus_exited() -> void:
	$LabelCasco.visible = false

func _on_button_pechera_focus_entered() -> void:
	$LabelArmadura.visible = true

func _on_button_pechera_focus_exited() -> void:
	$LabelArmadura.visible = false

func _on_button_piernas_focus_entered() -> void:
	$LabelPiernas.visible = true

func _on_button_piernas_focus_exited() -> void:
	$LabelPiernas.visible = false
