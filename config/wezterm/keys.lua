local act = require("wezterm").action

local M = {
	-- macos stuff
	{ key = "q", mods = "CMD", action = act.QuitApplication },
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "=", mods = "CMD", action = act.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = act.ResetFontSize },
	{ key = "h", mods = "CMD", action = act.HideApplication },
	{ key = "m", mods = "CMD", action = act.Hide },
	{ key = "n", mods = "CMD", action = act.SpawnWindow },

	{ key = "q", mods = "LEADER|CTRL", action = act.SendKey({ key = "q", mods = "CTRL" }) },

	{ key = "F11", mods = "", action = act.ToggleFullScreen },

	{ key = "r", mods = "LEADER|SHIFT", action = act.ReloadConfiguration },
	{ key = "l", mods = "LEADER|CTRL|SHIFT", action = act.ShowDebugOverlay },

	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },

	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "&", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	{ key = "h", mods = "LEADER|ALT", action = act.MoveTabRelative(-1) },
	{ key = "l", mods = "LEADER|ALT", action = act.MoveTabRelative(1) },

	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "%", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "r", mods = "LEADER", action = act.RotatePanes("Clockwise") },

	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	{ key = "LeftArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },

	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },
	{ key = "0", mods = "LEADER", action = act.ActivateTab(9) },

	{ key = "1", mods = "CMD", action = act.ActivateTab(0) },
	{ key = "2", mods = "CMD", action = act.ActivateTab(1) },
	{ key = "3", mods = "CMD", action = act.ActivateTab(2) },
	{ key = "4", mods = "CMD", action = act.ActivateTab(3) },
	{ key = "5", mods = "CMD", action = act.ActivateTab(4) },
	{ key = "6", mods = "CMD", action = act.ActivateTab(5) },
	{ key = "7", mods = "CMD", action = act.ActivateTab(6) },
	{ key = "8", mods = "CMD", action = act.ActivateTab(7) },
	{ key = "9", mods = "CMD", action = act.ActivateTab(8) },
	{ key = "0", mods = "CMD", action = act.ActivateTab(9) },

	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },

	{ key = "p", mods = "LEADER", action = act.ActivateCommandPalette },

	-- when leader key is annoying
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },

	{ key = "n", mods = "CTRL|SHIFT", action = act.SpawnWindow },
	{ key = "t", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "Space", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },

	{ key = "!", mods = "CTRL|SHIFT", action = act.ActivateTab(0) },
	{ key = "@", mods = "CTRL|SHIFT", action = act.ActivateTab(1) },
	{ key = "#", mods = "CTRL|SHIFT", action = act.ActivateTab(2) },
	{ key = "$", mods = "CTRL|SHIFT", action = act.ActivateTab(3) },
	{ key = "%", mods = "CTRL|SHIFT", action = act.ActivateTab(4) },
	{ key = "^", mods = "CTRL|SHIFT", action = act.ActivateTab(5) },
	{ key = "&", mods = "CTRL|SHIFT", action = act.ActivateTab(6) },
	{ key = "*", mods = "CTRL|SHIFT", action = act.ActivateTab(7) },
	{ key = "(", mods = "CTRL|SHIFT", action = act.ActivateTab(8) },
	{ key = ")", mods = "CTRL|SHIFT", action = act.ActivateTab(9) },

	-- multiplexing stuff
	{ key = "d", mods = "LEADER", action = act.DetachDomain("CurrentPaneDomain") },
}

return M
