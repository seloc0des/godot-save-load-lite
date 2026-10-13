# Changelog

## 1.3.2 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Save & Load · Setup tab was blank on Godot 4.5.** Its tab beside the Inspector had no title,
  so "open the Save & Load · Setup tab" pointed at nothing. It is named when the pack switches on
  now. Godot 4.7 was not affected.

## 1.3.1 (2026-09-27)

Installs without errors, and its tab works the moment you switch it on.

- **Its tab works the moment you switch it on.** Right after installing, Save this node's state
  added nothing until you restarted Godot.
- **No red errors when you install it.** Installing it filled the Output panel with "Failed to
  load script" errors before you'd even switched it on. Some of its scripts named a part of the
  pack that only exists once the pack is on.
- **The Setup and authoring tabs fit a default dock.** A tab taller than the dock scrolls, and lists
  show what you just made the next time they open.

## 1.3.0 (2026-09-27)

Save and load without writing code.

- **Quick save and load keys.** A new outcome on the Setup tab adds F5 to save and F9 to load,
  with a short message on screen, and can load the save when the scene starts.
- **Positions and colours survive a save.** A Saveable brought `position` back as (0, 0) and colours
  as black, because the save file can't hold those types. They come back right now, and older saves
  still load.
- **Making a 2D or 3D node saveable saves its position** without you listing it.
- The Setup tab's status line no longer tells you to write code.
- **The Setup tab is called "Save & Load · Setup".** Godot doesn't allow a slash in a node name, so
  it showed up as "Save_Load".
- **Pressing Play right after Apply includes what it added.** The Setup tab never marked the scene
  as changed, so Play ran the saved version without it.
- **The Saveable is added the way a node you add by hand is**, so its game code doesn't run in the
  editor.
- **Nodes the Setup tab adds get readable names.** A second one under the same parent is
  called something like `UILayer2`, instead of a generated name full of `@` signs.
- **Switching the plugin off only removes the autoload if the plugin added it**, and closing
  the editor no longer removes it at all. A project that declares it itself, like the starter
  kits, keeps it.

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
