# Simple Transparent Window Controller
Control window transparency like a pro - without ruining your screen recordings!

## What is this?

A simple yet powerful AutoHotkey script that lets you:

* Instantly pick any window just by hovering your mouse  
* Make it **semi-transparent** with adjustable opacity  
* Keep it **always on top** - useful for overlays and reminders  
* Change transparency on the fly with hotkeys  
* See the active window’s title in a tooltip - never pick the wrong one again!

## Why use it?

* Doing a live stream, Zoom call, or screen recording?  
* Need an overlay window that’s visible but not distracting?  
* Want to optimize your workspace without hiding what matters?

**This is your all-in-one productivity power tool!**


## Hotkeys

| Shortcut         | Action                                                      |
|------------------|-------------------------------------------------------------|
| `Ctrl + Alt + S` | Select the window under your mouse cursor (fast and easy)  |
| `Ctrl + Alt + T` | Toggle transparency & always-on-top for the selected window|
| `Ctrl + Alt + ↑` | Increase transparency (less visible)                       |
| `Ctrl + Alt + ↓` | Decrease transparency (more visible)                       |
| `Ctrl + Alt + W` | Show active window title in a tooltip                      |


## How to use?

1. Install [AutoHotkey](https://www.autohotkey.com/)  
2. Save the script as `TransparentWindowController.ahk`  
3. Run it - you’ll see nothing… but that’s the magic  
4. Hover over the window you want and press `Ctrl + Alt + S`  
5. Toggle transparency with `Ctrl + Alt + T`  
6. Adjust with arrow keys while holding `Ctrl + Alt`  
7. Use `Ctrl + Alt + W` to show the current active window's title


## Technical details

- Uses the **`WS_EX_LAYERED`** style to apply transparency
- Keeps window **always on top**
- **Does NOT use WS_EX_TRANSPARENT** to remain invisible to screen capture software (OBS, Zoom, etc.)
- Works with **partial window title matching** - no need to type full names


## Pro tips from theibd56

-  Start at transparency level `180`, tweak up/down to your taste  
-  For apps with dynamic titles - just hover + `Ctrl + Alt + S`, no guessing  
-  Want to return to normal? Hit `Ctrl + Alt + T` again to turn off transparency  
-  Perfect for streamers, devs, and productive wizards like you


## License

Free to use, modify, and share - just don’t use it to annoy your coworkers  
Stay cool, stay productive, and may your desktop always be clean.


**Step up your productivity game with transparent windows!**  
Your scriptmaster, **theibd56**
