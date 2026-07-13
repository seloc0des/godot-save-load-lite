# Upgrade to Save / Load (Pro)

Save / Load — Lite covers the "save a single JSON file" core. The Pro tier adds the production-grade features that make save systems actually reliable in shipped games.

## What Pro adds

- **Multi-slot save manager.** Slot list, slot metadata, timestamps, screenshots. A drop-in UI scene.
- **Autosave.** On interval, or driven by a signal (e.g. "checkpoint reached"). Configurable.
- **Encrypted binary backend.** Same API, different file format. Bring your own key or use the bundled default.
- **Atomic writes.** Tmp+rename so a crash mid-save can never corrupt a slot.
- **Schema migrations.** Version your save data; supply rule-based or callable migrators when the shape changes.
- **Editor dock.** List slots, inspect contents, duplicate, delete — without leaving the editor.
- **Side-channel slots.** Settings, achievements, world flags — separate from per-character saves.
- **Direct save-contract opt-in for code-first nodes.** No `Saveable` node required.

## Compatibility with the rest of the CindieForge stack

Inventory, Equipment, Loot, Crafting, Vendor, Quests, Stats / Skill Trees all auto-join the **Pro** Save addon's contract group when both are installed. Lite uses a separate group name (`save_load_contract_lite`) so upgrading is a copy-paste — change the group name, that's it.

## Where to buy

The full version is on itch.io — **https://selodev.itch.io**. Both tiers share the
same field names and method signatures, so upgrading is a class-name swap.

## License

Both Lite and Pro are MIT. You own the code outright.
