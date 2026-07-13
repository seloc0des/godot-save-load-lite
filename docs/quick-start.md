# Quick Start

## Approach 1: SaveableLite node (no code)

Drop a `SaveableLite` Node as a child of any node whose properties you want persisted. Set:

- `save_id` — optional stable id. Defaults to the parent's NodePath.
- `save_properties` — `PackedStringArray` of property names on the parent.

```
Player (Node2D)
├── SaveableLite (save_properties = ["position", "health", "gold"])
```

`SaveLite.save()` reads each named property; `SaveLite.load()` writes them back.

## Approach 2: Direct contract (custom serialization)

For full control, skip `SaveableLite` and implement the contract methods directly on your node, then join the group:

```gdscript
extends Node

func _ready() -> void:
    add_to_group("save_load_contract_lite")

func get_save_id() -> String:
    return "player_state"

func save_state() -> Dictionary:
    return {
        "position": position,
        "inventory": _serialize_inventory(),
    }

func load_state(data: Dictionary) -> void:
    position = data.get("position", Vector2.ZERO)
    _restore_inventory(data.get("inventory", []))
```

## Saving and loading

```gdscript
SaveLite.save()                          # user://save.json
SaveLite.save("user://slot_a.json")      # arbitrary path
SaveLite.load()
SaveLite.has_save()
SaveLite.delete_save()
```

The Lite tier is single-slot per *path you pass*. If you need a slot manager UI plus per-slot screenshots and metadata, that lives in the Pro tier.

## Signals

```gdscript
SaveLite.save_completed.connect(func(path): print("Saved → ", path))
SaveLite.load_completed.connect(func(path): print("Loaded ← ", path))
SaveLite.save_failed.connect(func(reason): push_error(reason))
```
