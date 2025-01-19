local wezterm = require("wezterm")

local M = {}

--local leader_active_color = '#f38ba8'
local leader_active_color = "#a6e3a1"

local battery_icons = {}
battery_icons["Charging10"] = "\u{f0085}"
battery_icons["Charging9"] = "\u{f008b}"
battery_icons["Charging8"] = "\u{f008a}"
battery_icons["Charging7"] = "\u{f089e}"
battery_icons["Charging6"] = "\u{f0089}"
battery_icons["Charging5"] = "\u{f089d}"
battery_icons["Charging4"] = "\u{f0088}"
battery_icons["Charging3"] = "\u{f0087}"
battery_icons["Charging2"] = "\u{f0086}"
battery_icons["Charging1"] = "\u{f089c}"
battery_icons["Charging0"] = "\u{f089f}"
battery_icons["Discharging10"] = "\u{f0079}"
battery_icons["Discharging9"] = "\u{f0082}"
battery_icons["Discharging8"] = "\u{f0081}"
battery_icons["Discharging7"] = "\u{f0080}"
battery_icons["Discharging6"] = "\u{f007f}"
battery_icons["Discharging5"] = "\u{f007e}"
battery_icons["Discharging4"] = "\u{f007d}"
battery_icons["Discharging3"] = "\u{f007c}"
battery_icons["Discharging2"] = "\u{f007b}"
battery_icons["Discharging1"] = "\u{f007a}"
battery_icons["Discharging0"] = "\u{f008e}"
battery_icons["Empty"] = "\u{f008e}"
battery_icons["Full"] = "\u{f06a5}"

-- "Unknown" usually happens when battery isn't charging (on AC power), but
-- also isn't full. This occurs when battery is near full, but not quite full.
battery_icons["Unknown"] = "\u{f06a5}"

M.apply_tab_bar_config = function(config)
	-- Enable retro bar
	config.use_fancy_tab_bar = false

	-- TODO don't forget to show zoom state!!!
	-- TODO make tabs look nicer

	-- Show if LEADER key is active in status bar
	wezterm.on("update-status", function(window, pane)
		local leader = window:leader_is_active()
		text = leader and "  " or "    "
		window:set_left_status(wezterm.format({
			{ Foreground = { Color = leader_active_color } },
			{ Text = text },
		}))
	end)

	wezterm.on("update-right-status", function(window, pane)
		local bat = ""
		local batteries = wezterm.battery_info()
		if #batteries > 0 then
			-- assuming that the laptop battery is the first battery
			local b = batteries[1]
			-- 0 through 10
			local level = math.floor(b.state_of_charge * 10)
			local state = b.state
			if state == "Charging" or state == "Discharging" then
				state = state .. level
			end
			local icon = battery_icons[state]
			bat = icon .. " " .. string.format("%.0f%% ", b.state_of_charge * 100)
		end

		local date = wezterm.strftime("%H:%M")

		local meta = pane:get_metadata() or {}
		local tardy = meta.is_tardy and "TTY Tardy" or ""

		local pane_cwd = pane:get_current_working_dir()
		if pane_cwd ~= nil then
			local cwd = pane_cwd.path
			if cwd == nil then
				cwd = "???"
			end
			window:set_right_status(wezterm.format({
				{ Text = tardy .. " " .. cwd .. "  " .. bat .. " " .. date .. " " },
			}))
		else
			window:set_right_status(wezterm.format({
				{ Text = tardy .. " " .. bat .. " " .. date .. " " },
			}))
		end
	end)

	config.hide_tab_bar_if_only_one_tab = false

	-- disable in fullscreen if only one bar
	-- wezterm.on('window-resized', function(window, _)
	--     local isFs = window:get_dimensions().is_full_screen
	--     local overrides = window:get_config_overrides() or {}
	--     if isFs then
	--         overrides.hide_tab_bar_if_only_one_tab = true
	--     else
	--         overrides.hide_tab_bar_if_only_one_tab = false
	--     end
	--     window:set_config_overrides(overrides)
	-- end)
end

return M
