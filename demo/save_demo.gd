extends Node

# Demo for Save / Load — Lite. A moveable square + a counter, both persisted.
# Press S to save, L to load, R to reset, X to delete the save file.

const SaveableLiteScript := preload("res://addons/save_load_lite/saveable.gd")

var player_x: float = 400.0
var coins: int = 0
var _player: ColorRect
var _hud: Label


func _ready() -> void:
	# Background.
	var bg := ColorRect.new()
	bg.color = Color(0.10, 0.12, 0.16)
	bg.anchor_right = 1; bg.anchor_bottom = 1
	add_child(bg)

	# Player.
	_player = ColorRect.new()
	_player.color = Color(0.55, 0.85, 0.55)
	_player.size = Vector2(40, 40)
	_player.position = Vector2(player_x, 240)
	add_child(_player)

	# HUD.
	_hud = Label.new()
	_hud.position = Vector2(16, 16)
	_hud.add_theme_font_size_override("font_size", 14)
	add_child(_hud)

	# Saveable that persists `player_x` and `coins`.
	var s: SaveableLite = SaveableLiteScript.new()
	s.save_id = "demo_state"
	s.save_properties = PackedStringArray(["player_x", "coins"])
	add_child(s)

	SaveLite.save_completed.connect(func(p): _flash("Saved → %s" % p))
	SaveLite.load_completed.connect(func(p): _flash("Loaded ← %s" % p))
	SaveLite.save_failed.connect(func(r): _flash("Save failed: %s" % r))
	SaveLite.load_failed.connect(func(r): _flash("Load failed: %s" % r))

	_refresh()


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A):
		player_x -= 220.0 * delta
	if Input.is_key_pressed(KEY_D):
		player_x += 220.0 * delta
	player_x = clampf(player_x, 0.0, 860.0)
	_player.position.x = player_x
	_refresh()


func _input(event: InputEvent) -> void:
	if not (event is InputEventKey) or not event.pressed:
		return
	match event.keycode:
		KEY_S: SaveLite.save()
		KEY_L: SaveLite.load()
		KEY_C: coins += 1
		KEY_R:
			player_x = 400.0; coins = 0
			_flash("Reset")
		KEY_X:
			if SaveLite.delete_save():
				_flash("Save file deleted")


var _flash_text: String = ""
var _flash_until: float = 0.0


func _flash(msg: String) -> void:
	_flash_text = msg
	_flash_until = Time.get_ticks_msec() / 1000.0 + 2.5


func _refresh() -> void:
	var flash := ""
	if Time.get_ticks_msec() / 1000.0 < _flash_until:
		flash = "\n• %s" % _flash_text
	_hud.text = "Save/Load — Lite Demo\nA/D to move (player_x = %d)\nC: +1 coin (coins = %d)\nS: Save • L: Load • R: Reset • X: Delete save%s" % [int(player_x), coins, flash]
