-- 
-- °è»ê±â
--


while( true) do

	os.execute("cls")

	print("Arithmetic -------------------- \n")
	a = io.read()
	b = io.read()

	if nil ~= a and nil ~= b then

		print("Add: ", a + b, "\n")
		print("Sub: ", a - b, "\n")
		print("Mul: ", a * b, "\n")
		print("Div: ", a / b, "\n")
	end --if

	c = io.read()		-- dummy
end -- while

