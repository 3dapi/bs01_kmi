-- 
-- Ȧ ¦ ����
--

print "Ȧ ¦ ����-----------------\n"
print "����� 'q'�� �Է��ϼ���\n"

print "Ȧ: 1, ¦: 2\n"


score = 0		-- game score

math.randomseed(os.time() )


while( true) do

	i = io.read()

	if nil ~= i then


		if 'q' == i then
			break
		end


		d = math.random(2)


		-- Ȧ
		if i == '1' then
			if d== 1 then
				print "[Ȧ(��) - Ȧ(��)]: ����� �̰���ϴ�.\n"
				score = score + 1000
				print("����: " ..  score .. "\n")
			else
				print "[Ȧ(��) - ¦(��)]: ������. �ȉ���ϴ�.\n"
				break
			end

		-- ¦
		elseif i == '2' then
			if d== 2 then
				print "[¦(��) - ¦(��)]: ����� �̰���ϴ�.\n"
				score = score + 1000
				print("����: " ..  score .. "\n")
			else
				print "[Ȧ(��) - ¦(��)]: ������. �ȉ���ϴ�.\n"
				break
			end

		-- Input Error
		else

			print "�߸� �Է��߽��ϴ�. �ٽ��ϼ���.\n"
		end

	end --if
end -- while


print("���� ����: " ..  score .. "\n")
print("���α׷� ����----------------------------\n")

