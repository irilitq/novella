extends Control

var texts := [
	"Надеюсь класс будет нормальный.",
	"Всё таки зря мы переехали.",
	"Сейчас было бы все хорошо.",
	"Там.. в Ростове.",
	"Я вставил в уши свои наушники.",
	"...",
	"0"
]
var index := 0

@onready var label: Label = $text
@onready var button: Button = $skip
@onready var home: Button = $home

func _ready() -> void:
	label.text = texts[index]

	button.pressed.connect(func():
		index = min(index + 1, texts.size() - 1)
		label.text = texts[index]
		
		# Проверяем ПОСЛЕ обновления текста
		if label.text == "0":
			get_tree().change_scene_to_file("res://scenes/twoChapter/three_scene.tscn")
	)
	
	home.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
	)
	
