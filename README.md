# Scripts

Simple repository for storing useful scripts, particularly for environment setup.

## tmux layout (`tmux/tmux_layout.sh`)

Opens a tmux session called `work` with three panes:

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

If a `work` session already exists, the script attaches to it instead of making a new one, so it's safe to run again after you detach.

### Requirements

- [tmux](https://github.com/tmux/tmux) on your `PATH`
- bash

### Usage

Run it directly from the repo:

```bash
./tmux/tmux_layout.sh
```

To run it from anywhere, add an alias to your `~/.bashrc` or `~/.zshrc`:

```bash
alias work="$HOME/Code/scripts/tmux/tmux_layout.sh"
```

Change the path to match where you cloned this repo.

### Detaching and closing

- Detach and leave the session running: `Ctrl-b` then `d`. Run the script again to reattach.
- End the session: `tmux kill-session -t work`

### Customising

- **Session name:** change `SESSION_NAME` at the top of the script.
- **Pane sizes:** change the `-p` values in the `split-window` lines. `-p 35` sets the right pane's width and `-p 30` sets the bottom pane's height, both as percentages.
