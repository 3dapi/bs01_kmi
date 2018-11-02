
function DrawObject_1p()
		
	Draw(1, 0, 0)

	Draw(8, hole_x, hole_y)		--홀(128+16, 128+16)
	
	if (gameresult == 0) then
		for i=1, 5 do
			--활성화상태인 볼만 그린다
			if (ball[i] == 1) then
				Draw(7, circ_x[i], circ_y[i])	--원
			end
		end
	end

	if (gameresult == 1) then
		Draw(4, 112, 128)
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