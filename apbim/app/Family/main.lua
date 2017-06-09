local require = require

_ENV = module(...)

local MENU = require'sys.menu'
local Action = require'app.Family.function'

function on_load()
	Action.Lib();
	MENU.add{
		keyword = 'AP.Family.Lib';
		action = Action.Lib;
		view = true;
		frame = true;
	}
	MENU.add{
		keyword = 'AP.Family.Property';
		action = Action.Property;
		view = true;
	}
	MENU.add{
		keyword = 'AP.Family.Make';
		action = Action.Make;
		view = true;
	}
	MENU.add{
		keyword = 'AP.Family.Create';
		action = Action.Create;
		view = true;
	}
end



