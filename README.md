<p align="center">
  <img src="assets/banner.svg" alt="Semesta — Lightweight UI Library" width="100%"/>
</p>

<p align="center">
  A lightweight, themeable UI library for Roblox.<br/>
  Sidebar or topbar navigation, a resizable window, persistent settings and a built-in appearance editor.
</p>

---

## Overview

Semesta is a single-file UI library for Roblox scripts. It gives you a complete window system out of the box: tabs, form controls, notifications, a confirmation dialog, a loading screen and an optional key gate. Every control that has a `Flag` is saved to disk and restored the next time the script runs.

The library ships with a **Layout** tab and a **Settings** tab, so end users can change the theme, font, corner radius, opacity and scale themselves without any extra code on your side.

## Showcase

https://github.com/user-attachments/assets/8e0a6033-fdcb-4425-8e09-1a3cebac917d

## Features

- **23 built-in themes**, including five gradient themes. See [docs/STYLES.md](docs/STYLES.md) for the full colour reference.
- **Sidebar and Topbar layouts**, switchable at runtime.
- **Resizable, draggable window** with a corner grip and Width/Height sliders.
- **Persistent configuration.** Controls with a `Flag` are saved and restored automatically.
- **Layout tab** for theme, borders, corner radius, background opacity, scale, font and font size.
- **Settings tab** with reduce-motion, toggle key, copy-config and a confirmed reset.
- **Loading screen** that can be configured, driven manually, or disabled.
- **Notifications** and a **multi-click confirmation dialog**.
- **Optional key system** with Luarmor support or custom validation.
- **Floating reopen button** that stays on screen.

## Installation

Load the library directly from the repository:

```lua
local Semesta = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/g4zwrr/SemestaLib/main/src/SemestaLib.lua"
))()
```

Or copy [`src/SemestaLib.lua`](src/SemestaLib.lua) into your project and load it locally.

## Quick start

```lua
local Win = Semesta:CreateWindow({
    Title = "My Hub",
    Size = Vector2.new(600, 420),
    Layout = "Sidebar",
    Loading = { Subtitle = "Preparing your interface..." },
})

local Main = Win:AddTab("Main", "house")

Main:AddSection("Basics")

Main:AddToggle({
    Title = "Auto farm",
    Flag = "AutoFarm",
    Default = false,
    Callback = function(value)
        print("Auto farm:", value)
    end,
})

Main:AddSlider({
    Title = "Walk speed",
    Flag = "WalkSpeed",
    Min = 16, Max = 200, Default = 16,
    Callback = function(value)
        print("Walk speed:", value)
    end,
})
```

A complete example that uses every element is available in [examples/demo.lua](examples/demo.lua).

## Window options

Passed to `Semesta:CreateWindow(options)`.

| Option | Default | Description |
|---|---|---|
| `Title` | `"Semesta"` | Window title. |
| `Size` | `Vector2.new(580, 390)` | Starting size. The window stays resizable. |
| `Layout` | `"Sidebar"` | `"Sidebar"` or `"Topbar"`. |
| `Theme` | `"Light"` | Preset name or a colour table (see [docs/STYLES.md](docs/STYLES.md)). |
| `Font` | `"DenkOne"` | Any font from the built-in font list. |
| `FontSize` | `150` | Font scale, in percent. |
| `Radius` | `20` | Corner radius. Maximum is 20. |
| `Borders` | `true` | Draw borders on panels and controls. |
| `Icon` / `ToggleIcon` | — | Header icon and the icon used for the toggle button. |
| `Settings` | `true` | Add the Settings tab. |
| `LayoutTab` | `true` | Add the Layout tab as the first tab. |
| `Loading` | enabled | `false` to skip, or a table with `Duration`, `Title`, `Subtitle`, `Icon`, `Manual`. |
| `ToggleKey` | `Enum.KeyCode.RightShift` | Key that shows and hides the window. |
| `Bubble` | `true` | Floating button that reopens a hidden window. |
| `StartOpen` | `true` | Whether the window is visible after loading. |
| `SaveName` | `"Semesta"` | Name of the saved config file. |
| `GuiName` | `"Semesta"` | Name of the ScreenGui. |
| `KeySystem` | disabled | See [Key system](#key-system). |

## Window API

| Method | Description |
|---|---|
| `Win:AddTab(name, icon)` | Create a tab and return it. |
| `Win:SelectTab(tab)` | Switch to a tab. |
| `Win:SetTheme(nameOrTable)` | Change the theme. |
| `Win:SetFont(name)` / `Win:SetFontSize(percent)` | Typography. |
| `Win:SetRadius(n)` / `Win:SetBgOpacity(n)` / `Win:SetScale(percent)` / `Win:SetBorders(bool)` | Appearance. |
| `Win:SetLayout("Sidebar" \| "Topbar")` | Navigation layout. |
| `Win:SetSize(w, h)` | Resize the window. Keeps the top-left corner and syncs the size sliders. |
| `Win:SetTitle(text)` | Change the title. |
| `Win:Notify({ Title, Content, Icon, Duration })` | Show a toast notification. |
| `Win:Confirm({ Title, Content, Clicks, OnConfirm, OnCancel })` | Show a confirmation dialog that requires `Clicks` presses of Yes. |
| `Win:SetLoading(text, percent)` / `Win:FinishLoading()` | Drive a manual loading screen. |
| `Win:GetFlag(flag, default)` / `Win:SetFlag(flag, value)` | Read or write a saved value. |
| `Win:ResetConfig()` | Restore every registered control to its default. |
| `Win:Toggle()` / `Win:Minimize(bool)` / `Win:Destroy()` | Window control. |

## Elements

Elements are added to a tab:

`AddSection` · `AddLabel` · `AddParagraph` · `AddImage` · `AddButton` · `AddToggle` · `AddSlider` · `AddDropdown` · `AddTextBox` · `AddKeybind` · `AddColorPicker` · `AddThemePreview` · `AddFontPicker`

Any element created with a `Flag` is saved automatically and restored by `Win:ResetConfig()`.

## Key system

Semesta can gate the window behind a key prompt. Set `KeySystem.Enabled = true` and choose one validation method. If several are set, they are checked in this order: `Provider`, `Validate`, `Keys`, `Url`.

```lua
KeySystem = {
    Enabled = true,
    Title = "Verification",
    Note = "Enter your key to continue.",
    GetKeyUrl = "https://example.com/getkey",  -- adds a "Get key" button
    Remember = true,                           -- remember a valid key between runs

    Keys = { "KEY-ONE", "KEY-TWO" },           -- fixed list of accepted keys
    OnPass = function(win) print("Unlocked") end,
}
```

| Method | Fields | Behaviour |
|---|---|---|
| Luarmor | `Provider = "luarmor"`, `ScriptId` | Validates the key with your Luarmor script. |
| Custom | `Validate(key)` | Return `true`, or `false, "message"`. |
| Fixed list | `Keys` | Accepts any key in the list. |
| Remote | `Url`, optional `Check(body)` | `%s` in `Url` is replaced with the key. The reply is read as JSON (`valid` or `success`), the text `valid`, or passed to `Check`. |

[examples/demo.lua](examples/demo.lua) contains a commented example of every method.

## Repository layout

```
SemestaLib/
├── src/SemestaLib.lua      The library
├── examples/demo.lua       A window that uses every element
├── docs/STYLES.md          Theme and colour reference
└── assets/                 Logo and banner
```

## Notes

- Saved settings take priority over defaults. Use **Reset to defaults** in the Settings tab, or delete the config file, to return to a clean state.
- Semesta targets Roblox executors that provide `loadstring`, `game:HttpGet` and the file functions (`readfile`, `writefile`, `isfile`). Without file functions the library still works, but settings are not persisted.

## License

Released under the [MIT License](LICENSE).
