# qutebrowser Settings

c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'


c.aliases = {
    'w': 'session-save',
    'q': 'quit',
    'wq': 'quit --save'
}

config.bind('gi', 'hint inputs')
config.bind('S', 'set-cmd-text -s :open -t g!')

# Navigation
config.bind('h', 'tab-prev')
config.bind('l', 'tab-next')
config.bind('J', 'scroll-page 0 0.6')
config.bind('K', 'scroll-page 0 -0.6')

# Load settings from autoconfig.yml done via the GUI
# Only include platform specific settings, which are loaded at the end
config.load_autoconfig()

c.content.plugins = True
