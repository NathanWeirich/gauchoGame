extends CanvasLayer

@onready var save_game_button: Button = $MarginContainer/VBoxContainer/SaveGameButton
@onready var start_game_button: Button = $MarginContainer/VBoxContainer/StartGameButton
@onready var exit_game_button: Button = $MarginContainer/VBoxContainer/ExitGameButton

@onready var click: AudioStreamPlayer2D = $Click
@onready var hover: AudioStreamPlayer2D = $Hover

func _ready() -> void:
	save_game_button.disabled = !SaveGameManager.allow_save_game
	save_game_button.focus_mode = SaveGameManager.allow_save_game if Control.FOCUS_ALL else Control.FOCUS_NONE 
	
	# Conectar sinais de mouse
	for button in [save_game_button, start_game_button, exit_game_button]:
		button.mouse_entered.connect(_on_button_mouse_entered)
		button.pressed.connect(_on_button_pressed)

func _on_button_mouse_entered():
	hover.play()

func _on_button_pressed():
	click.play()

func _on_start_game_button_pressed() -> void:
	GameManager.start_game()
	queue_free()


func _on_save_game_button_pressed() -> void:
	SaveGameManager.save_game()


func _on_exit_game_button_pressed() -> void:
	GameManager.exit_game()
