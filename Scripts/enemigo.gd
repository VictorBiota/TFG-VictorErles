extends Control

class_name Enemigo

var nombreEnemigos = [
	"Ajax", "Bran", "Cato", "Drax", "Enos",
	"Faun", "Gann", "Hugo", "Ivor", "Jax",
	"Kael", "Leo", "Milo", "Nero", "Orin",
	"Pax", "Quin", "Rex", "Seth", "Tane",
	"Ulan", "Vex", "Walt", "Xeno", "Ymir",
	"Zale", "Bale", "Luca", "Drus", "Fero"
]

func elegirNombreEnemigo() -> String:
	var nombre = randi_range(0, nombreEnemigos.size() - 1)
	return nombreEnemigos[nombre]

func crear_y_guardar_json(fuerza: int, agilidad: int, vitalidad: int, nivelArena: int) -> void:
	var datos = {
		"nivelPersonaje": nivelArena,
		"nivelArena": nivelArena,
		"oro": 100,
		"nombre": elegirNombreEnemigo(),
		"fuerza": fuerza,
		"vitalidad": vitalidad,
		"agilidad": agilidad,
		"defensa": 0,
		"vida": 100 + (vitalidad - 10) * 2
	}
	var file_path = "user://enemigo" + Global.partidaSeleccionada
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(datos))
	file.close()
	Global._timer()
	Global.vidaEnemigoActual = datos["vida"]
	Global.vidaEnemigoMaxima = datos["vida"]

func _equipo_enemigo() -> void:
	var file_path = "user://equipoenemigo" + Global.partidaSeleccionada
	var importHerreria = herreria.new()
	var listaItemsEnemigo: Array = []
	var tierItem: int
	match Global.nivelArena:
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
		listaItemsEnemigo.append(importHerreria._generar_items(tipoItem, tierItem))
	var datosItems = []
	for item in listaItemsEnemigo:
		var datos = {
			"tipoItem": item.tipoItem,
			"tierItem": item.tierItem,
			"fuerza": item.fuerza,
			"vitalidad": item.vitalidad,
			"defensa": item.defensa,
			"precioItem": item.precioItem
		}
		datosItems.append(datos)
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(datosItems))
	file.close()
	Global._timer()

func enemigo() -> void:
	var nivelArena = Global.nivelArena;
	var fuerza = 10
	var vitalidad = 10
	var agilidad = 10
	if nivelArena != 0:
		match nivelArena:
			1:
				var disponibles = randi_range(5, 7)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			2:
				var disponibles = randi_range(10, 14)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			3:
				var disponibles = randi_range(15, 19)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			4:
				var disponibles = randi_range(20, 24)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			5:
				var disponibles = randi_range(25, 31)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			6:
				var disponibles = randi_range(30, 36)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			7:
				var disponibles = randi_range(35, 41)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			8:
				var disponibles = randi_range(40, 47)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			9:
				var disponibles = randi_range(45, 52)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
			10:
				var disponibles = randi_range(50, 57)
				for i in range(disponibles):
					match randi_range(0, 2):
						0: fuerza += 1
						1: vitalidad += 1
						2: agilidad += 1
	crear_y_guardar_json(fuerza, agilidad, vitalidad, nivelArena)
	if !FileAccess.file_exists("user://equipoenemigo" + Global.partidaSeleccionada) || Global.nivelArena != 1:
		_equipo_enemigo()
