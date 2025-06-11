extends Control

@onready var slider: HSlider = $HSlider

func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu_principal.tscn")


func _on_volumen_pressed() -> void:
	slider.visible = true


func _on_ready() -> void:
	slider.visible = false
	slider.value = Musica.volume_db
	slider.connect("value_changed", Callable(self, "_volumen_cambiado"))

func _on_h_slider_value_changed(value: float) -> void:
	Musica.volume_db = value
