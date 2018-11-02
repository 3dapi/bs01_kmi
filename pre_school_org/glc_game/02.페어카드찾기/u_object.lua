
function DrawObject_1p()
		
	for i=1, 16 do
		local x, y = GetMod(i, 4)		--모듈의 x, y를 추출하는 함수

		if (slotstate[i] == 0) then		--카드 앞면일때
			Draw(slot[i]+1, 60 + x*100, y*80)
		else							--카드 뒷면일때
			Draw(10,		60 + x*100, y*80)
		end
	end

	if (gameresult == 1) then	--게임을 클리어했다면
		Draw(12, 112, 128)
	end

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