local require = require
local reload = reload

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Fixed = require'app.Family.Fixed'.Class

local Path = 'cfg/Family/Lib/Park/'
local Name = 'Cocos'


function on_readme()
	return {title=Name,icon=Path..Name..'.bmp'}
end

function on_create(arg)
	local ent = Fixed:new{}
	ent:set_shape(reload(Path..Name..'_Shape'))
	ent:set_mode_rendering()
	CMD.set{command=CREATE.new{class=ent}:set_step_count(1)};
end
