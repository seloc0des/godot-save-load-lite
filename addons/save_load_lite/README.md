# Save / Load (Lite)

**FREE.** Single-slot JSON save/load for Godot 4.5+. Pure GDScript. MIT.

The working core of the [selodev Save addon](docs/upgrade.md). Make a node saveable and add quick save keys from the Setup tab: F5 saves, F9 loads. No code.

## 5-minute setup (no code)

1. Copy `addons/save_load_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Save / Load (Lite)**. A **Save & Load · Setup** tab appears in the editor.
3. Select the node you want saved (your player, a chest), pick **Save this node's state**, keep **Selected node** and press **Apply**. The node gets a `SaveableLite` child listing its position and exported properties. Edit the list in the Inspector.
4. Pick **Quick save and load keys (F5 / F9)** and press **Apply**. A `SaveKeys` node goes on the scene root. Tick **Load the save when the scene starts** first if the game should start from the last save.
5. Press Play. F5 saves, F9 loads, and a short message on screen confirms each.

Pick other keys on the `SaveKeys` node in the Inspector. Apply again any time: it updates what's there instead of adding a second copy. *(Pro adds a save menu with slots, checkpoints, autosave timers and save-on-quit, all from its own Setup tab.)*

## From code (optional)

For custom serialization, implement `get_save_id()`, `save_state() -> Dictionary` and `load_state(data: Dictionary)` on your node and add it to the `save_load_contract_lite` group. Save and load from anywhere:

```gdscript
SaveLite.save()             # writes user://save.json
SaveLite.load()             # restores from user://save.json
SaveLite.has_save()         # bool
SaveLite.delete_save()      # bool
SaveLite.save("user://slot2.json")  # custom path
```

## What's missing (and why)

| Feature | Tier |
|---|---|
| Multi-slot save manager + UI | Pro |
| Checkpoints (save on touch) | Pro |
| Autosave (interval / signal) | Pro |
| Save on quit | Pro |
| Encrypted binary backend | Pro |
| Atomic writes (tmp+rename) | Pro |
| Schema migrations | Pro |
| Editor dock (list / inspect / duplicate slots) | Pro |
| Screenshots in slot metadata | Pro |
| Side-channel slots (settings, achievements) | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT. Ship it in commercial games.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
