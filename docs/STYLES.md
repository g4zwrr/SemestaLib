# Themes and colours

A theme is a table of colours. The same keys are used by every element in the library:

| Key | Used for |
|---|---|
| Bg | window background |
| Panel | sidebar, cards, tab bar |
| Item | buttons, slider tracks, toggle off state |
| Line | borders and strokes |
| Accent | highlights, toggles on, indicator, slider fill |
| Text | main text |
| Dim | secondary text, hints, grip |
| On | text drawn on top of Accent |
| Gradient | optional A → B colour blend over Bg (A, B, Rotation) |

## Built-in themes

| Theme | Bg | Panel | Item | Line | Accent | Text | Dim | On | Gradient |
|---|---|---|---|---|---|---|---|---|---|
| Midnight | #111117 | #181821 | #21212C | #343444 | #7C6FFF | #F0F0F5 | #9696A6 | #FFFFFF | none |
| Ocean | #0A1622 | #0F2030 | #172E42 | #26445E | #50AAFF | #E6F2FF | #82A0BA | #FFFFFF | none |
| Forest | #0E1812 | #14221A | #1E3226 | #2E4838 | #5ADC8C | #E8F5EC | #8CAA96 | #0A1E12 | none |
| Everforest | #2A2F2C | #333A35 | #424A43 | #555C52 | #A7C080 | #D3C6AA | #92998B | #2A2F2C | none |
| Pine | #131F18 | #18271E | #203227 | #2B4233 | #78C882 | #C4E0C8 | #82A08A | #0C1910 | none |
| Sunset | #1A1012 | #24171A | #342125 | #50343A | #FF8C46 | #FFF0EB | #B48C87 | #FFFFFF | none |
| Rose | #180E16 | #221520 | #321F2F | #4E3048 | #FF6EA0 | #FFEEF6 | #AF87A2 | #FFFFFF | none |
| Sakura | #FDF4F8 | #F8EAF0 | #FFFFFF | #E8CDDA | #DC6EA5 | #462D3A | #967887 | #FFFFFF | none |
| Mocha | #1E1E2E | #181825 | #313244 | #45475A | #CBA6F7 | #CDD6F4 | #A6ADC8 | #11111B | none |
| Frappe | #303446 | #292C3C | #414559 | #51576D | #CA9EE6 | #C6D0F5 | #A5ADCE | #232634 | none |
| Macchiato | #24273A | #1E2030 | #363A4F | #494D64 | #C6A0F6 | #CAD3F5 | #A5ADCB | #181926 | none |
| Latte | #EFF1F5 | #E6E9EF | #DCE0E8 | #BCC0CC | #8839EF | #4C4F69 | #8C8FA1 | #FFFFFF | none |
| Dracula | #282A36 | #2D2F3E | #44475A | #555970 | #BD93F9 | #F8F8F2 | #8B8FA0 | #282A36 | none |
| Nord | #2E3440 | #3B4252 | #434C5E | #4C566A | #88C0D0 | #ECEFF4 | #D8DEE9 | #2E3440 | none |
| Tokyo | #1A1B26 | #24283B | #292E42 | #3D4564 | #BB9AF7 | #C0CAF5 | #737AA2 | #1A1B26 | none |
| Gruvbox | #282828 | #3C3836 | #504945 | #665C54 | #FE8019 | #EBDBB2 | #A89984 | #282828 | none |
| Mono | #0C0C0C | #141414 | #1E1E1E | #343434 | #E6E6E6 | #F5F5F5 | #969696 | #0A0A0A | none |
| Light | #F0F2F6 | #E4E7EE | #FFFFFF | #C8CDD8 | #506EFF | #1E2028 | #6E7382 | #FFFFFF | none |
| Cyber | #2C3464 | #38427A | #485492 | #7888CC | #00E6FF | #F4FAFF | #B8C6E8 | #0A1028 | #5448AA → #186EA4 (45°) |
| Aurora | #386068 | #446E76 | #56848C | #84B2B8 | #78FFC8 | #F6FFFC | #C4E2E2 | #102828 | #4E968A → #7660B4 (45°) |
| Ember | #804634 | #90523E | #A86650 | #D0947C | #FFC46E | #FFF8F0 | #F4CEBE | #3C140A | #C46240 → #92427C (45°) |
| Nebula | #684A96 | #7858A8 | #8C6CBE | #BA9CE2 | #F0A6FF | #FCF8FF | #E0CEF4 | #28143C | #8856C4 → #4C60BA (45°) |
| Twilight | #58588A | #66669A | #7C7CB0 | #A8A8D4 | #D6BEFF | #FAFAFF | #CECEE6 | #1E1C3C | #7456B0 → #4C669E (90°) |

Gradient themes blend colours A and B across the window at the given rotation.

## Making your own theme

```lua
Win:SetTheme({
    Bg = Color3.fromRGB(24, 26, 40), Panel = Color3.fromRGB(32, 35, 54),
    Item = Color3.fromRGB(44, 48, 74), Line = Color3.fromRGB(70, 76, 110),
    Accent = Color3.fromRGB(255, 120, 180), Text = Color3.fromRGB(240, 242, 255),
    Dim = Color3.fromRGB(150, 156, 190), On = Color3.fromRGB(20, 20, 30),
})
```

## Defaults

- Theme: `Light`
- Font: `DenkOne`, 150%
- Corner radius: 20 (maximum)
