#!/usr/bin/env bash

# install casks
brew install --cask ghostty
brew install --cask spotify
brew install --cask bitwarden
brew install --cask sonos
brew install --cask vlc
brew install --cask whatsapp
brew install --cask fantastical
brew install --cask firefox
echo "get the regsitration key for daisydisk"
brew install --cask daisydisk
brew install --cask discord
brew install --cask librewolf
brew install --cask plexamp
brew install --cask plex
brew install --cask wifiman
brew install --cask signal
brew install --cask utm
brew install --cask yubico-yubikey-manager
brew install --cask yubico-authenticator
brew install --cask sublime-text
brew install --cask raspberry-pi-imager
brew install --cask pastebot
brew install --cask orion
brew install --cask netnewswire
echo "get the regsitration key for istat-menus 5"
brew install --cask istat-menus@5
brew install --cask ungoogled-chromium

brew install --cask hammerspoon
cat >> ~/.hammerspoon/init.lua << EOF
-- Reload configuration on file changes
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.window.animationDuration = 0 -- Disable window animations for faster response
hs.application.enableSpotlightForNameSearches(true)

-- App configuration
APPS = {
  {shortcut = "1", name = "Safari"},
  {shortcut = "2", name = "Visual Studio Code"},
  {shortcut = "3", name = "Ghostty"},
  {shortcut = "4", name = "Notes"},
  {shortcut = "5", name = "Finder"},
  {shortcut = "6", name = "Spotify"},
  {shortcut = "7", name = "Reminders"},
  {shortcut = "8", name = "Fantastical"},
  {shortcut = "9", name = "Immich"},
  {shortcut = "0", name = "Photos"},
}

-- Bind application shortcuts
for _, app in ipairs(APPS) do
  hs.hotkey.bind("alt", app.shortcut, function()
	hs.application.launchOrFocus(app.name)
  end)
end

ALL_APPS = {
  {name = "Safari"},
  {name = "Visual Studio Code"},
  {name = "Ghostty"},
  {name = "Notes"},
  {name = "Finder"},
  {name = "Spotify"},
  {name = "Reminders"},
  {name = "Fantastical"},
  {name = "Immich"},
  {name = "Photos"},
  {name = "Signal"},
  {name = "Whatsapp"},
  {name = "Messages"},
  {name = "Home"},
  {name = "Bitwarden"},
}
-- Launch all applications in ALL_APPS
hs.hotkey.bind({"cmd", "ctrl"}, "S", function()
  for _, app in ipairs(ALL_APPS) do
    hs.application.launchOrFocus(app.name)
  end
end)

-- use WindowScreenLeftAndRight spoon to move windows between screens
-- https://www.hammerspoon.org/Spoons/WindowScreenLeftAndRight.html
hs.loadSpoon("WindowScreenLeftAndRight")
spoon.WindowScreenLeftAndRight.animationDuration = 0
hs.hotkey.bind({"cmd", "ctrl"}, "P", function()
  spoon.WindowScreenLeftAndRight:screen_left()
end)
hs.hotkey.bind({"cmd", "ctrl"}, "N", function()
  spoon.WindowScreenLeftAndRight:screen_right()
end)

-- If we use margins, we need to set them here
-- X_Y_OFFSET = 8 is the offset from the top left corner of the screen
-- WIN_OFFSET = 16 is the offset from the right and bottom edges of the screen
X_Y_OFFSET = 0
WIN_OFFSET = 0

hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + X_Y_OFFSET
  f.w = max.w / 2 - WIN_OFFSET
  f.h = max.h - WIN_OFFSET
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + X_Y_OFFSET
  f.y = max.y + X_Y_OFFSET
  f.w = max.w / 2 - WIN_OFFSET
  f.h = max.h - WIN_OFFSET
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + X_Y_OFFSET
  f.y = max.y + X_Y_OFFSET
  f.w = max.w - WIN_OFFSET
  f.h = max.h / 2 - WIN_OFFSET
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + X_Y_OFFSET
  f.y = max.y + (max.h / 2) + X_Y_OFFSET
  f.w = max.w - WIN_OFFSET
  f.h = max.h / 2 - WIN_OFFSET
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + X_Y_OFFSET
  f.y = max.y + X_Y_OFFSET
  f.w = max.w - WIN_OFFSET
  f.h = max.h - WIN_OFFSET
  win:setFrame(f)
end)

-- Move focused window to the top left corner
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + X_Y_OFFSET
  f.y = max.y + X_Y_OFFSET
  f.w = max.w / 2 - WIN_OFFSET
  f.h = max.h  / 2- WIN_OFFSET
  win:setFrame(f)
end)
-- Move focused window to the top right corner
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + X_Y_OFFSET
  f.w = max.w - WIN_OFFSET
  f.h = max.h / 2 - WIN_OFFSET
  win:setFrame(f)
end)

-- Move focused window to the bottom right corner
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2) + X_Y_OFFSET
  f.w = max.w - WIN_OFFSET
  f.h = max.h / 2 - WIN_OFFSET
  win:setFrame(f)
end)

-- Move focused window to the bottom left corner
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + X_Y_OFFSET
  f.y = max.y + (max.h / 2) + X_Y_OFFSET
  f.w = max.w / 2 - WIN_OFFSET
  f.h = max.h / 2 - WIN_OFFSET
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  local laptopScreen = "Built-in Retina Display"
  local windowLayout = {
      {"Code", nil, laptopScreen, hs.layout.left75, nil, nil},
      {"Ghostty", nil, laptopScreen, hs.layout.right25, nil, nil},
      {"Safari", nil, laptopScreen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "2", function()
  local screen = "Studio Display"
  local windowLayout = {
      {"Code", nil, screen, hs.layout.left75, nil, nil},
      {"Ghostty", nil, screen, hs.layout.right25, nil, nil},
      {"Safari", nil, screen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "3", function()
  local screen = "External Display"
  local windowLayout = {
      {"Spotify", nil, screen, hs.layout.left75, nil, nil},
      {"Notes", nil, screen, hs.layout.right25, nil, nil},
      {"Reminders", nil, screen, hs.layout.maximized, nil, nil},
  }
  hs.layout.apply(windowLayout)
end)
EOF