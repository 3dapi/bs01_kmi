
function DrawObject_1p()
		
	--���ӽ�����(1)-------------------------------------------------
	---------------------------------------------------------------
	if (g_state == 1) then

		Draw(9, 112, 128)	--"���ӽ�ŸƮ!"���

	--�����÷���(2)-------------------------------------------------
	---------------------------------------------------------------
	elseif (g_state == 2) then
				
		if (tmShim.on) then	--Ÿ�̸�tmShim�� �������ΰ�

			if (clickcheck == 1) then		--������ Ŭ���� ������ ����
				Draw(3, mpx-64, mpy-16)		--"correct!"���		
			elseif (clickcheck == 2) then	--������ Ŭ���� ������ ��������
				Draw(4, mpx-64, mpy-16)		--"wrong!"���
			end
		end

	--���Ӱ��(3)-------------------------------------------------
	---------------------------------------------------------------
	elseif (g_state == 3) then
		
		if (g_result == 1) then	--����Ŭ������
			Draw(6, 112, 128)	--"clear!"���
		elseif (g_result == 2) then	--���ӿ������
			Draw(7, 112, 128)	--"gameover!"���
		end

	end

	--��������� �� 5�� �׸���
	for i = 1, 9 do
		if (pt_open[i]) then		--�� ���� ��������ΰ�
			Draw(5, pt_x[i]-16, pt_y[i]-16)
		end
	end

	--���� ������(�ִ� 5)
	for i = 1, correctcount do
		Draw(10, 196 + (i-1)*22, 20)
	end
	
	--�ؽ�Ʈ(��Ʈ)�� ���
	SetFont(FT12, 60 - tmLimit.ct, 430, 20)
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