extends Control

@onready var oro = Global.oro

func _on_arena_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/arena.tscn")


func _on_taberna_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/taberna.tscn")


func _on_herreria_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/herreria.tscn")


func _on_personaje_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/personaje.tscn")


func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")

func _on_ready() -> void:
	$BoxContainer4/Oro.text = "Oro: " + str(oro)
