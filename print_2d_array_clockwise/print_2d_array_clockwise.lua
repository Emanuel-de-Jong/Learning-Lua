function print_2d_array_clockwise(arr)
	local length = #arr[1]
	local height = #arr

	local result = {}
	local resLength = 0
	local resLengthGoal = length * height

	local direction = 0

	local right = length
	local bottom = height
	local left = 1
	local top = 1

	while resLength < resLengthGoal do
		if direction == 0 then
			for j = left, right do
				resLength = resLength + 1
				result[resLength] = arr[top][j]
			end
			top = top + 1
		elseif direction == 1 then
			for j = top, bottom do
				resLength = resLength + 1
				result[resLength] = arr[j][right]
			end
			right = right - 1
		elseif direction == 2 then
			for j = right, left, -1 do
				resLength = resLength + 1
				result[resLength] = arr[bottom][j]
			end
			bottom = bottom - 1
		else
			for j = bottom, top, -1 do
				resLength = resLength + 1
				result[resLength] = arr[j][left]
			end
			left = left + 1
		end

		direction = (direction + 1) % 4
	end

	print(table.concat(result, ", "))
end
