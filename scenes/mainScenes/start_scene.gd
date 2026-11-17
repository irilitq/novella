extends Control


# Подключение кнопок
func _ready() -> void:
	$playButton.pressed.connect(_show_play)
	$settingButton.pressed.connect(_show_settings)
	$exitButton.pressed.connect(_show_exit)
	
	
	
	
# Функционал кнопки играть
func _show_play() -> void:
	var dialog = AcceptDialog.new()
	dialog.title = "Выбор главы"

	var vbox = VBoxContainer.new()
	vbox.custom_minimum_size = Vector2(400, 300)
	vbox.add_theme_constant_override("separation", 10)

	# Выбор 1 главы
	var button1 = Button.new()
	button1.text = "Глава 1: Новые края"
	vbox.add_child(button1)
	
	# Выбор 2 главы
	var button2 = Button.new()
	button2.text = "Глава 2: в разработке"
	vbox.add_child(button2)
	
	# Выбор 3 главы
	var button3 = Button.new()
	button3.text = "Глава 3: в разработке"
	vbox.add_child(button3)
	
	button1.pressed.connect(_show_firstChapter)
	button2.pressed.connect(_show_twoChapter)
	button3.pressed.connect(_show_threeChapter)
	
	dialog.add_child(vbox)
	add_child(dialog)
	dialog.popup_centered()
	
func _show_firstChapter() -> void:
	get_tree().change_scene_to_file("res://scenes/firstChapter/first_scene.tscn")
	
func _show_twoChapter() -> void:
	get_tree().change_scene_to_file("res://scenes/twoChapter/first_scene.tscn")
	
func _show_threeChapter() -> void:
	var threeChapterDialog = AcceptDialog.new()
	threeChapterDialog.title = "В разработке..."
	add_child(threeChapterDialog)
	threeChapterDialog.popup_centered()



# Функционал кнопки настроек

func _show_settings() -> void:
	var dialog = AcceptDialog.new()
	dialog.title = "Настройки"

	var vbox = VBoxContainer.new()
	vbox.custom_minimum_size = Vector2(400, 300)
	vbox.add_theme_constant_override("separation", 10)

	var label1 = Label.new()
	label1.text = "Язык"
	vbox.add_child(label1)

	var button1 = Button.new()
	button1.text = "Выбрать язык"
	vbox.add_child(button1)
	
	var label2 = Label.new()
	label2.text = "Громкость"
	vbox.add_child(label2)

	var button2 = Button.new()
	button2.text = "Изменить громкость"
	vbox.add_child(button2)

	button1.pressed.connect(_show_lang)
	button2.pressed.connect(_show_volume)

	dialog.add_child(vbox)
	add_child(dialog)
	dialog.popup_centered()

func _show_lang() -> void:
	var lang_dialog = AcceptDialog.new()
	lang_dialog.title = "Внимание"
	lang_dialog.dialog_text = "Смена языков пока не доступна."
	add_child(lang_dialog)
	lang_dialog.popup_centered()

func _show_volume() -> void:
	var volume_dialog = AcceptDialog.new()
	volume_dialog.title = "Внимание"
	volume_dialog.dialog_text = "Изменение громкости пока не доступно."
	add_child(volume_dialog)
	volume_dialog.popup_centered()
	
	
# Функционал кнопки выхода
func _show_exit() -> void:
	get_tree().quit()
