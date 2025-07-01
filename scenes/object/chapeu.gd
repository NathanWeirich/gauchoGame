extends Sprite2D

var balloon_scene = preload("res://dialogue/game_dialogue_balloon.tscn")

@onready var collectable_component = $CollectableComponent

func _ready():
	collectable_component.collected.connect(_on_collected)

func _on_collected():
	var balloon = balloon_scene.instantiate()
	get_tree().root.add_child(balloon)
	balloon.start(load("res://dialogue/conversation/collectibles.dialogue"), "chapeu")
