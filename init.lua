local function default() end

local function switch(var)
	-- TODO: Can we avoid recreating new function each time?
	return function (map)
		for case, value in pairs(map) do
			local matches = false
			if type(case) == "table" then
				for _, v in pairs(case) do
					if v == var then
						matches = true
						break
					end
				end
			else
				matches = var == case
			end
			if matches then
				if type(value) == "function" then
					return value()
				else
					return value
				end
			end
		end
		if map[default] then
			local defaultvalue = map[default]
			if type(defaultvalue) == "function" then
				return defaultvalue()
			else
				return defaultvalue
			end
		end
	end
end

return function ()
	return switch, default
end
