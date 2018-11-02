

print "-------------------------------------------------------------------------\n\n"
print "파일 연습2: 쓰기         ------------------------------------------------\n\n"
print "-------------------------------------------------------------------------\n"

fr = io.open ("unit_lvl.csv","r")	-- 원시 파일을 읽기 모드("r")로 열기
fw = io.open ("unit_lvl.txt","w")	-- 대상 파일을 쓰기 모드("w")로 열기


while true do
	local line = fr:read("*line") -- all line

	if nil == line then break end


	print(line .. "\n")

	fw:write(line .. "\n")

end


fr:close()
fw:close()

