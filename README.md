# Save / Load (Lite)

**FREE.** Single-slot JSON save/load for Godot 4.5+. Pure GDScript. MIT.

The working core of the [selodev Save addon](docs/upgrade.md). Drop the autoload, mark nodes with `SaveableLite`, call `SaveLite.save()`. Done.

## One-click setup (no code)

Enable the plugin and a **Save/Load · Setup** tab appears in the editor. Pick the outcome you want and press **Apply** — the Lite component is added to your scene, baked in and editable. *(Pro unlocks the full no-code wiring — gameplay triggers, bound UI, cross-system hooks.)*

## 5-minute install

1. Copy `addons/save_load_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Save / Load (Lite)**.
3. On nodes you want persisted, either:
   - Drop a child `SaveableLite` node and list properties in `save_properties`, OR
   - Implement `get_save_id()`, `save_state() -> Dictionary`, `load_state(data: Dictionary)` directly and add the node to the `save_load_contract_lite` group.
4. Call `SaveLite.save()` and `SaveLite.load()` from anywhere.

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
| Autosave (interval / signal) | Pro |
| Encrypted binary backend | Pro |
| Atomic writes (tmp+rename) | Pro |
| Schema migrations | Pro |
| Editor dock (list / inspect / duplicate slots) | Pro |
| Screenshots in slot metadata | Pro |
| Side-channel slots (settings, achievements) | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT. Ship it in commercial games.

---

## Part of a family

The free Lite tier of one system in a set of Godot 4 RPG systems built to
interoperate (shared item + save contracts) — each also works fully standalone.

**Free tiers — try before you buy:**

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite) — item slots, stack merging, capacity
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite) — 4-slot gear manager
- [Save/Load Lite](https://github.com/seloc0des/godot-save-load-lite) — single-slot JSON persistence
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite) — shapeless instant recipes
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite) — COLLECT + KILL quests
- [Stats/Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite) — stat aggregator
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite) — single fixed-currency shop
- [Settings + Menu System](https://github.com/seloc0des/godot-settings-menus) — complete, free, no paid tier

**Full versions** — drop-in UI, weight/categories, timed crafting, restock & currencies,
save-aware cross-system integration, and more — are on itch.io:
**https://selodev.itch.io**
