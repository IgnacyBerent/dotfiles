local mocha = require("mocha")

---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "ghostty"
local fileManager = "thunar"
local menu = "wofi --show drun"
local logout = "wlogout --buttons-per-row 2"
local browser = "zen-browser"
local mainMod = "SUPER"

------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "DP-2", mode = "1920x1080@60", position = "0x0", scale = "1" })
hl.monitor({ output = "DP-3", mode = "1920x1080@60", position = "1920x0", scale = "1" })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60", position = "-1920x0", scale = "1" })

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("wl-gammarelay-rs")
	hl.exec_cmd("~/.config/hypr/scripts/suncycle.sh")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar & nm-applet --indicator & swaync")
	hl.exec_cmd("hyprctl setcursor catppuccin-mocha-dark-cursors 28")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd(terminal)
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("LIBVA_DRIVER_NAME", "radeonsi")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "direct")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border = {
				colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
				angle = 45,
			},
			inactive_border = "rgba(" .. mocha.surface0Alpha .. "aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 4,
			passes = 2,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

--------------------
---- ANIMATIONS ----
--------------------
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

---------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "pl",
		follow_mouse = 1,
		sensitivity = -0.4,
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------
-- Apps
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd(logout))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Hyprland controls
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special Workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll Workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse actions
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media & System Keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d 0.05"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateBrightness d -0.05"),
	{ locked = true, repeating = true }
)

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind("CTRL + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

hl.window_rule({
	name = "opacity-thunar-discord",
	match = { class = "^(thunar|discord)$" },
	opacity = "0.85 0.95",
})

hl.layer_rule({
	name = "blur-ui-elements",
	match = { namespace = "^(waybar|swaync-control-center|swaync-notification-window|logout_dialog)$" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	name = "ignore-alpha-swaync",
	match = { namespace = "^swaync-(control-center|notification-window)$" },
	ignore_alpha = 0.5,
})
