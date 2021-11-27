local switch, default = require "."()
local luaunit = require "luaunit"

TestSwitch = {
	["test: Statement"] = function ()
		local var
		switch (2) {
			[1] = function ()
				var = 1
			end;
			[2] = function ()
				var = 2
			end;
			[3] = function ()
				var = 3
			end;
		}
		luaunit.assertEquals(var, 2)
	end;

	["test: Multiple case list"] = function ()
		local var
		local val = "c"
		switch (val) {
			[{"a", "b"}] = function ()
				var = "a, b"
			end;
			[{"c", "d"}] = function ()
				var = val
			end;
			e = function ()
				var = "e"
			end;
		}
		luaunit.assertEquals(var, "c")
	end;

	["test: Expression"] = function ()
		local var = switch "b" {
			a = 1;
			b = 2;
			c = 3;
		}
		luaunit.assertEquals(var, 2)
	end;

	["test: Default branch"] = function ()
		local var
		switch ("c") {
			a = function ()
				var = "a"
			end;
			b = function ()
				var = "b"
			end;
			[default] = function ()
				var = "c"
			end;
		}
		luaunit.assertEquals(var, "c")
	end;

	["test: Not matching any branch"] = function ()
		local var = 0
		switch ("d") {
			a = function ()
				var = "a"
			end;
		}
		luaunit.assertEquals(var, 0)
	end;
}

os.exit(luaunit.run())
