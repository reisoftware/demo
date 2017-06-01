local require = require

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Member = require"app.Steel.Member".Class;

local Path = 'cfg/Family/Structure/'
local Name = 'Column'
Readme = {title=Name,icon=Path..Name..'.bmp',tip='',remark=''}

function on_start(arg)
	CMD.set{command=CREATE.new{class=Member:new{Type="Column",Color={255,0,100},Section="S400*400*32",Beta=0}:set_mode_rendering()}:set_step_count(1)};
end
