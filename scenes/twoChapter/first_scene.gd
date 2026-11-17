extends Control

var texts := [
	"Прошло несколько дней.",
	"Документы в школу уже подали.",
	"Впервые иду учиться в новую школу.",
	"Страшно если честно.",
	"Ну ладно, прорвёмся.",
	"Я встал с кровати и направился в ванную.",
	"...",
	"После всех утренних процедур я начал одеваться.",
	"Мама: чаю хоть выпей",
	"Матвей: не хочу, мам",
	"Мама: ключи возьми на тумбочке, нас до вечера не будет.",
	"Матвей: а куда вы?",
	"Папа: мы поедем бабушку проведать.",
	"Я кивнул.",
	"Я обул свои кроссовки, после чего взял с тумбочки ключи.",
	"Я вышел из квартиры в подьезд, а затем и на улицу.",
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
			get_tree().change_scene_to_file("res://scenes/twoChapter/two_scene.tscn")
	)
	
	home.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
	)
	
