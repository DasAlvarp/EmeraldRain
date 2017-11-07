tool
extends EditorPlugin

var dock #holds dock while plugin is alive

func _enter_tree():
	dock = preload("res://addons/my_custom_dock/my_dock.tscn").instance()
	# Called every time the node is added to the scene.
	# Initialization here
	add_control_to_dock(DOCK_SLOT_LEFT_BL, dock)

func _exit_tree():
	remove_control_from_docks(dock)
	dock.free()