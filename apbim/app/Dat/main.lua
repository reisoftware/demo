_ENV = module(...,ap.adv)

local MENU = require'sys.menu'
local Action = require'app.Dat.function'

function on_load()
	MENU.add{
		keyword = 'AP.Dat.Append';
		action = Action.Append;
		view = true;
	}
end


