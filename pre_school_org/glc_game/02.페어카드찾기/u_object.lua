
function DrawObject_1p()
		
	for i=1, 16 do
		local x, y = GetMod(i, 4)		--����� x, y�� �����ϴ� �Լ�

		if (slotstate[i] == 0) then		--ī�� �ո��϶�
			Draw(slot[i]+1, 60 + x*100, y*80)
		else							--ī�� �޸��϶�
			Draw(10,		60 + x*100, y*80)
		end
	end

	if (gameresult == 1) then	--������ Ŭ�����ߴٸ�
		Draw(12, 112, 128)
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