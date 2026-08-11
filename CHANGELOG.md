# Changelog

## 1.1.0 — 2026-07-24

One-click no-code setup.

- New **Save/Load · Setup** panel (the first dock tab): pick the outcome you want → **Apply** → the Lite component is added to your scene, baked in and re-editable.
- Pro unlocks the full no-code wiring — gameplay triggers, bound UI, and cross-system hooks.

## 1.0.0 — 2026-06-01

Initial release.

- `SaveLite` autoload — `save(path)`, `load(path)`, `has_save()`, `delete_save()`.
- `SaveableLite` node — property allowlist, auto-joins contract group.
- JSON backend, single slot (default `user://save.json`, override per call).
- Contract group: `save_load_contract_lite`.
- Signals: `save_completed`, `load_completed`, `save_failed`, `load_failed`.
- Demo: moveable square + coin counter, save/load/reset/delete keybinds.
