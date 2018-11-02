

print "-------------------------------------------------------------------------\n\n"
print "파일 연습4: csv 파일 읽기       ----------------------------------------\n\n"
print "-------------------------------------------------------------------------\n"

fr = io.open ("unit_lvl.csv","r")

--[[
count = 0

while 2 > count do
	local line = fr:read("*line")
	count = count + 1
	print(line .. "\n")
end

count = nil

print "-------------------------------------------------------------------------\n"
--]]

while true do
	local line = fr:read("*line")					-- 한 줄 읽기

	if nil == line then break end


	local v
	local comma = 0 ; local n1 = 1; local n2 = 1


	print("(".. #line .. ")" .. line .. "\n")
	print("comma: ")
	while true do
		comma = string.find(line, "[,\t]", comma+1)	--"," "\t"의 시작 위치를 찾아 저장

		if comma == nil then
			n2 = #line
			s = string.sub(line, n1, n2)
			print(s)
			break
		end

		--print(comma .. ":")

		n2 = comma -1								-- 쉼표 이전까지 읽을 수 있도록 감소

		s = string.sub(line, n1, n2)

		n1 = comma +1								-- 쉼표 다음부터 읽을 수 있도록 증가

		print(s .. " ")

	end

	print("\n")
	print "-------------------------------------------------------------------------\n"

end

fr:close()

