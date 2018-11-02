
function InitVal()

--게임에 사용되는 변수를 설정한다
--------------------------------------------

	ResetData()
	
end


--게임재시작시에 리셋되어야 할 데이터(변수)들
function ResetData()
	
	click = 0
	
	--128지름 원의 현재 좌표
	ball = {1, 1, 1, 1, 1}		--볼의 활성화상태를 저장하는 변수(1;활성화 0;비활성)
	circ_x = {10, 20, 30, 40, 50}
	circ_y = {10, 10, 10, 10, 10}
	addx = {2, -4, -2, -4, 4}
	addy = {2, -2, 4, 4, -4}

	--홀(hole)좌표
	hole_x = 128
	hole_y = 128

	gameresult = 0	--게임결과값(1;clear / 2;over)
	
end