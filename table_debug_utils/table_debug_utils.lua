function print_t(t)
	print(
		("-"):rep(50) ..
		"\nsize: " .. get_s(t) ..
		"\n" .. ("-"):rep(50) ..
		"\ndump: \n" ..
		get_d(t) ..
		"\n" .. ("-"):rep(50)
	)
end

function print_s(t)
	print(
		("-"):rep(50) ..
		"\nsize: " .. get_s(t) ..
		"\n" .. ("-"):rep(50)
	)
end

function print_d(t)
	print(
		("-"):rep(50) ..
		"\ndump: \n" ..
		get_d(t) ..
		"\n" .. ("-"):rep(50)
	)
end

function get_s(t)
	local c = 0
	for _, v in pairs(t) do
		c = c + 1
		if type(v) == "table" then c = c + get_s(v) end
	end
	return c
end

tableStrings = {}
function get_d(o, r)
	if not r then
		tableStrings = {}
		r = 0
	end
	if type(o) == "table" then
		local i = 0
		local e = 0
		for _ in pairs(o) do e = e + 1 end
		local s = "{ -- " .. tostring(o) .. "\n"
		for k, v in pairs(o) do
			if type(k) ~= "number" then k = '"'..k..'"' end
			if type(v) == "table" then
				local ts = tostring(v)
				if tableStrings[ts] then
					v = '"'..ts..'"'
				else
					tableStrings[ts] = true
					v = get_d(v, r + 1)
				end
			else
				v = get_d(v, r + 1)
			end
			s = s .. ("\t"):rep(r) .. "\t["..k.."] = " .. v
			i = i + 1
			if i ~= e then s = s .. "," end
			s = s .. "\n"
		end
		return s .. ("\t"):rep(r) .. "}"
	else
		return tostring(o)
	end
end
