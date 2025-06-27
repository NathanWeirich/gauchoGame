extends Node2D

func _ready() -> void:
	var player = get_parent().get_parent().get_node("Player")
	var target_id = SceneManager.last_door_id
	if target_id != "" and player:
		var door = find_door_by_id(target_id)
		if door:
			var offset = Vector2(0, 16) # Ajuste o valor e direção conforme seu jogo
			player.global_position = door.global_position + offset
		SceneManager.last_door_id = "" # Limpa após usar

func find_door_by_id(target_id: String) -> Node2D:
	for door in get_tree().get_nodes_in_group("doors"):
		if door.door_id == target_id:
			return door
	return null
