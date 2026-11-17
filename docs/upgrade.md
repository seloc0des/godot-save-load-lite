# Upgrade to the full Save / Load

Save / Load: Lite covers the "save a single JSON file" core. The full version adds the production-grade features that make save systems actually reliable in shipped games.

## What the full version adds

- **Multi-slot save manager.** Slot list, slot metadata, timestamps, screenshots. A drop-in UI scene.
- **Autosave.** On interval, or driven by a signal (e.g. "checkpoint reached"). Configurable.
- **Encrypted binary backend.** Same API, different file format. Bring your own key or use the bundled default.
- **Atomic writes.** Tmp+rename so a crash mid-save can never corrupt a slot.
- **Schema migrations.** Version your save data; supply rule-based or callable migrators when the shape changes.
- **Editor dock.** List slots, inspect contents, duplicate, delete — without leaving the editor.
- **Side-channel slots.** Settings, achievements, world flags — separate from per-character saves.
- **Direct save-contract opt-in for code-first nodes.** No `Saveable` node required.

## Compatibility with the rest of the selodev stack

Inventory, Equipment, Loot, Crafting, Vendor, Quests, Stats / Skill Trees all auto-join the **full** Save addon's contract group when both are installed. Lite uses a separate group name (`save_load_contract_lite`). A node you wrote for the Lite keeps its `get_save_id()`, `save_state()` and `load_state()` methods, so moving it over comes down to putting it in the full version's `save_load_contract` group. Calls change too: `SaveLite.save(path)` and `SaveLite.load(path)` become `SaveManager.save(slot)` and `SaveManager.load_slot(slot)`. The full version writes its own slot files and never reads the Lite's `user://save.json`.

## Where to buy

The full version is on itch.io: **https://selodev.itch.io**.

## License

The Lite is MIT. The full version carries a commercial license: use it in any game you make, but don't resell or re-share the addon itself.
