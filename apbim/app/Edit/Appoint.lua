_ENV = module(...,ap.adv)

local snap_ = require"sys.snap";
local drag_ = require"sys.drag";
local mgr_ = require"sys.mgr";
local geo_ = require"sys.geometry";
local CMD = require'sys.cmd'



Command = {
	Classname = "sys/cmd/Create";
	-- class = ;
	-- pts = ;
};

-- arg={cbf=}
function new(t)
	t = require"sys.class".new(Command,t);
	return t;
end

local function run(cbf,scene,pts)
	cbf(pts);
end

function Command:set_step_count(n)
	self.n = n;
	return self;
end

function Command:on_lbuttondown(scene,flags,x,y)
	local pt = snap_.get_world_pt(scene,x,y);
	
	if type(self.pts)~='table' then self.pts = {} end
	table.insert(self.pts,pt);
	local n = self.n or 2;
	if #self.pts >= n then
		run(self.cbf,scene,self.pts);
		self.pts = nil;
		CMD.set_idle();
	else
		drag_.start(scene);
	end
end

function Command:on_mousemove(scene,flags,x,y)
	if not self.pts then return end
	local pt = geo_.Point:new{client_2_world(scene,x,y)};
	drag_.draw_shirr_line{scene=scene,pt1=self.pts[#self.pts],pt2=pt};
end

