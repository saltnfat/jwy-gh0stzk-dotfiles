{
  host,
  uberOS,
  lib,
  ...
}:
let
  inherit (uberOS)
    barChoice
    browser
    terminal
    ;

  lua = lib.generators.mkLuaInline;
  mainMod = "SUPER";

  dsp = {
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    close = lua "hl.dsp.window.close()";
    fullscreen = lua "hl.dsp.window.fullscreen()";
  };

  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };
  # Noctalia-specific bindings (only included when barChoice == "noctalia")
  noctaliaBind =
    if barChoice == "noctalia" then
      [
        "$modifier,D, Noctalia Launcher, exec,  noctalia-shell ipc call launcher toggle"
        "$modifier SHIFT,Return, Noctalia Launcher, exec,  noctalia-shell ipc call launcher toggle"
        "$modifier,M, Noctalia Notifications, exec, noctalia-shell ipc call notifications toggleHistory"
        "$modifier,V, Noctalia Clipboard, exec,  noctalia-shell ipc call launcher clipboard"
        "$modifier ALT,P, Noctalia Settings, exec, noctalia-shell ipc call settings toggle"
        "$modifier SHIFT,comma, Noctalia Settings, exec,  noctalia-shell ipc call settings toggle"
        "$modifier ALT,L, Noctalia Lock Screen, exec,  noctalia-shell ipc call sessionMenu lockAndSuspend"
        "$modifier SHIFT,W, Noctalia Wallpaper, exec,  noctalia-shell ipc call wallpaper toggle"
        "$modifier,X, Noctalia Power Menu, exec,  noctalia-shell ipc call sessionMenu toggle"
        "$modifier,C, Noctalia Control Center, exec,  noctalia-shell ipc call controlCenter toggle"
        "$modifier CTRL,R, Noctalia Screen Recorder, exec,  noctalia-shell ipc call screenRecorder toggle"
      ]
    else
      [ ];
  # Rofi launcher bindings (only included when barChoice != "noctalia")
  rofiBind =
    if barChoice != "noctalia" then
      [
        (bind "${mainMod} + D" (dsp.exec "rofi-launcher"))
      ]
    else
      [ ];
  # Rofi clipboard binding (only included when barChoice != "noctalia")
  rofiClipboardBind =
    if barChoice != "noctalia" then
      [
        "$modifier,V, Clipboard History, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      ]
    else
      [ ];
in
{
  wayland.windowManager.hyprland.settings = {
    bind =
      rofiBind
      #noctaliaBind
      #++ rofiClipboardBind
      ++ [
        # ============= WORKSPACE OVERVIEW =============
        (bind "${mainMod} + TAB" (dsp.exec "qs ipc -c overview call overview toggle"))
        # ============= TERMINALS =============
        (bind "${mainMod} + Return" (dsp.exec "${terminal}"))
        # ============= APPLICATION LAUNCHERS =============
        (bind "${mainMod} + W" (dsp.exec "${browser}"))
        (bind "${mainMod} + CTRL + K" (dsp.exec "qs-keybinds"))
        (bind "${mainMod} + CTRL + C" (dsp.exec "qs-cheatsheets"))
        (bind "${mainMod} + SHIFT + N" (dsp.exec "swaync-client -rs"))
        (bind "${mainMod} + Y" (dsp.exec "kitty -e yazi"))
        (bind "${mainMod} + E" (dsp.exec "emopicker9000"))
        (bind "${mainMod} + S" (dsp.exec "screenshootin"))
        # ============= SCREENSHOTS =============
        # "$modifier CTRL,S, Screenshot Output, exec, hyprshot -m output -o $HOME/Pictures/ScreenShots"
        # "$modifier SHIFT,S, Screenshot Window, exec, hyprshot -m window -o $HOME/Pictures/ScreenShots"
        # "$modifier ALT,S, Screenshot Region, exec, hyprshot -m region -o $HOME/Pictures/ScreenShots"
        # "$modifier,O, OBS Studio, exec, obs"
        # "$modifier ALT,C, Color Picker, exec, hyprpicker -a"
        # "$modifier,G, GIMP, exec, gimp"
        # "$modifier shift,T, Dropdown Terminal, exec, pypr toggle term"
        # ============= WINDOW MANAGEMENT =============
        (bind "${mainMod} + Q" (dsp.close))
        (bind "${mainMod} + F" (dsp.fullscreen))
        (bind "${mainMod} + P" (lua "hl.dsp.window.pseudo()"))
        (bind "${mainMod} + SHIFT + F" (lua "hl.dsp.window.float({ action = \"toggle\" })"))
        #(bind "${mainMod} + ALT + F" (dsp.exec "allfloat"))
        #"$modifier ALT,F, Float All Windows, workspaceopt, allfloat"
        # ============= FOCUS MOVEMENT (VI STYLE) =============
        (bind "${mainMod} + h" (lua "hl.dsp.focus({ direction = \"left\"})"))
        (bind "${mainMod} + l" (lua "hl.dsp.focus({ direction = \"right\"})"))
        (bind "${mainMod} + k" (lua "hl.dsp.focus({ direction = \"up\"})"))
        (bind "${mainMod} + j" (lua "hl.dsp.focus({ direction = \"down\"})"))

        # ============= MEDIA & HARDWARE CONTROLS =============
        (bind "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"))
        (bind "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"))
        (bind "XF86MonBrightnessUp" (dsp.exec "brightnessctl set 5%+"))
        (bind "XF86MonBrightnessDown" (dsp.exec "brightnessctl set 5%-"))
        (bind "XF86AudioMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
        (bind "XF86AudioMicMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
        (bind "XF86AudioMicMute" (dsp.exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
      ];
  };

  # ============= ADDITIONAL BINDS =============
  wayland.windowManager.hyprland.extraConfig = ''
    -- WORKSPACE --------------------------------------------------
    for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        hl.bind("${mainMod} + " .. key,             hl.dsp.focus({ workspace = i}))
        hl.bind("${mainMod} + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end
    hl.bind("${mainMod} + CTRL + h", hl.dsp.focus({ workspace = "e-1" }))
    hl.bind("${mainMod} + CTRL + l", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind("${mainMod} + CTRL + j", hl.dsp.focus({ workspace = "e-1" }))
    hl.bind("${mainMod} + CTRL + k", hl.dsp.focus({ workspace = "e+1" }))

    -- MOUSE ------------------------------------------------------
      -- Scroll through existing workspaces with mainMod + scroll
      hl.bind("${mainMod} + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
      hl.bind("${mainMod} + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

      -- Move/resize windows with mainMod + LMB/RMB and dragging
      hl.bind("${mainMod} + mouse:272", hl.dsp.window.drag(),   { mouse = true })
      hl.bind("${mainMod} + mouse:273", hl.dsp.window.resize(), { mouse = true })
      hl.bind("mouse:274", hl.dsp.window.drag(), { mouse = true })

    -- SPECIAL WORKSPACE (scratchpad)
    hl.bind("${mainMod} + SPACE",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind("${mainMod} + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:magic" }))

    -- WINDOW CYCLING ---------------------------------------------
    hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
  '';
}
