local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'kitty tmux',
    rofi = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"',
    ssh = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show ssh -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -ssh-command "kitty -- kitty +kitten ssh {host}"',
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    mail = 'birdtray -t',
    screenshot = '~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = '~/.config/awesome/configuration/utils/screenshot --delayed -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'firefox',
    editor = 'cherrytree', -- gui text editor
    social = 'signal-desktop',
	game = 'lutris',
    vm = 'virt-manager',
    files = 'dolphin',
    music = 'spotify'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'nm-applet --indicator', -- wifi
    --'blueberry-tray', -- Bluetooth tray icon
    --'xfce4-power-manager', -- Power manager
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    --'scream-start', -- scream audio sink
	--'pasystray', -- Pulseaudio systray
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'blueman-tray', -- bluetooth tray
    'birdtray', -- Email client
    'udiskie -s', -- Automount
	'discord --start-minimized', -- Discord
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
