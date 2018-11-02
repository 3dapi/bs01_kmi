-- 
-- 9 x 9 time table
--

print "9 x 9 ´Ü-----------------\n"


for i= 2, 9, 1 do

	print(i)
	print(" ´Ü---------------------------------------\n")

	for j = 2, 9, 1 do
		print( i, " x ",  j , " = ", i*j, "\n")

		--print( i .. " x " ..  j ..  " = " .. i*j .. "\n")
		--print( i); print( " x "); print(j); print(" = "); print(i*j, "\n")
	end --for
end -- for



