extends CanvasLayer

@onready var level_1_rating_label: Label = $Levels/Level1/RatingLabel
@onready var level_2_rating_label: Label = $Levels/Level2/RatingLabel

func _ready() -> void:	
	level_1_rating_label.text = GameManager.progress["1-1"].performance_text
	level_2_rating_label.text = GameManager.progress["1-2"].performance_text

func _on_level_1_play_button_pressed() -> void:
	GameManager.go_to_level("1-1")

func _on_level_2_play_button_pressed() -> void:
	GameManager.go_to_level("1-2")

func _on_main_menu_button_pressed() -> void:
	GameManager.go_to_main_menu()
