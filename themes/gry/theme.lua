theme = {}

theme.theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/gry"
theme.wallpaper = theme.theme_dir .. "/background.jpg"

--{{---- Colors ---------------------------------

theme.grey1	= "#dddddd"
theme.grey2	= "#cccccc"
theme.grey3     = "#bbbbbb"
theme.grey4     = "#aaaaaa"
theme.grey5     = "#999999"
theme.grey6     = "#222222"
theme.grey7     = "#cccccc"

theme.orange    = "#dc9b30"
theme.red       = "#c45a41"
theme.green     = "#5d6042"
theme.blue      = "#0076a3"
theme.grey      = "#222222"

--{{---- Common ---------------------------------


-- Widget font
theme.wifont    = "#222222"
-- Clock font
theme.clfont	= "#0076a3"

theme.font          = "Terminus 9"

theme.bg_normal     = theme.grey1
theme.bg_focus      = theme.grey2
theme.bg_urgent     = "#222222"
theme.bg_minimize   = "#222222"

theme.fg_normal     = "#222222"
theme.fg_focus      = "#0076a3"
theme.fg_urgent     = "#888888"
theme.fg_minimize   = "#888888"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"


--{{---- Seperators -----------------------------

theme.div1      = theme.theme_dir .. "/tasklist/div1.png"
theme.div2      = theme.theme_dir .. "/tasklist/div2.png"
theme.div3      = theme.theme_dir .. "/tasklist/div3.png"
theme.div4      = theme.theme_dir .. "/tasklist/div4.png"
theme.div5      = theme.theme_dir .. "/tasklist/div5.png"
theme.div6      = theme.theme_dir .. "/tasklist/div6.png"
theme.div7      = theme.theme_dir .. "/tasklist/div7.png"


--{{---- Menu  ----------------------------------

theme.men1      = theme.theme_dir .. "/menu/submenu1.png"
theme.men2      = theme.theme_dir .. "/menu/submenu2.png"
theme.men3      = theme.theme_dir .. "/menu/submenu3.png"
theme.men4      = theme.theme_dir .. "/menu/submenu4.png"


--{{---- Icons ----------------------------------

theme.awesome_icon      = theme.theme_dir .. "/awesome.png"
theme.menu              = theme.theme_dir .. "/menu.png"

theme.batteryicon       = theme.theme_dir .. "/icons/battery4.png"
theme.cdicon            = theme.theme_dir .. "/icons/cd.png"
theme.cpuicon            = theme.theme_dir .. "/icons/cpu3.png"
theme.hdicon            = theme.theme_dir .. "/icons/hd1.png"
theme.mailicon          = theme.theme_dir .. "/icons/mail.png"
theme.muteicon          = theme.theme_dir .. "/icons/mute.png"
theme.ramicon           = theme.theme_dir .. "/icons/ram3.png"
theme.spkricon          = theme.theme_dir .. "/icons/spkr.png"
theme.spkronicon        = theme.theme_dir .. "/icons/spkron.png"
theme.tempicon          = theme.theme_dir .. "/icons/temp2.png"
theme.terminalicon      = theme.theme_dir .. "/icons/terminal.png"
theme.wifihigh	        = theme.theme_dir .. "/icons/wifih4.png"
theme.wifimed          = theme.theme_dir .. "/icons/wifim4.png"
theme.wifilow          = theme.theme_dir .. "/icons/wifil4.png"

theme.noicon		= theme.theme_dir .. "/apps/noicon.png"
theme.chromium_icon     = theme.theme_dir .. "/apps/noicon.png"
theme.vlc_icon          = theme.theme_dir .. "/apps/noicon.png"
theme.inkscape_icon     = theme.theme_dir .. "/apps/noicon.png"
theme.texmaker_icon     = theme.theme_dir .. "/apps/noicon.png"


--{{---- Layouts  -------------------------------

theme.layout_floating   = theme.theme_dir .. "/layouts/float.png"
theme.layout_tile       = theme.theme_dir .. "/layouts/tile_right.png"
theme.layout_tileleft   = theme.theme_dir .. "/layouts/tile_left.png"
theme.layout_tilebottom = theme.theme_dir .. "/layouts/tile_bottom.png"
theme.layout_tiletop    = theme.theme_dir .. "/layouts/tile_top.png"
--theme.layout_fairv      = theme.theme_dir .. "/layouts/fairv.png"
--theme.layout_fairh      = theme.theme_dir .. "/layouts/fairh.png"
--theme.layout_spiral     = theme.theme_dir .. "/layouts/spiral.png"
theme.layout_dwindle    = theme.theme_dir .. "/layouts/dwindle.png"
--theme.layout_max        = theme.theme_dir .. "/layouts/max.png"
theme.layout_fullscreen = theme.theme_dir .. "/layouts/fullscreen.png"
--theme.layout_magnifier  = theme.theme_dir .. "/layouts/magnifier.png"

return theme                    
