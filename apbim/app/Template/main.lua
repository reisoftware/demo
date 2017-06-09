local require = require

_ENV = module(...)

local MENU = require'sys.menu'
local Action = require'app.Template.function'

function on_load()
	MENU.add{
		keyword='AP.Template.Load',
		action=Action.Load_Template;
		view = true,
		frame = true;
	}
end

function on_init()
end

