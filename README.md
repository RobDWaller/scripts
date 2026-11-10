# Scripts

Simple repository for storing useful scripts, particularly for environment setup.

## tmux layout (`tmux/tmux_layout.sh`)

Opens a tmux session with three panes. The session is called `work` unless you give it another name.

```
+-----------------------+------------+
|                       |            |
|        main           |            |
|       (focused)       |   right    |
|                       |   (35%)    |
+-----------------------+            |
|   bottom (30%)        |            |
+-----------------------+------------+
```

- **Right pane** — full height, about 35% of the window width.
- **Main pane** (top left) — the largest pane. The cursor starts here.
- **Bottom pane** (bottom left) — about 30% of the left column's height.

If a session with that name already exists, the script attaches to it instead of making a new one, so it's safe to run again after you detach.

### Requirements

- [tmux](https://github.com/tmux/tmux) on your `PATH`
- bash

### Usage

Run it directly from the repo:

```bash
./tmux/tmux_layout.sh [session-name]
```

The session name is optional and defaults to `work`. Give each project its own name to keep several sessions running side by side:

```bash
./tmux/tmux_layout.sh api
./tmux/tmux_layout.sh frontend
```

Avoid `:` and `.` in session names, because tmux uses them to address windows and panes.

To run it from anywhere, add an alias to your `~/.bashrc` or `~/.zshrc`:

```bash
alias work="$HOME/Code/scripts/tmux/tmux_layout.sh"
```

Change the path to match where you cloned this repo. Then `work` opens the default session and `work myproject` opens one called `myproject`.

### Detaching and closing

- Detach and leave the session running: `Ctrl-b` then `d`. Run the script again with the same name to reattach.
- End the session: `tmux kill-session -t <session-name>`

### Customising

- **Default session name:** change the `work` fallback in the `SESSION_NAME` line at the top of the script.
- **Pane sizes:** change the `-p` values in the `split-window` lines. `-p 35` sets the right pane's width and `-p 30` sets the bottom pane's height, both as percentages.
