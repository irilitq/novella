extends Control

var texts := [
	"...",
	"И где же 27 кабинет?.",
	"Посмотрев на свои часы, я понял, что еще успеваю.",
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
			get_tree().change_scene_to_file("res://scenes/twoChapter/five_scene.tscn")
	)
	
	home.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
	)
	
