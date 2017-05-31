_ENV = module(...,ap.adv)

Class = {
	Classname = "app/Steel/Member";
	-- Points={[1],[2],[3],...};
	-- Section = "H200*50*5*8";
	-- Beta = 90;
	-- Alignment = {0,0};
	-- Color = {255,255,255};
};
require"sys.Entity".Class:met(Class);

--callback

function Class:on_edit()
	require'app.Steel.Member_dlg'.pop();
end



function Class:on_draw(arg)
-- require'sys.table'.totrace{arg=arg}
	if not self.Points[2] then self.Points[2] = {self.Points[1].x,self.Points[1].y,self.Points[1].z+3300} end
	return require"app.Steel.shape".draw_member(self,string.lower(arg.mode));
end

function Class:get_alignment_text()
	local align = type(self.Alignment)=="table" and self.Alignment or {};
	local x = align.x or align.h or align[1] or 0;
	local y = align.y or align.v or align[2] or 0;
	local h = "";
	if x==0.5 then h=h.."Left" end
	if x==0 then h=h.."Center" end
	if x==-0.5 then h=h.."Right" end
	local v= "";
	if y==-0.5 then v=v.."Top" end
	if y==0 then v=v.."Center" end
	if y==0.5 then v=v.."Bottom" end
	return h..v;
end

function Class:get_alignment()
	return type(self.Alignment)=="table" and self.Alignment or {0,0};
end

function Class:align_left()
	if type(self.Alignment)~="table" then self.Alignment={} end
	self.Alignment[1] = 0.5;
	self:modify();
	return self;
end

function Class:align_center_h()
	if type(self.Alignment)~="table" then self.Alignment={} end
	self.Alignment[1] = 0;
	self:modify();
	return self;
end

function Class:align_right()
	if type(self.Alignment)~="table" then self.Alignment={} end
	self.Alignment[1] = -0.5;
	self:modify();
	return self;
end

function Class:align_top()
	if type(self.Alignment)~="table" then self.Alignment={} end
	self.Alignment[2] = -0.5;
	self:modify();
	return self;
end

function Class:align_center_v()
	if type(self.Alignment)~="table" then self.Alignment={} end
	self.Alignment[2] = 0;
	self:modify();
	return self;
end

function Class:align_bottom()
	if type(self.Alignment)~="table" then self.Alignment={} end
	self.Alignment[2] = 0.5;
	self:modify();
	return self;
end


function Class:get_foucs_pt()
	if type(self.Points)~="table" then return 0 end
	if #self.Points<=0 then return require"sys.geometry".Point:new{0,0,0} end
	if #self.Points<=1 then return require"sys.geometry".Point:new(self.Point[1]) end
	return (require"sys.geometry".Point:new(self.Points[1])+require"sys.geometry".Point:new(self.Points[2]))*0.5;
end

function Class:get_length()
	return require"sys.geometry".Point:new(self.Points[1]):distance(self.Points[2]);
end


