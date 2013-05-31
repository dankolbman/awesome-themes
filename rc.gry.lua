-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
vicious = require("vicious")
local menubar = require("menubar")

--{{---- Error handling -------------------------
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

--{{---- Theme ----------------------------------

home = os.getenv("HOME")
config_dir = home .. "/.config/awesome"
themes_dir = config_dir .. "/themes"
active_theme = themes_dir .. "/gry"

beautiful.init(active_theme .. "/theme.lua")

--{{---- Variables ------------------------------
terminal = "urxvt"
terminal_cmd = terminal .. " -e "

editor = "vim"
editor_cmd = terminal_cmd .. editor .. " "

browser = "chromium"
filemanager = "mc"


-- alt key
modkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
--    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
--    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
}

--{{---- Wallpaper ------------------------------
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

--{{---- Tags -----------------------------------
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5 }, s, layouts[1])
end

--{{---- Menu -----------------------------------
myawesomemenu = {
	{ "restart", awesome.restart, beautiful.texmaker_icon },
	{ "edit rc.lua", editor_cmd .. home .. "/.config/awesome/rc.lua", beautiful.texmaker_icon },
	{ "reboot", "sudo reboot", beautiful.texmaker_icon},
	{ "quit", awesome.quit, beautiful.texmaker_icon }
}

mywebmenu = {
	{"Internet", browser, beautiful.noicon}
}


mymultimediamenu = {
	{"VLC", "vlc", beautiful.vlc_icon}
}

mygraphicsmenu = {
	{"Gimp", "gimp",  beautiful.noicon}, 
	{"Inkscape", "inkscape", beautiful.inkscape_icon}
}

myofficemenu = {
	{"TEX Maker", "texmaker", beautiful.texmaker_icon},
	{"Evince", "evince", beautiful.noicon}
}

mytoolsmenu = {
	{"7zip", "7zFM", beautiful.noicon},
	{"htop", "htop", beautiful.nocion}
}

mysettingsmenu = {
	{"Alsa", terminal_cmd .. "alsamixer", beautiful.noicon},
	{"Wicd", terminal_cmd .. "wicd-curses", beautiful.noicon}
}


mymainmenu = awful.menu({ items = {
	{" awesome",		myawesomemenu, beautiful.men2 },
	{" web",		mywebmenu, beautiful.men1},
	{" graphics",		mygraphicsmenu, beautiful.men1},
	{" multimedia",		mymultimediamenu, beautiful.men1},
	{" office",		myofficemenu, beautiful.men1},
	{" tools",		mytoolsmenu, beautiful.men1},
	{" settings",		mysettingsmenu, beautiful.men1},
	{" file manager",	terminal_cmd .. filemanager, beautiful.men1},
	{" terminal",		terminal, beautiful.men3}
	}
})

mylauncher = awful.widget.launcher({ image = beautiful.menu,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

--{{---- Wibox ---------------------------------


-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}

--{{ Tags }}--
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )

--{{ Current tasks}}--
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

--{{---- Seperators -----------------------------

div1 = wibox.widget.imagebox()
div1:set_image(beautiful.div1)

div2 = wibox.widget.imagebox()
div2:set_image(beautiful.div2)

div3 = wibox.widget.imagebox()
div3:set_image(beautiful.div3)

div4 = wibox.widget.imagebox()
div4:set_image(beautiful.div4)

div5 = wibox.widget.imagebox()
div5:set_image(beautiful.div5)

div6 = wibox.widget.imagebox()
div6:set_image(beautiful.div6)

div7 = wibox.widget.imagebox()
div7:set_image(beautiful.div7)

--{{---- Launchers ------------------------------

fmlauncher = wibox.widget.imagebox()
fmlauncher:set_image(beautiful.foldericon)
fmlauncher:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn(terminal_cmd .. filemanager .. " ~/") end)))


vollauncher = wibox.widget.imagebox()
--vollauncher:buttons(awful.util.table.join(awful.button({ }, 1, 
--function () awful.util.spawn(terminal_cmd .. "alsamixer") end)))

vollauncher:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("amixer -q set Master toggle", false) end),
    awful.button({ }, 3, function () awful.util.spawn(terminal_cmd .. "alsamixer", true) end),
    awful.button({ }, 4, function () awful.util.spawn("amixer -q set Master 1dB+", false) end),
    awful.button({ }, 5, function () awful.util.spawn("amixer -q set Master 1dB-", false) end)
))

vicious.register(vollauncher, vicious.widgets.volume, function(widget, args)
	if  args[2] == "♩" then		-- MUTE
		vollauncher:set_image(beautiful.spkrmute)
	else 
		local vol = tonumber(args[1])
		if vol < 65 then
			vollauncher:set_image(beautiful.spkrlow)
		elseif vol < 85 then
			vollauncher:set_image(beautiful.spkrmed)
		else 
			vollauncher:set_image(beautiful.spkrhigh)
		end
		return args[1]
	end
end, 60, 'Master')




--{{---- Temperature ----------------------------

-- Icon
tempicon = wibox.widget.imagebox()
tempicon:set_image(beautiful.tempicon)
-- Widget
tempwidget = wibox.widget.textbox()
-- This is a custom widget. Configure it inside its definition file
vicious.register(tempwidget, vicious.widgets.sensors,"<span background='" .. beautiful.grey3 .. "' font='Terminus 12'> <span font='Terminus 9' color='" .. beautiful.wifont .. "'>$0 $1 $2 $3 </span></span>", 120)

--{{---- Battery  ----------------------------

-- Icon
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.batteryicon)
-- Widget
batwidget = wibox.widget.textbox()
vicious.register( batwidget, vicious.widgets.bat, "<span background='" .. beautiful.grey5 .. "' font='Terminus 12'><span font='" .. beautiful.font .. "' color='" .. beautiful.wifont .. "'>$1 $2% $3 </span></span>", 120, "BAT0" )


--{{---- Harddrive ------------------------------

-- Icon
hdicon = wibox.widget.imagebox()
hdicon:set_image(beautiful.hdicon)
-- Widget
hdwidget = wibox.widget.textbox()
vicious.register(hdwidget, vicious.widgets.fs, "<span background='" .. beautiful.grey2 .. "' font='Terminus 12'> <span font='" .. beautiful.font .. "' color='" .. beautiful.wifont .. "'>${/home avail_gb}GB </span></span>", 120)



--{{---- Memory ---------------------------------

-- Icon
memicon = wibox.widget.imagebox()
memicon:set_image(beautiful.ramicon)
-- Initialize widget
memwidget = wibox.widget.textbox()
-- Register widget
vicious.register(memwidget, vicious.widgets.mem, "<span background='" .. beautiful.grey4 .. "' font='Terminus 12'> <span font='" .. beautiful.font .. "' color='" .. beautiful.wifont .. "'>$1% </span></span>", 120)


--{{---- CPU ------------------------------------

-- Icon
cpuicon = wibox.widget.imagebox()
cpuicon:set_image(beautiful.cpuicon)
-- widget
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, "<span background='" .. beautiful.grey4 .. "' font='Terminus 12'> <span font='" .. beautiful.font .. "' color='" .. beautiful.wifont .. "'>$1% </span></span>")


--{{---- Wifi  ------------------------------------

neticon = wibox.widget.imagebox()
netwidget = wibox.widget.textbox()

neticon:set_image(beautiful.wifihigh)
vicious.register(netwidget, vicious.widgets.wifi, "<span background='" .. beautiful.grey5 .. "' font='Terminus 12'> <span font='" .. beautiful.font .. "' color='" .. beautiful.wifont .. "'>${link}% </span></span>", 120, 'wlan1')


vicious.register(neticon, vicious.widgets.wifi, function(widget, args)
    local sigstrength = tonumber(args["{link}"])
    if sigstrength > 64 then
        neticon:set_image(beautiful.wifihigh)
    elseif sigstrength > 40 and sigstrength < 65 then
        neticon:set_image(beautiful.wifimed)
    else
        neticon:set_image(beautiful.wifilow)
    end
end, 120, 'wlan1')

--{{---- Clock ----------------------------------

mytextclock = awful.widget.textclock("<span background='" .. beautiful.grey6 .. "' font='Terminus 12'> <span font='" .. beautiful.font .. "' color='" .. beautiful.clfont .. "'> %b %d, %H:%M </span></span>")



for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

--{{---- Panel -----------------------------
    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height="16" })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end

    -- Organize this how you'd like
    right_layout:add(fmlauncher)
    right_layout:add(vollauncher)
    -- Harddrive
    right_layout:add(div1)
    right_layout:add(hdicon)
    right_layout:add(hdwidget)
    -- Temperature
    right_layout:add(div2)
    right_layout:add(tempicon)
    right_layout:add(tempwidget)
    -- Memory/CPU
    right_layout:add(div3)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    -- Battery/wifi/clock
    right_layout:add(div4)
--    right_layout:add(baticon)
--    right_layout:add(batwidget)
    right_layout:add(neticon)
    right_layout:add(netwidget)
    right_layout:add(div5)
    right_layout:add(mytextclock)
    right_layout:add(div6)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end





--{{---- Mouse bindings -------------------------
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

--{{---- Key bindings ---------------------------
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "h",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "t",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, ",", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "t", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "h", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "t", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "g", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "p", awesome.restart),
    awful.key({ modkey, "Shift"   }, "'", awesome.quit),

    awful.key({ modkey,           }, "n",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "d",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "d",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "n",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "d",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "n",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "b", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "p",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "q",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "l", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "u",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "j",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "r",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "y",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "b",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

--{{---- Rules ----------------------------------
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}

--{{---- Signals --------------------------------
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
