

dofile("rps_play.lua")

while true do

	if 1 == GamePhase then
		GameBegin()
	
	elseif 2 == GamePhase then
		GamePlay()

	elseif 3 == GamePhase then
		GameEnd()

	elseif 4 == GamePhase then
		break
	end

end