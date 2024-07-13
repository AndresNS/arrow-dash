extends Node

func get_performance_rating_text(value: int) -> String:
	return "★".repeat(value) + "☆".repeat(3 - value)
