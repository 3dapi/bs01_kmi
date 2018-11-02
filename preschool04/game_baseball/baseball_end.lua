
-- 
-- 숫자 야구 end phase
--


function GameEnd()

	if 0 < g_count then
		g_score = g_count * 30000
	end

	print("당신의 게임 점수: " .. g_score .. "\n")

	print("게임 재시작: r, 나가기 q\n")

	while( true) do

		i = io.read()

		if 'q' == i then
			g_gamePhase = GAMEPHASE_EXIT
			print("프로그램 종료     ----------------------------\n")
			break

		elseif 'r' == i then
			g_gamePhase = GAMEPHASE_BEGIN
			os.execute("cls")
			print("게임 다시 시작    ----------------------------\n")
			break

		else
			print("잘못된 입력\n")
		end
	end -- while

end

