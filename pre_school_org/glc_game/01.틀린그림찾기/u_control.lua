

function InputControl_1p()

	--게임시작전상태(1)	; 
	if (g_state == 1) then
		 
		if (M.lb == 2) then	--마우스좌클릭하면
			
			BeginTimer(tmLimit)	--제한시간용 타이머 가동
			g_state = 2		--게임플레이상태(2)로 전환
		end


	--게임플레이상태(2) ; 마우스클릭체크(틀린곳 5지점을 제대로 클릭했는지)
	elseif (g_state == 2) then
		
		if (M.lb == 2) then	--유저가 화면상에 어느부분을 클릭했음

			for i = 1, 9 do
				if InCircle(pt_x[i], pt_y[i], 20) and not(pt_open[i])then	--클릭한 지점이 틀린곳지점이 맞음(+이미맞춘점이 아님)
					
					pt_open[i] = true				--해당지점을 맞춘상태로 변환
					correctcount = correctcount + 1	--맞춘점갯수 +1증가
					clickcheck = 1; break
				else								--클릭한 지점이 틀린곳지점이 아님
					clickcheck = 2
				end
			end
			
			mpx, mpy = M.px, M.py	--현재클릭한 좌표값을 mpx, mpy에 저장
			clickcount = clickcount + 1	--클릭횟수 +1 증가
			
			--타이머가 켜져있는 중이라면 리셋후 다시 시작한다
			if (tmShim.on) then
				ResetTimer(tmShim)
			end
			BeginTimer(tmShim)	----tmShim타이머를 켠다
		end

		--게임클리어조건이 성립되었나(9 맞춤)
		if (correctcount == 9) then
			PauseTimer(tmLimit)
			g_result = 1 ; g_state = 3	--게임결과를 클리어상태로; 게임상태를 결과상태로
		
		--게임오버조건이 성립되었나(제한시간이 0이 되었음; tmLimit 꺼졌음)
		elseif not(tmLimit.on) then
			g_result = 2 ; g_state = 3	--게임결과를 게임오버상태; 게임상태를 결과상태
		end


	--게임결과상태(3) ; 게임종료
	elseif (g_state == 3) then
		
		if (M.lb == 2) then
			
			ResetTimer(tmLimit)
			ResetData()
		end

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
