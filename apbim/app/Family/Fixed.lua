local require = require
local type = type
local trace_out = trace_out

_ENV = module(...)

local TAB = require'sys.table'
local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'


Class = {
	Classname = "app/Family/Fixed";
	-- Points = {[1]};
	-- Shape = {Diagram={},Wireframe={},Rendering={}};
};
require"sys.Entity".Class:met(Class);


function Class:on_edit()
	require"app/Family/Fixed_dlg".pop();
end

-- function Class:on_draw(arg)
	-- if type(arg)~='table' then return end
	-- if type(arg.mode)~='string' then return end
	-- if type(self.Shape)~='table' then return end
	-- return TAB.deepcopy(self.Shape[arg.mode]);
-- end

function Class:on_place()
	return {base=self.Points[1] or {0,0,0}};
end


Starts = {}
Starts.Create = function (shape)
	local ent = Class:new{}
	ent:set_shape(shape)
	ent:set_mode_rendering()
	CMD.set{command=CREATE.new{class=ent}:set_step_count(1)}
end

function on_start(arg)
	if type(Starts[arg.mode])=='function' then Starts[arg.mode](arg.shape) end
end
