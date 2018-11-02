-- 
-- tree
--

print " ---------------  -----------------\n"


t_begin = 1
t_end   = 50


-- simple
----[[
for i= t_begin, t_end, 1 do

	-- print '*'

	for j=1, i, 1 do
		print("*")
	end

	print("\n")
end -- for
--]]


-- sin tree
--[[
for i= t_begin, t_end, 1 do

	-- print '*'

	r_end = 12 * (1.1 + math.sin(i * 3.14159/10) )

	for j=1, r_end, 1 do
		print("*")
	end

	print("\n")
end -- for

print("\n")
--]]




-- christmas tree
--[[
for i= t_begin, t_end, 1 do

	-- print '*'

	for j=t_end, i, -1 do
		print(" ")
	end

	for j=1, 2*i-1, 1 do
		print("*")
	end

	print("\n")
end -- for

print("\n")
--]]

