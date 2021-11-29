# Switch expression statement for Lua <img src="https://img.shields.io/github/license/stein197/lua-switch"/> <img src="https://img.shields.io/github/v/tag/stein197/lua-switch?label=Version"/> <img src="https://img.shields.io/luarocks/v/stein197/lua-switch"/>

This package provides simple function named "switch" which could be used to emulate switch statement which does not exist in Lua but does in other languages. It  can handle default fallback.

## Installation
Via LuaRocks:
```
luarocks install lua-switch
```
Or just download and require `init.lua` file from this repo.

## Usage
Just require it in the code like in the example below:
```lua
local switch, default = require "lua-switch"()
local var = "b"
switch (var) {
	a = 1; -- Use string key
	[1] = 2; -- Or numeric one
	[{"b", "c"}] = function () -- Use multiple values. Mostly functions will be used as code block
		print "Switch!" -- Prints "Switch!"
	end;
	[default] = function () -- Use default fallback
		var = 12
	end
}
-- Or even use it as expression
local var = switch "b" {
	a = 1;
	b = 2;
	c = 3;
	d = function ()
		return 4; -- If you wish you can also use function blocks and return values from them
	end;
}
print(var) -- Prints "2"
```

## Testing
Install luaunit package:
```
luarocks install luaunit
```
Then run from the console:
```
lua test.lua
```
Make sure that `luaunit` package can be required using `package.path` variable.
