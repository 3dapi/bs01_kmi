
-- 
-- ���� �߱� end phase
--


function GameEnd()

	if 0 < g_count then
		g_score = g_count * 30000
	end

	print("����� ���� ����: " .. g_score .. "\n")

	print("���� �����: r, ������ q\n")

	while( true) do

		i = io.read()

		if 'q' == i then
			g_gamePhase = GAMEPHASE_EXIT
			print("���α׷� ����     ----------------------------\n")
			break

		elseif 'r' == i then
			g_gamePhase = GAMEPHASE_BEGIN
			os.execute("cls")
			print("���� �ٽ� ����    ----------------------------\n")
			break

		else
			print("�߸��� �Է�\n")
		end
	end -- while

end

