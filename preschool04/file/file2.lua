

print "-------------------------------------------------------------------------\n\n"
print "���� ����2: ����         ------------------------------------------------\n\n"
print "-------------------------------------------------------------------------\n"

fr = io.open ("unit_lvl.csv","r")	-- ���� ������ �б� ���("r")�� ����
fw = io.open ("unit_lvl.txt","w")	-- ��� ������ ���� ���("w")�� ����


while true do
	local line = fr:read("*line") -- all line

	if nil == line then break end


	print(line .. "\n")

	fw:write(line .. "\n")

end


fr:close()
fw:close()

