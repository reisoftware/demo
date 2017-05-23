local require = require

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Column = require"app.Steel.Member".Class;

function on_readme()
	return {title="Column",icon='cfg/Family/Lib/Structure/Beam.bmp',tip="Create Column Family"}
end

function on_create(arg)
	CMD.set{command=CREATE.new{class=Column:new{Type="Column",Color={255,0,100},Section="S100*100*16",Beta=0}:set_mode_rendering()}:set_step_count(1)};
end
