# Quick Start

## With the Setup tab (no code)

1. Enable **Save / Load (Lite)** in Project Settings → Plugins. The **Save & Load · Setup** tab appears on the right.
2. Open your level and select the node you want saved, for example your player.
3. Pick **Save this node's state**, keep **Selected node** and press **Apply**. The node gets a `SaveableLite` child. Its **Save Properties** list starts with the node's position (2D and 3D nodes) and its exported properties. Remove anything you don't want kept.
4. Pick **Quick save and load keys (F5 / F9)**. Tick **Load the save when the scene starts** if the game should start from the last save. Press **Apply**. A `SaveKeys` node goes on the scene root.
5. Press Play. F5 saves, F9 loads, with a short message on screen: "Game saved", "Game loaded" or "No save to load yet".

```
MyLevel
├── Player (CharacterBody2D)
│   └── SaveableLite (save_properties = ["position", "health", "gold"])
└── SaveKeys (F5 saves, F9 loads)
```

On the `SaveKeys` node in the Inspector, pick other keys under **Save Key** and **Load Key**, or untick **Show Messages** to save quietly. Apply again any time: it updates the nodes that are there instead of adding more.

`save_id` on a `SaveableLite` is optional. Left blank, the node's path in the scene is used.

Everything goes to one file, `user://save.json`. Positions, colours and whole numbers come back as the same type they were saved as.

## From code (optional)

### Direct contract (custom serialization)

For full control, skip `SaveableLite` and implement the contract methods directly on your node, then join the group:

```gdscript
extends Node

func _ready() -> void:
    add_to_group("save_load_contract_lite")

func get_save_id() -> String:
    return "player_state"

func save_state() -> Dictionary:
    return {
        "position": var_to_str(position),  # JSON has no Vector2, so keep it as text
        "inventory": _serialize_inventory(),
    }

func load_state(data: Dictionary) -> void:
    position = str_to_var(data.get("position", "Vector2(0, 0)"))
    _restore_inventory(data.get("inventory", []))
```

### Saving and loading

```gdscript
SaveLite.save()                          # user://save.json
SaveLite.save("user://slot_a.json")      # arbitrary path
SaveLite.load()
SaveLite.has_save()
SaveLite.delete_save()
```

The Lite tier is single-slot per *path you pass*. If you need a slot manager UI plus per-slot screenshots and metadata, that lives in the Pro tier.

### Signals

```gdscript
SaveLite.save_completed.connect(func(path): print("Saved → ", path))
SaveLite.load_completed.connect(func(path): print("Loaded ← ", path))
SaveLite.save_failed.connect(func(reason): push_error(reason))
```
