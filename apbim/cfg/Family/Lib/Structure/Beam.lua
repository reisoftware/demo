local require = require

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Beam = require"app.Steel.Member".Class;

function on_readme()
	return {title="Beam",icon='cfg/Family/Lib/Structure/Beam.bmp',tip="Create Beam Family"}
end

function on_create(arg)
	CMD.set{command=CREATE.new{class=Beam:new{Type="Beam",Color={0,0,255},Section="H200*100*5*12",Beta=0}:set_mode_rendering()}:set_step_count(2)};
end
