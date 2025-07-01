extends PanelContainer

@onready var bota_label: Label = $MarginContainer/VBoxContainer/Bota/BotaLabel
@onready var chapeu_label: Label = $MarginContainer/VBoxContainer/Chapeu/ChapeuLabel
@onready var chimarrao_label: Label = $MarginContainer/VBoxContainer/Chimarrao/ChimarraoLabel
@onready var gaita_label: Label = $MarginContainer/VBoxContainer/Gaita/GaitaLabel
@onready var laco_label: Label = $MarginContainer/VBoxContainer/Laco/LacoLabel
@onready var livro_label: Label = $MarginContainer/VBoxContainer/Livro/LivroLabel


func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)
	
func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("bota"):
		bota_label.text = str(inventory["bota"])
	if inventory.has("chapeu"):
		chapeu_label.text = str(inventory["chapeu"])
	if inventory.has("chimarrao"):
		chimarrao_label.text = str(inventory["chimarrao"])
	if inventory.has("gaita"):
		gaita_label.text = str(inventory["gaita"])
	if inventory.has("laco"):
		laco_label.text = str(inventory["laco"])
	if inventory.has("livro"):
		livro_label.text = str(inventory["livro"])
