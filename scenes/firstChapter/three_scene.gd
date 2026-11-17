extends Control

var texts := [
	"Ну что.",
	"Пора прощаться с Ростовом.",
	"И настраиваться на Брянск.",
	"А что я вообще знаю о Брянске?",
	"Приграничный регион.",
	"Где-то рядом Беларусь, где-то Украина.",
	"Родина пары поэтов.",
	"Тютчев. Алексей Толстой.",
	"Партизаны. Леса.",
	"Наверное, весь город высечен в сердце леса.",
	"А если верить интернету — обычная провинция.",
	"Промышленность. Далеко от Москвы.",
	"Вот и всё, что я успел узнать в интернете.",
	"Мы встали на платформе.",
	"Интересно, конечно.",
	"Но вряд ли этот городок меня удивит.",
	"Гудок.",
	"Поезд подошёл.",
	"...",
	"Проводница открыла вагон.",
	"Очередь.",
	"Ждём.",
	"Наконец — наша.",
	"Я закинул чемоданы в тамбур.",
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
			get_tree().change_scene_to_file("res://scenes/firstChapter/four_scene.tscn")
	)
	
	home.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
	)
	
