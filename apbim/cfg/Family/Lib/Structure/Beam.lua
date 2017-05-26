local require = require

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Member = require"app.Steel.Member".Class;

local Path = 'cfg/Family/Lib/Structure/'
local Name = 'Beam'

function on_readme()
	return {title=Name,icon=Path..Name..'.bmp',tip="Create Beam Family",remark=""}
end

function on_start(arg)
	CMD.set{command=CREATE.new{class=Member:new{Type="Name",Color={0,0,255},Section="H500*200*5*12",Beta=0}:set_mode_rendering()}:set_step_count(2)};
end
