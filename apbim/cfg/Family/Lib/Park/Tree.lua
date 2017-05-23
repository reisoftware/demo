local require = require
local reload = reload

_ENV = module(...)

local ENT = require"sys.Entity"
local GEO = require"sys.geometry"
local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Fixed = require'app.Family.Fixed'.Class

local Path = 'cfg/Family/Lib/Park/'
local Name = 'Tree'


function on_readme()
	return {title=Name,icon=Path..Name..'.bmp',tip="Add Tree"}
end

function on_create(arg)
	local ent = Fixed:new{Type="Green",Color={0,255,100}}
	ent:set_shape(reload(Path..Name..'_Shape'))
	ent:set_mode_rendering()
	CMD.set{command=CREATE.new{class=ent}:set_count(1)};
end
