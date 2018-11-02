
function DrawObject_1p()
		
	--게임시작전(1)-------------------------------------------------
	---------------------------------------------------------------
	if (g_state == 1) then

		Draw(9, 112, 128)	--"게임스타트!"출력

	--게임플레이(2)-------------------------------------------------
	---------------------------------------------------------------
	elseif (g_state == 2) then
				
		if (tmShim.on) then	--타이머tmShim가 가동중인가

			if (clickcheck == 1) then		--유저가 클릭한 지점이 맞음
				Draw(3, mpx-64, mpy-16)		--"correct!"출력		
			elseif (clickcheck == 2) then	--유저가 클릭한 지점이 맞지않음
				Draw(4, mpx-64, mpy-16)		--"wrong!"출력
			end
		end

	--게임결과(3)-------------------------------------------------
	---------------------------------------------------------------
	elseif (g_state == 3) then
		
		if (g_result == 1) then	--게임클리어라면
			Draw(6, 112, 128)	--"clear!"출력
		elseif (g_result == 2) then	--게임오버라면
			Draw(7, 112, 128)	--"gameover!"출력
		end

	end

	--맞춘상태의 점 5개 그리기
	for i = 1, 9 do
		if (pt_open[i]) then		--각 점이 맞춘상태인가
			Draw(5, pt_x[i]-16, pt_y[i]-16)
		end
	end

	--맞춘 점갯수(최대 5)
	for i = 1, correctcount do
		Draw(10, 196 + (i-1)*22, 20)
	end
	
	--텍스트(폰트)를 출력
	SetFont(FT12, 60 - tmLimit.ct, 430, 20)
end


function DrawObject_2p()
	--게임페이즈_2에서 처리할 오브젝트 리소스를 입력한다
	------------------------------------------

end

function DrawObject_3p()
	--게임페이즈_3에서 처리할 오브젝트 리소스를 입력한다
	------------------------------------------

end

function DrawObject_4p()

end

function DrawObject_5p()

end

function DrawObject_6p()

end

function DrawObject_7p()

end

function DrawObject_8p()

end

function DrawObject_9p()

end