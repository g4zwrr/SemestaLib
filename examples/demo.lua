-- SemestaLib demo: a window that uses every element.
local Semesta = loadstring(game:HttpGet("https://raw.githubusercontent.com/g4zwrr/SemestaLib/main/src/SemestaLib.lua"))()

local Win = Semesta:CreateWindow({
	Title = "Semesta Demo",
	Size = Vector2.new(600, 420),
	Layout = "Sidebar",            -- "Sidebar" | "Topbar"
	-- Theme / Font / Radius use the library defaults (Light, DenkOne 150%, radius 20)
	SaveName = "SemestaDemo",      -- settings file name
	GuiName = "SemestaDemo",
	ToggleKey = Enum.KeyCode.RightShift,
	ToggleIcon = "menu",
	Icon = "sparkles",
	Borders = true,
	StartOpen = true,
	Settings = true,               -- adds the Settings tab
	LayoutTab = true,              -- adds the Layout tab (default first tab)
	Bubble = true,                 -- floating reopen button

	-----------------------------------------------------------------------
	-- Key system (optional). Disabled here; set Enabled = true to gate the
	-- window behind a key prompt. The window opens only after a valid key.
	-- Pick ONE of the validation methods below (checked in this order):
	--   1. Provider = "luarmor"  2. Validate  3. Keys  4. Url
	-----------------------------------------------------------------------
	KeySystem = {
		Enabled = false,
		Title = "Verification",                     -- prompt title
		Note = "Enter your key to continue.",       -- prompt hint text
		GetKeyUrl = "https://example.com/getkey",   -- adds a "Get key" button that copies this link
		Remember = true,                            -- remember a valid key between runs

		-- 1) Luarmor: validates the key with your Luarmor script
		-- Provider = "luarmor",
		-- ScriptId = "your-luarmor-script-id",

		-- 2) Custom function: return true (or false, "message")
		-- Validate = function(key)
		-- 	return key == "my-secret-key", "Wrong key"
		-- end,

		-- 3) Fixed list of accepted keys
		-- Keys = { "KEY-ONE", "KEY-TWO" },

		-- 4) Remote check: %s is replaced with the typed key. The server should
		--    reply with JSON like {"valid": true}, or the text "valid".
		--    Optional Check(body) lets you parse the reply yourself.
		-- Url = "https://example.com/api/check?key=%s",
		-- Check = function(body) return body == "OK" end,

		-- Runs once the key is accepted
		OnPass = function(win)
			print("[Demo] Key accepted")
		end,
	},
	Loading = { Subtitle = "Preparing your interface..." },  -- false to skip
})

-- Home tab
local Home = Win:AddTab("Home", "house")
Home:AddSection("Welcome")
Home:AddParagraph({
	Title = "Welcome",
	Content = "Use the icons in the header to switch between sidebar and topbar navigation. Press RightShift to hide the window.",
})
Home:AddButton({
	Title = "Send notification", Icon = "bell",
	Description = "Shows a toast in the corner",
	Callback = function()
		Win:Notify({
			Title = "Hello",
			Content = "Button pressed!",
			Icon = "check",
			Duration = 3,
		})
	end,
})
Home:AddButton({
	Title = "Rename window", Icon = "pencil",
	Callback = function()
		Win:SetTitle("Semesta Demo (renamed)")
	end,
})

-- Controls tab
local Controls = Win:AddTab("Controls", "sliders-horizontal")
Controls:AddSection("Inputs")

Controls:AddToggle({
	Title = "Auto farm", Icon = "zap", Flag = "AutoFarm", Default = false,
	Callback = function(v)
		print("[Demo] Auto farm:", v)
	end,
})

Controls:AddSlider({
	Title = "Walk speed", Icon = "gauge", Min = 16, Max = 200, Step = 1, Flag = "WalkSpeed", Default = 16,
	Callback = function(v)
		print("[Demo] Walk speed:", v)
	end,
})

Controls:AddDropdown({
	Title = "Mode", Icon = "list", Flag = "Mode",
	Options = { "Easy", "Normal", "Hard" }, Default = "Normal",
	Callback = function(v)
		print("[Demo] Mode:", v)
	end,
})

Controls:AddTextBox({
	Title = "Player name", Icon = "user", Flag = "PlayerName",
	Placeholder = "Type a name...", MaxLength = 16, Mode = "Alnum",
	Callback = function(v)
		print("[Demo] Name:", v)
	end,
})

Controls:AddKeybind({
	Title = "Panic key", Icon = "keyboard", Flag = "PanicKey",
	Default = Enum.KeyCode.P,
	Callback = function(k)
		print("[Demo] Panic key set to:", k and k.Name)
	end,
})

Controls:AddColorPicker({
	Title = "ESP colour", Icon = "palette", Flag = "EspColor",
	Default = Color3.fromRGB(124, 111, 255),
	Callback = function(c, a)
		print("[Demo] ESP colour:", c, a)
	end,
})

-- Info tab
local Info = Win:AddTab("Info", "info")
Info:AddSection("About")
Info:AddImage({ Title = "Banner", Height = 120, Image = "" })   -- put an asset id here
Info:AddParagraph({
	Title = "Semesta",
	Content = "A Roblox UI library with themes, a Sidebar or Topbar layout, and a Layout tab for appearance.",
})

-- Read a saved value
print("[Demo] Saved auto farm:", Win:GetFlag("AutoFarm", false))
