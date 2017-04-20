local caffeine = hs.menubar.new()
local grid = require "hs.grid"
local mod = {"cmd", "ctrl"}
local modshift = {"cmd", "ctrl", "shift"}
--hs.window.animationDuration = 0
grid.GRIDHEIGHT = 3
grid.GRIDWIDTH = 7
grid.MARGINX = 10
grid.MARGINY = 10
--
local function caffeineDisplay(state)
    if state then caffeine:setTitle("AWAKE")
    else caffeine:setTitle("SLEEPY") end
end
local function caffeineClicked()
    caffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end
--
local function msg(t, m)
    hs.notify.new({title=t, informativeText=m}):send()
end
local function restart()
    msg("Hammerspoon", "Reloaded")
    hs.reload()
end
--
hs.hotkey.bind(mod, "n", restart)
hs.hotkey.bind(mod, "UP", grid.pushWindowUp)
hs.hotkey.bind(mod, "DOWN", grid.pushWindowDown)
hs.hotkey.bind(mod, "LEFT", grid.pushWindowLeft)
hs.hotkey.bind(mod, "RIGHT", grid.pushWindowRight)
hs.hotkey.bind(modshift, "UP",grid.resizeWindowShorter)
hs.hotkey.bind(modshift, "DOWN", grid.resizeWindowTaller)
hs.hotkey.bind(modshift, "LEFT", grid.resizeWindowThinner)
hs.hotkey.bind(modshift, "RIGHT", grid.resizeWindowWider)
--
if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    caffeineDisplay(hs.caffeinate.get("displayIdle"))
end