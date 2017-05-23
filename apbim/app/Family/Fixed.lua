local require = require
local type = type
local trace_out = trace_out

_ENV = module(...)

Class = {
	Classname = "app/Family/Fixed";
	-- Points = {[1]};
	-- Shape = {Diagram={},Wireframe={},Rendering={}};
};
require"sys.Entity".Class:met(Class);


function Class:on_edit()
	-- require"app/Graphics/line_dlg".pop();
end

function Class:on_draw(arg)
	if type(arg)~='table' then return end
	if type(arg.mode)~='string' then return end
	if type(self.Shape)~='table' then return end
	return self.Shape[arg.mode];
end

function Class:on_place()
	return {base=self.Points[1] or {0,0,0}};
end

function Class:set_shape(t)
	self.Shape = t;
end

