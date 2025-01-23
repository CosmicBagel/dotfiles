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
battery_icons["Full"] = "\u{f06a5}" -- plugged in icon
battery_icons["Unknown"] = "\u{f0091}"

M.apply_tab_bar_config = function(config)
	-- Enable retro bar
	config.use_fancy_tab_bar = false

	-- TODO don't forget to show zoom state!!!
	-- TODO make tabs look nicer

	config.hide_tab_bar_if_only_one_tab = false

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local title = tab.tab_title
		if #title == 0 then
			title = tab.active_pane.title
		end
		local cwd = tab.active_pane.current_working_dir
		print(cwd)
		if cwd ~= nil then
			local folder_name = cwd.path:match("([^/\\]+[/\\]?$)")
			title = title or folder_name
		end
		return title
	end)

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
			else
				local home_dir = os.getenv("USERPROFILE") or os.getenv("HOME")
				if string.find(pane:get_domain_name(), "WSL") == 1 then
					home_dir = "/home/sam" -- override for WSL tabs
				end
				-- using url parse to normalize windows paths (which have the
				-- wrong slashes)
				home_dir = wezterm.url.parse("file://" .. home_dir .. "/").path
				local pos_start, pos_end = string.find(cwd, home_dir, 1, true)
				if pos_start ~= nil and pos_start == 1 then
					cwd = "~/" .. string.sub(cwd, pos_end + 1)
				end
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
