

function InputControl_1p()

	if not(tmLimit.on) then	--타이머가 꺼졌을때(1초경과시)
		
		for i=1, 5 do
			if (ball[i] == 1) then		--활성화상태인 볼만 좌표업데이트
				circ_x[i] = circ_x[i] + addx[i]	--좌우측으로 1px 이동해라
				circ_y[i] = circ_y[i] + addy[i]	--상하측으로 1px 이동해라

				if (circ_x[i] >= 480 - 16) or (circ_x[i] <= 0) then
					addx[i] = -addx[i]
				end
				if (circ_y[i] <= 0) or (circ_y[i] >= 320 - 16) then
					addy[i] = -addy[i]
				end
			end
		end

		BeginTimer(tmLimit)
	end
	
	
	for i=1, 5 do
		
		if PointInCircle(hole_x+16, hole_y+16, circ_x[i]+8, circ_y[i]+8, 8) then
			--통과한 볼을 비활성화시킨다
			ball[i] = 0
		end
	end

	--게임클리어체크
	local ballct = 0	--화면에 남은공
	for i=1, 5 do
		if (ball[i] == 1) then
			ballct = ballct + 1
		end
	end
	--클리어(화면에 남은공이 3이하 일때)
	if (ballct <= 0) then
		gameresult = 1
	end

	if (M.lb == 2) then
		--마우스포인터의 좌표를 홀좌표로 이식
		hole_x, hole_y = M.px - 16, M.py - 16
	end

end


function InputControl_2p()
	--게임페이즈_2에서 처리할 마우스 콘트롤을 입력한다
	------------------------------------------

end

function InputControl_3p()
	--게임페이즈_3에서 처리할 마우스 콘트롤을 입력한다
	------------------------------------------

end

function InputControl_4p()

end

function InputControl_5p()

end

function InputControl_6p()

end

function InputControl_7p()

end

function InputControl_8p()

end

function InputControl_9p()

end
