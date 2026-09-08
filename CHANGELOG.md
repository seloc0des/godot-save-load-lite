# Changelog

## 1.2.1 (2026-09-08)

- The demo project's SaveLite autoload is registered by path again.
  project.godot pointed it at a uid://, which Godot can only resolve once it has
  built the project's UID map, so a fresh clone opened as a project errored
  until the first import had run. Installing the addon into your own project
  was never affected: the plugin registers the autoload by path itself.

## 1.2.0 (2026-08-22)

- Engine floor moves to Godot 4.5. The project and the plugin description both
  said 4.3 before, which no longer matched the code.
- The addon and its docs now say selodev throughout. The old CindieForge name
  was still in the README and the upgrade notes after the rebrand.
- A corrupt or hand-edited save reports `load_failed` instead of going quiet.
  If the save's `nodes` key was not an object, `load()` aborted partway and
  emitted neither `load_failed` nor `load_completed`, so a game showing
  "Load failed" on that signal showed nothing at all.

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
