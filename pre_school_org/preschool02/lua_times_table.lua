-- 
-- 9 x 9 time table
--

print "9 x 9 ��-----------------\n"


for i= 2, 9, 1 do

	print(i)
	print(" ��---------------------------------------\n")

	for j = 2, 9, 1 do
		print( i, " x ",  j , " = ", i*j, "\n")

		--print( i .. " x " ..  j ..  " = " .. i*j .. "\n")
		--print( i); print( " x "); print(j); print(" = "); print(i*j, "\n")
	end --for
end -- for



