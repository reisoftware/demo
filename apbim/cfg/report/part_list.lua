--[[
return {
	Remark = "Section,Mat,Lenth,Weight and Price.";
	{--Sheet1
		Row = 3;
		Columns = {
			[1] = function(arg)
				return tonumber(arg.i or "");
			end;
			[2] = function(arg)
				return tostring(arg.v.Section or "");
			end;
			[3] = function(arg)
				return tostring(arg.v.Mat or "");
			end;
			[4] = function(arg)
				return tonumber(arg.v.Count or 1);
			end;
			[5] = function(arg)
				return tonumber(arg.v:get_length() or 0);
			end;
			[6] = function(arg)
				return tonumber(arg.v:get_length() or 0) * tonumber(arg.v.Count or 1);
			end;
			[7] = function(arg)
				return tonumber(arg.v.Weight or 0);
			end;
			[8] = function(arg)
				return tonumber(arg.v.Weight or 0) * tonumber(arg.v.Count or 1);
			end;
			[9] = function(arg)
				return tonumber(arg.v.Price or 0);
			end;
			[10] = function(arg)
				return tonumber(arg.v.Price or 0) * tonumber(arg.v.Count or 1);
			end;
		};
		Filter = function(arg)
			if type(arg.v.Section)=='string' and type(arg.v.get_length)=='function' then
				return true;
			else
				return false;
			end
		end;
		Unite = function(arg)
			if 	tostring(arg.v1.Mat or "")==tostring(arg.v2.Mat or "") and
				tostring(arg.v1.Section or "")==tostring(arg.v2.Section or "") and
				math.abs(tonumber(arg.v1:get_length() or 0)-tonumber(arg.v2:get_length() or 0))<0.01 then
				return true
			else
				return false
			end
		end;
		Sort = function(arg)
			if tostring(arg.v1.Section or "")<tostring(arg.v2.Section or "") then
				return true
			elseif tostring(arg.v1.Section or "")>tostring(arg.v2.Section or "") then
				return false
			elseif tostring(arg.v1.Mat or "")<tostring(arg.v2.Mat or "") then
				return true
			elseif tostring(arg.v1.Mat or "")>tostring(arg.v2.Mat or "") then
				return false
			elseif tonumber(arg.v1:get_length() or 0)<tonumber(arg.v2:get_length() or 0) then
				return true
			else 
				return false
			end
		end;
	};
};
--]]

require'luacom'
local luacom = luacom
local require = require
local pairs = pairs
local type = type

_ENV = module(...)


function readme()
	return "Section,Mat,Lenth,Weight and Price.";
end

--arg={dat=,template=,dstfile=}
function start(arg)
	local xls = luacom.CreateObject("Excel.Application")
	if not xls then return end
	xls.Visble = true;
	local book = xls.Workbooks:Open(arg.template);
	if not book then return end
	local sheet = book.Sheets(1)
	if not sheet then return end
	local row,col = 3,1;
	for k,v in pairs(arg.dat) do
		sheet.Cells(row,1).Value2 = row - 2;
		sheet.Cells(row,2).Value2 = v.Section or "";
		sheet.Cells(row,3).Value2 = v.Mat or "";
		sheet.Cells(row,4).Value2 = v.Count or 1;
		sheet.Cells(row,5).Value2 = type(v.get_length)=='function' and v:get_length() or 0;
		sheet.Cells(row,6).Value2 = type(v.get_length)=='function' and v:get_length() * (v.Count or 0) or 0;
		sheet.Cells(row,7).Value2 = v.Weight or 0;
		sheet.Cells(row,8).Value2 = (v.Weight or 0) * (v.Count or 0);
		sheet.Cells(row,9).Value2 = v.Price or 0;
		sheet.Cells(row,10).Value2 = (v.Price or 0) * (v.Count or 0);
		row = row + 1;
	end
	book:SaveAs(arg.dstfile);
	book:Close(0)
	xls:Quit(0)
	return true;
end


		
		
	   	
		

		