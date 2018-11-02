

function InputControl_1p()

	--마우스클릭체크(16칸)
--[[	for i=1, 16 do
		
		local x, y = GetMod(i, 4)
		if (M.lb == 2) and InRect(60 + x*100, y*80, 60, 80) then
			clickslot = i
			break
		end
	end
--]]

	if not(tmDelay.on) then		
		local pos = 0
		while true do
			pos = math.random(1, 16)
			if not(tmShim[pos].on) then	--해당자리의 타이머가 가동중이 아닐때만
				break
			end
		end
		slotstate[pos] = 0				--클릭한 자리의 카드를 뒤집는다
		BeginTimer(tmShim[pos])			--해당자리(카드)의 타이머를 가동한다
		BeginTimer(tmDelay)
	end

	--타이머처리부분
	for i=1, 16 do
		if not(tmShim[i].on) then	--꺼져있다면
			slotstate[i] = 1	--카드는 뒷면상태로
		end
	end
end

--게임페이즈_2에서 처리할 마우스 콘트롤을 입력한다
------------------------------------------
function InputControl_2p()
	
end

--게임페이즈_3에서 처리할 마우스 콘트롤을 입력한다
------------------------------------------
function InputControl_3p()

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
