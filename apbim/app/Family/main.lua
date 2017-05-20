local require = require

_ENV = module(...)

local MENU = require'sys.menu'
local Action = require'app.Family.function'

function on_load()
	MENU.add{
		keyword = 'AP.Family.New';
		action = Action.New;
		view = true;
		frame = true;
	}
end


