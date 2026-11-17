extends Control

var texts := [
	"Вот и приехали.",
	"Честно — я и не удивлён.",
	"Примерно так я и представлял российскую провинцию.",
	"Хотя с чем сравнивать.",
	"Ростов — миллионник.",
	"А в Брянске людей в три раза меньше.",
	"И теперь всё заново.",
	"Знакомиться с классом.",
	"Хотя, может, в этом есть плюсы.",
	"...",
	"Начать с чистого листа.",
	"В другом городе.",
	"Но тревожные мысли не отпускают.",
	"Может, это правда особенность города.",
	"Или все провинции такие?",
	"Мы вошли в квартиру.",
	"Коробки. Запах краски.",
	"Чужие стены.",
	"...",
	"Папа: Располагайтесь.",
	"Алёнка: Папа, а ты мне обещал подарок!",
	"Алёнка: Ты говорил, приедем в другой город — и подаришь!",
	"Мама: Солнце, папа подарит.",
	"Мама: Но чуть-чуть попозже.",
	""
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
		if label.text == "":
			print("Первая глава пройдена")
			var newdDialog = ConfirmationDialog.new()
			newdDialog.title = "Пауза"
			newdDialog.dialog_text = "Что будем делать?"
			newdDialog.ok_button_text = "Продолжить"
			newdDialog.cancel_button_text = "Выйти в меню"
			add_child(newdDialog)
			newdDialog.confirmed.connect(_on_continue)
			newdDialog.canceled.connect(_on_exit_to_menu)
			newdDialog.popup_centered(Vector2i(400, 150))
	)
func _on_continue() -> void:
	print("Продолжаем игру")
	get_tree().change_scene_to_file("res://scenes/twoChapter/first_scene.tscn")


func _on_exit_to_menu() -> void:
	print("Выход в меню")
	get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
	home.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/mainScenes/start_scene.tscn")
	)
	
