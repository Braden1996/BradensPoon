# 🧙‍ BradensPoon - Hammerspoon Configuration

## ☄️ Installation
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
7. Get the directory path of where you installed BradensPoon, e.g. run `pwd` after step 4.
8. Paste the following (into `~/.hammerspoon/init.lua`): 
```lua
local yourPath = '/Users/braden/Development/Rice/BradensPoon/'
package.path = yourPath .. '?.lua;' .. package.path;
require('init')
```
8. Replace the value of yourPath (e.g. `/Users/braden/Development/Rice/BradensPoon/`) with your directory path, as obtained in step 7. (Don't forget the trailing `/`!)
9. Reload your Hammerspoon config.

## 👨🏼‍💻 Development
Interested in fixing up some bugs, or developing awesome new features? Here are a few notes to help get you started:

<details>
  <summary>Testing</summary>
  <p>
As a standard, we try to maintain a strong coverage of tests for all code which isn't strickly coupled with Hammerspoon. To get up and running with tests, follow the steps below:

1. Install [Busted](https://github.com/bluebird75/luaunit), the unit-testing framework of choice, globally via [Luarocks](https://luarocks.org/):
```sh
luarocks install -busted
```
2. Execute all our tests:
```sh
busted -v
```
  </p>
</details>
