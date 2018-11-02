
-- 
-- 숫자 야구 main
--


math.randomseed(os.time() )

dofile("baseball_data.lua")
dofile("baseball_begin.lua")
dofile("baseball_play.lua")
dofile("baseball_end.lua")


while true do

	if GAMEPHASE_BEGIN == g_gamePhase then
		GameBegin()
	
	elseif GAMEPHASE_PLAY == g_gamePhase then
		GamePlay()

	elseif GAMEPHASE_END == g_gamePhase then
		GameEnd()

	elseif GAMEPHASE_EXIT == g_gamePhase then
		break
	end

end

