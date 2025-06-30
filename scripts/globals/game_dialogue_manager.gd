extends Node

signal give_crop_seeds
signal feed_the_animals
signal play_correct_sound
signal play_wrong_sound

func action_give_crop_seeds() -> void:
	give_crop_seeds.emit()

func action_feed_animals() -> void:
	feed_the_animals.emit()

func action_play_correct_sound() -> void:
	play_correct_sound.emit()

func action_play_wrong_sound() -> void:
	play_wrong_sound.emit()
