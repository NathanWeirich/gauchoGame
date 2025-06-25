extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent

@export var door_id: String = ""
@export var target_scene: String = ""
@export var target_door_id: String = ""

var was_opened: bool = false
var can_interact: bool = true

func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	collision_layer = 1
	add_to_group("doors")

func on_interactable_activated() -> void:
	var scene_manager = get_node("/root/SceneManager")
	if !can_interact or scene_manager.door_cooldown:
		return
	can_interact = false
	was_opened = true
	animated_sprite_2d.play("open_door")
	collision_layer = 2
	await animated_sprite_2d.animation_finished
	if target_scene != "" and target_door_id != "":
		scene_manager.last_door_id = target_door_id
		scene_manager.start_door_cooldown() # inicia cooldown global
		scene_manager.load_level(target_scene)
	$Timer.start()

func on_interactable_deactivated() -> void:
	if was_opened:
		animated_sprite_2d.play("close_door")
		collision_layer = 1
		was_opened = false


func _on_timer_timeout() -> void:
	can_interact = true
