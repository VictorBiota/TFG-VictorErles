extends Node

var partidaSeleccionada = ""
var vidaActual: int = 0
var vidaMaxima: int = 0
var oro: int = 100
var vidaEnemigoMaxima: int = 0
var vidaEnemigoActual: int = 0
var nivelArena: int = 1
var muerte: bool = false

func _timer() -> void:
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.one_shot = true
	add_child(timer)
	timer.start()
	await timer.timeout
