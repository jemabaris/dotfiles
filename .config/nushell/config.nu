# config.nu
#
# Installed by:
# version = "0.111.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.keybindings ++= [
    {
        name: reload-config
        modifier: none
        keycode: f5
        mode: emacs
        event: {
            send: executehostcommand
            cmd: "source ~/.config/nushell/config.nu; source ~/.config/nushell/env.nu; print 'Config reloaded!'"
        }
    }
    {
        name: reload-config
        modifier: none
        keycode: f5
        mode: vi_insert
        event: {
            send: executehostcommand
            cmd: "source ~/.config/nushell/config.nu; source ~/.config/nushell/env.nu; print 'Config reloaded!'"
        }
    }
    {
        name: reload-config
        modifier: none
        keycode: f5
        mode: vi_normal
        event: {
            send: executehostcommand
            cmd: "source ~/.config/nushell/config.nu; source ~/.config/nushell/env.nu; print 'Config reloaded!'"
        }
    }
]


print "CONFIG LOADED"


#############
## Nushell ##
#############
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
