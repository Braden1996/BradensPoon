# 🧙‍ BradensPoon - Hammerspoon Configuration

## 👨🏼‍💻 Installation
Getting up and running takes less than a minute!

1. Install [Hammerspoon](http://www.hammerspoon.org/):
```sh
brew cask install hammerspoon
```
2. Install [Luarocks](https://luarocks.org/) package manager:
```sh
brew install lua
```
3. Clone this repository:
```sh
cd ~/Development/Rice
git clone https://github.com/Braden1996/BradensPoon.git
```
4. Install Lua dependencies locally via [Luarocks](https://luarocks.org/):
```sh
cd BradensPoon
luarocks install --tree lua_modules penlight
```
5. Run `Hammerspoon.app` and follow the prompts to enable _Accessibility_ access for the app.
6. Click on the Hammerspoon menu bar icon 🔨 and choose `Open Config` from the menu.
7. Paste the following (into `~/.hammerspoon/init.lua`):
```lua
package.path = '/Users/braden/Development/Rice/BradensPoon/?.lua' .. package.path;
require('init')
```
8. Reload your Hammerspoon config.
