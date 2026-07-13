@tool
extends EditorPlugin

const SAVE_NAME := "SaveLite"
const SAVE_PATH := "res://addons/save_load_lite/save_lite.gd"


func _enter_tree() -> void:
	add_autoload_singleton(SAVE_NAME, SAVE_PATH)


func _exit_tree() -> void:
	remove_autoload_singleton(SAVE_NAME)
