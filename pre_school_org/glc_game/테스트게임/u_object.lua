
function DrawObject_1p()
		
	Draw(1, 0, 0)

	Draw(8, hole_x, hole_y)		--Ȧ(128+16, 128+16)
	
	if (gameresult == 0) then
		for i=1, 5 do
			--Ȱ��ȭ������ ���� �׸���
			if (ball[i] == 1) then
				Draw(7, circ_x[i], circ_y[i])	--��
			end
		end
	end

	if (gameresult == 1) then
		Draw(4, 112, 128)
	end
end


function DrawObject_2p()
	--����������_2���� ó���� ������Ʈ ���ҽ��� �Է��Ѵ�
	------------------------------------------

end

function DrawObject_3p()
	--����������_3���� ó���� ������Ʈ ���ҽ��� �Է��Ѵ�
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