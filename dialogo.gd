extends Node2D

var texto = ""

signal listo

func _ready():
	ocultar()

func decir(p_texto):
	texto = p_texto
	$Timein.start()
	
func mostrar():
	visible = true
	
func ocultar():
	visible = false

func _on_timer_timeout():
	if texto:
		#$Texto.append_text(texto[0])
		$Texto.text += texto[0]
		texto = texto.right(texto.length() - 1)
	else:
		$Letras.stop()
		if $Timeout.is_stopped():
			print("Arrancando timeout")
			$Timeout.start()


func _on_timeout_timeout():
	ocultar()
	$Timeout.stop()
	listo.emit()


func _on_timein_timeout():
	mostrar()
	$Timein.stop()
	$Letras.start()
	#listo.emit()


func _on_listo():
	$Texto.text = ""
