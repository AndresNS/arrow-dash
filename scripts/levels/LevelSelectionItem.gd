class_name LevelSelectionItem extends Node2D

@onready var title_label: Label = $CanvasLayer/TitleLabel
@onready var achievements_label: Label = $CanvasLayer/AchievementsLabel

#var level: Level = null
#
#func _ready() -> void:
	#title_label.text = level.level_id
	#achievements_label.text = level.get_performance_rating_text(level.performance_rating)
	#level.performance_rating
