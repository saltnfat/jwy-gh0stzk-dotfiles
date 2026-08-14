hl.window_rule({
	match = {
		class = "^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$",
	},
	tag = "+file-manager",
})

hl.window_rule({
	match = {
		class = "^(com.mitchellh.ghostty|org.wezfurlong.wezterm|Alacritty|kitty|kitty-dropterm)$",
	},
	tag = "+terminal",
})

hl.window_rule({
	match = {
		class = "^(Brave-browser(-beta|-dev|-unstable)?)$",
	},
	tag = "+browser",
})

hl.window_rule({
	match = {
		class = "^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$",
	},
	tag = "+browser",
})

hl.window_rule({
	match = {
		class = "^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$",
	},
	tag = "+browser",
})

hl.window_rule({
	match = {
		class = "^([Tt]horium-browser|[Cc]achy-browser)$",
	},
	tag = "+browser",
})

hl.window_rule({
	match = {
		class = "^([Zz]en-beta|[Zz]en-browser)$",
	},
	tag = "+browser",
})

hl.window_rule({
	match = {
		class = "^(codium|codium-url-handler|VSCodium)$",
	},
	tag = "+projects",
})

hl.window_rule({
	match = {
		class = "^(VSCode|code-url-handler)$",
	},
	tag = "+projects",
})

hl.window_rule({
	match = {
		class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$",
	},
	tag = "+im",
})

hl.window_rule({
	match = {
		class = "^([Ff]erdium)$",
	},
	tag = "+im",
	center = true,
	float = true,
	size = "(monitor_w*0.6) (monitor_h*0.7)",
})

hl.window_rule({
	match = {
		class = "^([Ww]hatsapp-for-linux)$",
	},
	tag = "+im",
})

hl.window_rule({
	match = {
		class = "^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$",
	},
	tag = "+im",
})

hl.window_rule({
	match = {
		class = "^(teams-for-linux)$",
	},
	tag = "+im",
})

hl.window_rule({
	match = {
		class = "^(gamescope)$",
	},
	tag = "+games",
})

hl.window_rule({
	match = {
		class = "^(steam_app_d+)$",
	},
	tag = "+games",
})

hl.window_rule({
	match = {
		class = "^(com.libretro.RetroArch|[Rr]etro[Aa]rch)$",
	},
	tag = "+games",
})

hl.window_rule({
	match = {
		class = "^([Ss]team)$",
	},
	tag = "+gamestore",
})

hl.window_rule({
	match = {
		title = "^([Ll]utris)$",
	},
	tag = "+gamestore",
})

hl.window_rule({
	match = {
		class = "^(com.heroicgameslauncher.hgl)$",
	},
	tag = "+gamestore",
})

hl.window_rule({
	match = {
		class = "^(gnome-disks|wihotspot(-gui)?)$",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "^([Rr]ofi)$",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "^(file-roller|org.gnome.FileRoller)$",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "^(nm-applet|nm-connection-editor|blueman-manager)$",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$",
	},
	tag = "+settings",
	center = true,
})

hl.window_rule({
	match = {
		class = "^(nwg-look|qt5ct|qt6ct|[Yy]ad)$",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "(xdg-desktop-portal-gtk)",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "(.blueman-manager-wrapped)",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		class = "(nwg-displays)",
	},
	tag = "+settings",
})

hl.window_rule({
	match = {
		title = "^(Picture-in-Picture)$",
	},
	move = "((monitor_w*0.72)) ((monitor_h*0.07))",
	float = true,
	opacity = "0.95 0.75",
	pin = true,
	keep_aspect_ratio = true,
})

hl.window_rule({
	match = {
		title = "^(Hyprland Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration)$",
	},
	float = true,
	center = true,
	size = "(monitor_w*0.55) (monitor_h*0.66)",
})

hl.window_rule({
	match = {
		title = "^(Cheatsheets Viewer)$",
	},
	float = true,
	center = true,
	size = "(monitor_w*0.65) (monitor_h*0.6)",
})

hl.window_rule({
	match = {
		class = "^([Ww]aypaper)$",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Wallpapers)$",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Video Wallpapers)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(qs-wlogout)$",
	},
	float = true,
	center = true,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Panels)$",
	},
	float = true,
	center = true,
	no_shadow = true,
	no_blur = true,
	rounding = 12,
})

hl.window_rule({
	match = {
		title = "^(Hyprland Keybinds|Niri Keybinds|BSPWM Keybinds|i3 Keybinds|Sway Keybinds|DWM Keybinds|Emacs Leader Keybinds|Kitty Configuration|WezTerm Configuration|Ghostty Configuration|Yazi Configuration|Cheatsheets Viewer|Documentation Viewer)$",
	},
	float = true,
	center = true,
	size = "(monitor_w*0.55) (monitor_h*0.66)",
})

hl.window_rule({
	match = {
		class = "([Tt]hunar)",
		title = "negative:(.*[Tt]hunar.*)",
	},
	center = true,
	float = true,
})

hl.window_rule({
	match = {
		title = "^(Authentication Required)$",
	},
	center = true,
	float = true,
})

hl.window_rule({
	match = {
		class = "^(*)$",
	},
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = {
		title = "^(*)$",
	},
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = {
		fullscreen = 1,
	},
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = {
		tag = "settings*",
	},
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.7)",
	opacity = "0.8 0.7",
})

hl.window_rule({
	match = {
		class = "^(mpv|com.github.rafostar.Clapper)$",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "(codium|codium-url-handler|VSCodium)",
		title = "negative:(.*codium.*|.*VSCodium.*)",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "^(com.heroicgameslauncher.hgl)$",
		title = "negative:(Heroic Games Launcher)",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "^([Ss]team)$",
		title = "negative:^([Ss]team)$",
	},
	float = true,
})

hl.window_rule({
	match = {
		initial_title = "(Add Folder to Workspace)",
	},
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
})

hl.window_rule({
	match = {
		initial_title = "(Open Files)",
	},
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
})

hl.window_rule({
	match = {
		initial_title = "(wants to save)",
	},
	float = true,
})

hl.window_rule({
	match = {
		tag = "browser*",
	},
	opacity = "1.0 0.85",
})

hl.window_rule({
	match = {
		tag = "projects*",
	},
	opacity = "0.9 0.8",
})

hl.window_rule({
	match = {
		tag = "im*",
	},
	opacity = "0.94 0.86",
})

hl.window_rule({
	match = {
		tag = "file-manager*",
	},
	opacity = "0.9 0.8",
})

hl.window_rule({
	match = {
		tag = "terminal*",
	},
	opacity = "0.9 0.7",
})

hl.window_rule({
	match = {
		class = "^(gedit|org.gnome.TextEditor|mousepad)$",
	},
	opacity = "0.8 0.7",
})

hl.window_rule({
	match = {
		class = "^(seahorse)$",
	},
	opacity = "0.9 0.8",
})

hl.window_rule({
	match = {
		tag = "games*",
	},
	no_blur = true,
	fullscreen = true,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Wallpapers)$",
	},
	border_size = 0,
	no_shadow = true,
	no_blur = true,
	rounding = 12,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Video Wallpapers)$",
	},
	border_size = 0,
	no_shadow = true,
	no_blur = true,
	rounding = 12,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(qs-wlogout)$",
	},
	border_size = 0,
	rounding = 20,
	opacity = "1.0 1.0",
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Cheatsheets Viewer)$",
	},
	border_size = 0,
	no_shadow = true,
	rounding = 12,
})

hl.window_rule({
	match = {
		class = "^(org.qt-project.qml)$",
		title = "^(Documentation Viewer)$",
	},
	border_size = 0,
	no_shadow = true,
	rounding = 12,
})
