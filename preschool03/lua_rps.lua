-- 
-- ���� ���� �� ����
--

print "�������� �� ����-----------------\n"
print "����� 'q'�� �Է��ϼ���\n"

print "����: 1, ����: 2, ��: 3\n"


score = 0		-- game score

math.randomseed(os.time() )


while( true) do

	i = io.read()

	if 'q' == i then
		break
	end


	d = math.random(3)


	-- ����
	if i == '1' then
		if d== 1 then
			print "[����(��) - ����(��)]: �����ϴ�.\n�ٽ��մϴ�\n"

		elseif d == 2 then
			print "[����(��) - ����(��)]: ����� �̰���ϴ�.\n"
			score = score + 1000
			print("����: " ..  score .. "\n")
		else
			print "[����(��) - ��(��)]: ������. �ȉ���ϴ�.\n"
			break
		end

	-- ����
	elseif i == '2' then
		if d== 1 then
			print "[����(��) - ����(��)]: ������. �ȉ���ϴ�.\n"
			break

		elseif d == 2 then
			print "[����(��) - ����(��)]: �����ϴ�.\n�ٽ��մϴ�.\n"
		else
			print "[����(��) - ��(��)]: ����� �̰���ϴ�.\n"
			score = score + 1000
			print("����: " ..  score .. "\n")
		end

	-- ��
	elseif i == '3' then
		if d== 1 then
			print "[��(��) - ����(��)]: ����� �̰���ϴ�.\n"
			score = score + 1000
			print("����: " ..  score .. "\n")

		elseif d == 2 then
			print "[��(��) - ����(��)]: ������. �ȉ���ϴ�.\n"
			break
		else
			print "[��(��) - ��(��)]: �����ϴ�.\n�ٽ��մϴ�.\n"
		end
	else

		print "�߸� �Է��߽��ϴ�. �ٽ��ϼ���.\n"
	end


end


print("���� ����: " ..  score .. "\n")
print("���α׷� ����----------------------------\n")


