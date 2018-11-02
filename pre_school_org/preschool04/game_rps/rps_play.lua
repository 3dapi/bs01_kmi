-- 
-- 가위 바위 보 게임
--


score = 0		-- game score
GamePhase = 1	-- game phase

math.randomseed(os.time() )



function GameBegin()
	print "가위바위 보 게임-----------------\n"
	print "종료는 'q'를 입력하세요\n"

	print "바위: 1, 가위: 2, 보: 3\n"

	score = 0
	GamePhase = 2
end


function GamePlay()


	while( true) do

		i = io.read()

		if 'q' == i then
			break
		end


		d = math.random(3)


		-- 바위
		if i == '1' then
			if d== 1 then
				print "[바위(나) - 바위(컴)]: 비겼습니다.\n다시합니다\n"

			elseif d == 2 then
				print "[바위(나) - 가위(컴)]: 당신이 이겼습니다.\n"
				score = score + 1000
				print("점수: " ..  score .. "\n")
			else
				print "[바위(나) - 보(컴)]: 졌군요. 안됬습니다.\n"
				break
			end

		-- 가위
		elseif i == '2' then
			if d== 1 then
				print "[가위(나) - 바위(컴)]: 졌군요. 안됬습니다.\n"
				break

			elseif d == 2 then
				print "[가위(나) - 가위(컴)]: 비겼습니다.\n다시합니다.\n"
			else
				print "[가위(나) - 보(컴)]: 당신이 이겼습니다.\n"
				score = score + 1000
				print("점수: " ..  score .. "\n")
			end

		-- 보
		elseif i == '3' then
			if d== 1 then
				print "[보(나) - 바위(컴)]: 당신이 이겼습니다.\n"
				score = score + 1000
				print("점수: " ..  score .. "\n")

			elseif d == 2 then
				print "[보(나) - 가위(컴)]: 졌군요. 안됬습니다.\n"
				break
			else
				print "[보(나) - 보(컴)]: 비겼습니다.\n다시합니다.\n"
			end
		else

			print "잘못 입력했습니다. 다시하세요.\n"
		end

	end


	GamePhase = 3

end





function GameEnd()
	print("당신의 게임 점수: " ..  score .. "\n")

	print("게임 재시작: r, 나가기 q\n")

	while( true) do

		i = io.read()

		if 'q' == i then
			GamePhase = 4
			print("프로그램 종료     ----------------------------\n")
			break

		elseif 'r' == i then
			GamePhase = 1
			os.execute("cls")
			print("게임 다시 시작    ----------------------------\n")
			break

		else
			print("잘못된 입력\n")
		end


	end

	
end


