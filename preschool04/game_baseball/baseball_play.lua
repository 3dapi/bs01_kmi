
-- 
-- 숫자 야구 play phase
--


m_val    = {0, 0, 0}
m_success= 0

function GamePlay()

	m_val     = GenerateVal()
	g_count   = 15
	m_success = 0

	--print("val:",  m_val[1],  m_val[2],  m_val[3], "\n")

	while 0 < g_count and 0 == m_success do

		local i = {}

		i = io.read()


		if nil ~= i then

			if	'q' == i then
				g_count =0
				break
			end

			local num = {}
			num = StringParse(i)

			if 2 >= #num then
				print "입력한 숫자의 길이가 작습니다.\n"
			else

				if	num[1] == num[2] or
					num[2] == num[3] or
					num[3] == num[1] then

					print "숫자가 중복됨\n"
				else
					PlayBaseball(num)
				end

			end
		end -- if

	end -- while


	if 0 < m_success then
		print "승리!! :-)\n"

	elseif 0 > m_success then
		print "패배!! -:-<\n"
	end


	g_gamePhase = GAMEPHASE_END

end


function StringParse(str)
	local i=1
	local n={}
	
	for w in string.gmatch(str, "%S+") do
		n[i] = tonumber(w)
		--print("숫자:",  n[i], "\n")
		i = i + 1
	end

	return n
end


function PlayBaseball(num)
	local strike = 0
	local ball   = 0
	local i = 0
	local j = 0

	for i=1, 3 do
		if m_val[i] == num[i]  then
			strike = strike +1
		end
	end

	for i = 1, 3 do
		for j = 1, 3 do
			if i ~= j and
				m_val[i] == num[j]  then
				ball = ball +1
			end
		end
	end


	-- play 판정
	g_count = g_count - 1

	if 0 == g_count and 3 ~= strike then
		m_success = -1
	end

	if 3 == strike then
		m_success = 1
	end


	-- play result printing
	local st
	st = string.format("=> %d %d %d : %d-S %d-B,    Remain Count: %d\n", num[1], num[2], num[3], strike, ball, g_count);
	print(st);

end

function GenerateVal()
	local i=1
	local n={}
	
	n[1] = math.random(0, 9)


	while true do
		n[2] = math.random(0, 9)

		if n[2] ~= n[1] then
			break
		end
	end


	while true do
		n[3] = math.random(0, 9)
		if n[3] ~= n[1] and n[3] ~= n[2] then
			break
		end
	end

	--print("val:",  n[1],  n[2],  n[3], "\n")

	return n
end

--GamePlay()


