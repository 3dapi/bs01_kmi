

print "-------------------------------------------------------------------------\n\n"
print "파일 연습3: 패턴으로 읽기        ----------------------------------------\n\n"
print "-------------------------------------------------------------------------\n"

fr = io.open ("unit_lvl.tab","r")	-- 파일 핸들 얻기

--[[
line_count = 0						-- line count

while 2 > line_count do
	local line = fr:read("*line")	-- 한 줄 읽기
	line_count = line_count + 1
	print(line .. "\n")
end

print "-------------------------------------------------------------------------\n"
--]]


while true do
	local line = fr:read("*line")	-- 한 줄 읽기

	if nil == line then break end

	--print(line .. "\n")

	local v ={}
	local i = 1
	--local pattern = "([A-Za-z0-9%.]+)"

	local pattern = "([^,^\t]+)"

	for w in string.gmatch(line, pattern) do
		v[i] = w; i = i + 1
	end


	--local t = string.format("(%d)", i)
	--print(t )
			
	for i=1, #v do
		print(v[i])
		print(" ")
	end
	print("\n")

	v = nil

	print "-------------------------------------------------------------------------\n"

end


fr:close()

