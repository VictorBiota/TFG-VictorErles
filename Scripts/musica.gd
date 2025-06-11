extends AudioStreamPlayer2D

var musicaEscena = {
	"arena": "res://Music/the-tournament-280277.mp3",
	"taberna": "res://Music/medieval-citytavern-ambient-235876.mp3",
	"herreria": "res://Music/medieval-citytavern-ambient-235876.mp3",
	"resto": "res://Music/medieval-ambient-236809.mp3"
}
var escenaActual: String = ""

func _on_ready() -> void:
	get_tree().connect("node_added", Callable(self, "_cambiar_escena"))
	if get_tree().current_scene:
		_cambiar_escena(get_tree().current_scene)

func _cambiar_escena(nodo: Node) -> void:
	if nodo.get_parent() != get_tree().root:
		return
	var nombre = nodo.name.to_lower()
	var escena = nombre if musicaEscena.has(nombre) else "resto"
	if escena == escenaActual:
		return
	escenaActual = escena
	_cambiar_musica(escena)

func _cambiar_musica(nombreEsacena: String) -> void:
	var ruta = musicaEscena.get(nombreEsacena)
	stop()
	stream = load(ruta)
	play()
