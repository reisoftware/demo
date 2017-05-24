local require = require

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Member = require"app.Steel.Member".Class;

local Path = 'cfg/Family/Lib/Structure/'
local Name = 'Column'

function on_readme()
	return {title=Name,icon=Path..Name..'.bmp',tip="Create Column Family",remark=""}
end

function on_create(arg)
	CMD.set{command=CREATE.new{class=Member:new{Type="Column",Color={255,0,100},Section="S400*400*32",Beta=0}:set_mode_rendering()}:set_step_count(1)};
end
