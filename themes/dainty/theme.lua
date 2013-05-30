
theme = {}

theme.theme_dir	= os.getenv("HOME") .. "/.config/awesome/themes/dainty"
theme.wallpaper	= theme.theme_dir .. "/background.jpg"

theme.wifont	= "#DDDDDD"

theme.font          = "Terminus 9"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#d8d8d8"
theme.bg_urgent     = "#d02e54"
theme.bg_minimize   = "#444444"

theme.fg_normal     = "#cccccc"
theme.fg_focus      = "#000000"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = "1"
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

--{{---- Colors ---------------------------------

theme.orange	= "#dc9b30"
theme.red	= "#c45a41"
theme.green	= "#5d6042"
theme.blue	= "#0076a3"
theme.grey	= "#222222"

--{{---- Seperators -----------------------------

theme.sep1	= theme.theme_dir .. "/tasklist/grey-red.png"
theme.sep2	= theme.theme_dir .. "/tasklist/red-orange.png"
theme.sep3	= theme.theme_dir .. "/tasklist/orange-green.png"
theme.sep4	= theme.theme_dir .. "/tasklist/green-grey.png"

--{{---- Menu  ----------------------------------

theme.men1      = theme.theme_dir .. "/menu/submenu1.png"
theme.men2      = theme.theme_dir .. "/menu/submenu2.png"
theme.men3      = theme.theme_dir .. "/menu/submenu3.png"
theme.men4      = theme.theme_dir .. "/menu/submenu4.png"


--{{---- Icons ----------------------------------

theme.awesome_icon	= theme.theme_dir .. "/awesome.png"
theme.menu		= theme.theme_dir .. "/menu.png"

theme.hdicon	= theme.theme_dir .. "/tasklist/harddrive.png"
theme.tempicon	= theme.theme_dir .. "/tasklist/thermometer.png"

theme.chromium_icon	= theme.theme_dir .. "/apps/noicon.png"
theme.vlc_icon		= theme.theme_dir .. "/apps/noicon.png"
theme.inkscape_icon	= theme.theme_dir .. "/apps/noicon.png"
theme.texmaker_icon	= theme.theme_dir .. "/apps/noicon.png"


--{{---- Layouts  -------------------------------

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
theme.layout_floating   = theme.theme_dir .. "/layouts/float.png"




-- Display the taglist squares
theme.taglist_squares_sel   = theme.theme_dir .. "/taglist/squarefw.png"
theme.taglist_squares_unsel = theme.theme_dir .. "/taglist/squarew.png"

theme.tasklist_floating_icon = ""

return theme
