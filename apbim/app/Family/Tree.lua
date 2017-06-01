local require = require
local reload = reload

_ENV = module(...)

local CMD = require'sys.cmd'
local CREATE = require'app.Edit.Create'
local Fixed = require'app.Family.Fixed'.Class

local Path = 'cfg/Family/Park/'
local Name = 'Tree'
local Shape = {
	Diagram = {
		surfaces = {
			{
				points = {
					{0,255,0,1,1,10,0,0};
					{0,255,0,1,1,0,0,6500};
				};
				lines = {{1,2}};
			};
		};
	};
	Wireframe = {
		surfaces = {
			{
				points = {
					{0,255,0,1,1,100,0,0};
					{0,255,0,1,1,100,0,3000};
					{0,255,0,1,1,1000,0,2500};
					{0,255,0,1,1,400,0,4000};
					{0,255,0,1,1,800,0,3700};
					{0,255,0,1,1,300,0,5000};
					{0,255,0,1,1,500,0,4900};
					{0,255,0,1,1,0,0,5500};
					{0,255,0,1,1,-500,0,4900};
					{0,255,0,1,1,-300,0,5000};
					{0,255,0,1,1,-800,0,3700};
					{0,255,0,1,1,-400,0,4000};
					{0,255,0,1,1,-1000,0,2500};
					{0,255,0,1,1,-100,0,3000};
					{0,255,0,1,1,-100,0,0};
					{0,255,0,1,1,0,0,0};
				};
				lines = {{1,2},{2,3},{3,4},{4,5},{5,6},{6,7},{7,8},{8,9},{9,10},{10,11},{11,12},{12,13},{13,14},{14,15},{15,1},{8,16}};
			};
			{
				points = {
					{0,255,0,1,1,0,100,0};
					{0,255,0,1,1,0,100,3000};
					{0,255,0,1,1,0,1000,2500};
					{0,255,0,1,1,0,400,4000};
					{0,255,0,1,1,0,800,3700};
					{0,255,0,1,1,0,300,5000};
					{0,255,0,1,1,0,500,4900};
					{0,255,0,1,1,0,0,5500};
					{0,255,0,1,1,0,-500,4900};
					{0,255,0,1,1,0,-300,5000};
					{0,255,0,1,1,0,-800,3700};
					{0,255,0,1,1,0,-400,4000};
					{0,255,0,1,1,0,-1000,2500};
					{0,255,0,1,1,0,-100,3000};
					{0,255,0,1,1,0,-100,0};
					{0,255,0,1,1,0,0,0};
				};
				lines = {{1,2},{2,3},{3,4},{4,5},{5,6},{6,7},{7,8},{8,9},{9,10},{10,11},{11,12},{12,13},{13,14},{14,15},{15,1},{8,16}};
			};
		};
	};
	Rendering = {
		surfaces = {
			{
				points = {
					{0,255,0,1,1,100,0,0};
					{0,255,0,1,1,100,0,3000};
					{0,255,0,1,1,1000,0,2500};
					{0,255,0,1,1,400,0,4000};
					{0,255,0,1,1,800,0,3700};
					{0,255,0,1,1,300,0,5000};
					{0,255,0,1,1,500,0,4900};
					{0,255,0,1,1,0,0,5500};
					{0,255,0,1,1,-500,0,4900};
					{0,255,0,1,1,-300,0,5000};
					{0,255,0,1,1,-800,0,3700};
					{0,255,0,1,1,-400,0,4000};
					{0,255,0,1,1,-1000,0,2500};
					{0,255,0,1,1,-100,0,3000};
					{0,255,0,1,1,-100,0,0};
				};
				outer = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
			};
			{
				points = {
					{0,255,0,1,1,0,100,0};
					{0,255,0,1,1,0,100,3000};
					{0,255,0,1,1,0,1000,2500};
					{0,255,0,1,1,0,400,4000};
					{0,255,0,1,1,0,800,3700};
					{0,255,0,1,1,0,300,5000};
					{0,255,0,1,1,0,500,4900};
					{0,255,0,1,1,0,0,5500};
					{0,255,0,1,1,0,-500,4900};
					{0,255,0,1,1,0,-300,5000};
					{0,255,0,1,1,0,-800,3700};
					{0,255,0,1,1,0,-400,4000};
					{0,255,0,1,1,0,-1000,2500};
					{0,255,0,1,1,0,-100,3000};
					{0,255,0,1,1,0,-100,0};
				};
				outer = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
			};
		};
	};
};


function on_readme()
	return {title=Name,icon=Path..Name..'.bmp'}
end

function on_start(arg)
	local ent = Fixed:new{}
	ent:set_shape(Shape)
	ent:set_mode_rendering()
	CMD.set{command=CREATE.new{class=ent}:set_step_count(1)}
end
