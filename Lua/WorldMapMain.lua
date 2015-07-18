-- WorldMapMain
-- Author: Gedemon
-- DateCreated: 15-Jul-15 01:42:03
--------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- Calendar
----------------------------------------------------------------------------------------------------------------------------

REAL_WORLD_ENDING_DATE = 19470105 -- Nothing related to calendar happens after this date.
g_Calendar = {}
local monthList = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
local dayList = { "1", "5", "10", "15", "20", "25" }
local turn = 0
for year = 1936, 1946 do -- see large
	for month = 1, #monthList do
		for day = 1, #dayList do
			local bStart = (month >= 1 and year == 1936) -- Start date = january, 1st 1936
			if bStart or (year > 1939) then
				local numMonth, numDay
				if month < 10 then numMonth = "0"..month; else numMonth = month; end
				if tonumber(dayList[day]) < 10 then numDay = "0"..dayList[day]; else numDay = dayList[day]; end
				g_Calendar[turn] = { Text = monthList[month] .. " " .. dayList[day] .. ", " .. year, Number = tonumber(year..numMonth..numDay)}
				turn = turn + 1
			end		
		end
	end
end


----------------------------------------------------------------------------------------------------------------------------
-- Post Defines
----------------------------------------------------------------------------------------------------------------------------

if MapModData.RED then
	MapModData.RED.Calendar = g_Calendar
else
	MapModData.RED = {}
	MapModData.RED.Calendar = g_Calendar
end