-- 
-- 홀 짝 게임
--

print "홀 짝 게임-----------------\n"
print "종료는 'q'를 입력하세요\n"

print "홀: 1, 짝: 2\n"


score = 0		-- game score

math.randomseed(os.time() )


while( true) do

	i = io.read()

	if nil ~= i then


		if 'q' == i then
			break
		end


		d = math.random(2)


		-- 홀
		if i == '1' then
			if d== 1 then
				print "[홀(나) - 홀(컴)]: 당신이 이겼습니다.\n"
				score = score + 1000
				print("점수: " ..  score .. "\n")
			else
				print "[홀(나) - 짝(컴)]: 졌군요. 안됬습니다.\n"
				break
			end

		-- 짝
		elseif i == '2' then
			if d== 2 then
				print "[짝(나) - 짝(컴)]: 당신이 이겼습니다.\n"
				score = score + 1000
				print("점수: " ..  score .. "\n")
			else
				print "[홀(나) - 짝(컴)]: 졌군요. 안됬습니다.\n"
				break
			end

		-- Input Error
		else

			print "잘못 입력했습니다. 다시하세요.\n"
		end

	end --if
end -- while


print("최종 점수: " ..  score .. "\n")
print("프로그램 종료----------------------------\n")

