--[[
�ļ����˵����
	������Դ��
		require "iuplua"��IUP LIB��
		require "iupluacontrols"��IUP LIB��
		require "iupluaimglib��IUP LIB��
	ע�⣺
		���ļ����ڿ��ٶ���iup.tree,�ڱ��ļ����ṩ��һЩ��Լ򵥵Ľӿڣ�ʵ����ת����iup.tree����������tree�ؼ���ֵ��������Ҫ�ο�iup�ж�tree������������÷�����
		���� iup.tree Ԫ�ص����Խ������ã�����ذ��չ淶���ã��������Բ��ᷢ�����û��߳���δԤ�ڵĽ�������Զ�λ����ؽӿڲ鿴ʹ��ʾ����
		Ϊ�˿��ٶ��ƿ��������ļ���Ҳ�ṩ��һЩ�򵥵Ľӿ�����������з�����ܡ�
		Ϊ�˱������ʹ�ã���ÿ������ӿ�ʵ�ֺ�����λ�ö�����һ���򵥵ĵ���ʾ��������ѧϰ��ʹ����Ҳ�ɽ����iup.tree�е����Խ�����֤ѧϰ��
	data���ݽṹ��
		db = {
			{
				attributes = {title,kind,data,image,color,state,...};--�����Ա���ƽڵ����ʾ״̬
				{--�ļ��������ļ�
					{attributes ={};};
					{attributes ={};};
					{	

						attributes ={};
						{
						
						}��
					};
				}
			};
		}

		
	������������ԣ�
		tree �����У���iup.tree Ԫ�ش����Ķ���
		data : Ҫ��ʾ�� iup.tree �е����ݣ�db�ṹ����Ҳ�����ڽ�����ƺ�ʹ��Class:init_tree_data(data) ����tree����ʾ���ݡ�
		lbtn �� �������������
		dlbtn �� ����˫���������
		rbtn �� �������Ҽ�����
		
	��������ķ�����	
		��װ�Ľӿڣ������õ�ֵ��Ҫ����iup.tree�������÷�����õ�ֵͬ����ˡ���
			
			Class:set_leaf_image(str)	
			--��ο�iup.tree�� IMAGELEAF ���ԡ�����tree������ leaf���ļ����ڵ��ͼƬ���ԡ�
			
			Class:set_branch_image(arg) 
			--��ο�iup.tree�� IMAGEBRANCHEXPANDED �� IMAGEBRANCHCOLLAPSED ���ԡ�����tree������branch���ļ��У��ڵ��չ�����պ�ʱ��ͼƬ���ԡ�
			--arg ʱһ����ṹ���ݡ�arg = {expanded = ""��collapsed = ''}��expanded��Ӧ��ֵ����չ��ʱ��ͼƬ��collapsed��Ӧ��ֵ���෴��
			
			Class:set_fgcolor(str)
			--��ο�iup.tree�� FGCOLOR ���ԡ��������� iup.tree ��ǰ��ɫ
			
			Class:set_bgcolor(str)
			--��ο�iup.tree�� BGCOLOR ���ԡ��������� iup.tree �ı���ɫ
			
			Class:set_hlcolor(str) 
			--��ο�iup.tree�� HLCOLOR ���ԡ��������� iup.tree �ı���ǽڵ����ɫ
				
			Class:set_rastersize(str) 
			--��ο�iup.tree�� RASTERSIZE ���ԡ��������� iup.tree �Ŀؼ��������ϵĴ�С��������Ϊ��λ����
			
			Class:set_size(str) 
			--��ο�iup.tree�� SIZE ���ԡ��������� iup.tree �Ŀؼ���С�����ַ�Ϊ��λ����
			
			Class:set_tabtitle(str) 
			--��ο�iup.tree �� TABTITLE ���ԡ��������õ�tree�ؼ�����ҳ��iup.tab���ı��⡣	
			
			Class:set_node_data(data,id)
			--��ο�iup.tree �� TreeSetUserId ��������������ڵ�󶨵����ݡ�	
			
			Class:set_node_title(text,id)
			--��ο�iup.tree �� TITLE ���ԡ��������û��߸ı�����ڵ���ʾ���ı���
			
			Class:set_node_color(color,id)
			--��ο�iup.tree �� COLOR ���ԡ��������ýڵ���ı���ɫ��
			
			Class:set_node_state(state,id)
			--��ο�iup.tree �� STATE ���ԡ���������BRANCH���ļ��У��ڵ��չ���պ�״̬��

			Class:set_node_image(image,id)
			--��ο�iup.tree �� IMAGE ���ԡ����ýڵ��image��
		
			Class:set_expanded_image(image,id)
			--��ο�iup.tree �� IMAGEEXPANDED ���ԡ�����branch���ļ��У��ڵ�չ��״̬�µ�ͼ�ꡣ
			
			Class:set_node_top(id)
			--��ο�iup.tree �� TOPITEM ���ԡ���ʾ�ڵ㣨����ýڵ�id���ڱպ��ļ����£��պϵ��ļ���Ҳ���𼶵�չ����
			
			Class:set_node_marked(id)
			--��ο�iup.tree �� MARKED ���ԡ����ñ�ѡ�еĽڵ㣨��������ѡЧ����.

			Class:get_tree_ids()
			--��ο�iup.tree �� COUNT ���ԡ����tree�����нڵ�ĸ���
			
			Class:get_node_ids(id,total)
			--��ο�iup.tree �� TOTALCHILDCOUNT �� CHILDCOUNT ���ԡ�
			-- ���total �������ֵ��Ϊnil������Ϊ��Ҫ��õ��ǽڵ��µ������ӽڵ�����������ӽڵ�Ľڵ㣩��Ҳ����ֱ��ʹ��Class:get_totalchildcount(id)
			-- ���total �������ֵΪnil������Ϊ��Ҫ��õ��ǽڵ��µ�ǰ�㼶�Ľڵ������Ҳ����ֱ��ʹ��Class:get_childcount(id)
			
			Class:get_node_depth(id)
			--��ο�iup.tree �� DEPTH ���ԡ���ýڵ㵱ǰ�Ĳ㼶���
			
			Class:get_node_kind(id)
			--��ο�iup.tree �� KIND ���ԡ����ָ���ڵ�����ͣ�'BRANCH' or 'LEAF'��
			
			Class:get_node_parent(id)
			--��ο�iup.tree �� PARENT ���ԡ����ָ���ڵ�ĸ��ڵ�id��
			
			Class:get_node_state(id)
			--��ο�iup.tree �� STATE ���ԡ����ָ��branch�ڵ�ĵ�ǰ״̬��չ��or�պϣ�
			
			Class:get_node_title(id)
			--��ο�iup.tree �� TITLE ���ԡ����ָ���ڵ�ı����ı�
			
			Class:get_tree_value()
			--��ο�iup.tree �� VALUE ���ԡ���õ�ǰѡ�нڵ��id
			
			Class:get_node_data(id)
			--��ο�iup.tree �� iup.TreeGetUserId  ��������ȡ�ڵ㸽�ŵ�����
		
			Class:add_branch(name,id)
			--��ο�iup.tree �� ADDBRANCH ���ԡ����һ��branch���ļ��У��ڵ�
			
			Class:add_leaf(name,id)
			--��ο�iup.tree �� ADDLEAF ���ԡ����һ��leaf���ļ����ڵ�
			
			Class:insert_branch(name,id)
			--��ο�iup.tree �� INSERTBRANCH ���ԡ�����һ�� branch���ļ��У��ڵ�
			
			Class:insert_leaf(name,id)
			--��ο�iup.tree �� INSERTLEAF ���ԡ�����һ�� leaf���ļ��У��ڵ�
			
			Class:delete_nodes(status,id)
			--��ο�iup.tree �� DELNODE ���ԡ�ɾ���ڵ������
		
		�Զ���ӿڣ�
			Class:new(t) 
			-- ���������ͬʱ�ö�������˴����õ�iup.treeԪ��
			--����t���յ���һ����ṹ����(û���κβ���Ҳ�ǿ��Ե�)�����磺t = {font = "Courier, 10";}
			--����ֵ��һ�������õĶ����
			
			Class:init()
			--����Ҫ�������ã�ϵͳ����treeԪ�ر����Ƶ�ʱ���Զ����ô˷�����
			--��Ҫע�����
			
			Class:set_data(data)
			--���ö�����Ҫ������
			
			Class:get_data()
			--��ö����б��������
			
			Class:set_tree(data)
			--����iup.tree�ؼ����������Ĭ�ϵ�tree���ܲ����������û����Ը���iup.tree�Լ�����һ��tree�ؼ���
			
			Class:get_tree()
			--��ñ����treeԪ�ض���
			
			Class:set_lbtn(lbtn)
			--���õ���������ʱ�����ĺ����� lbtn  �Ľ��յ������� function
			
			Class:set_dlbtn(dlbtn)
			--����˫��������ʱ�����ĺ����� dlbtn  �Ľ��յ������� function
			
			Class:set_rbtn(rbtn)
			--���õ�������Ҽ�ʱ�����ĺ����� rbtn  �Ľ��յ������� function
			
			Class:init_tree_data(data)
			-- ��ʼ�� iup.tree ��ʾ�����ݡ�data���������db�ṹ�����dataΪnil�������Ҷ��������data���ԡ�
			
			Class:init_node_data(data,id)
			-- ��ʼ�� iup.tree ��ĳ���ļ��нڵ���ʾ�����ݡ�data�����db�ṹ��idΪָ���ڵ��id��
			
			Class:init_path_data(path,rule,id)
			-- ��������·���������ļ����Լ��ļ����µ�������ʾ��tree�С�
			
			Class:get_selected_path(id)
			--��ȡ�ڵ��title·����Ϣ��
]]

local require = require
local type = type
local ipairs = ipairs
local pairs = pairs
local tonumber = tonumber
local setmetatable = setmetatable
local error = error
local print = print
local string_gsub_ = string.gsub
local string_match_ = string.match
local string_upper_ = string.upper
local string_find_ = string.find
local table_insert_ = table.insert
local string_sub_ = string.sub

local M = {}
local modname = ...
_G[modname] = M
package.loaded[modname] = M
_ENV = M

local iup = require "iuplua"
require "iupluacontrols"
require "iupluaimglib"
local lfs = require 'lfs'
local RMenu_ = {}--require 'sys.workspace.tree.rmenu'
Class = {}

----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------
--warning function 
--[[
��������map_warning
��������
����ֵ��
	���ͣ�true or nil
˵�����жϽ����Ƿ񱻻��ƣ���Щ������Ҫ������ƺ���ִ�У��������û�б����ƻᵯ����ʾ������nilֵ�����򷵻�true
]]
local function map_warning(self)
	if not self.Map then iup.Message('Notice','The tree has not been mapped !') return end 
	return true 
end


----------------------------------------------------------------------------------------------------------
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_leaf_image('IMGPAPER') --���ַ�����iup�ṩ
	����
	tree:set_leaf_image('c:\\image\\test.bmp') --�����ļ���������windows��bmp��ʽ���ļ�bmp��ʽ���ļ�
	�����뿴IMAGELEAF���ԡ�
--]]
function Class:set_leaf_image(str)
	local tree = self.tree
	tree.IMAGELEAF = str 
end

function Class:set_imagebranchcollapsed(str) 
	local tree = self.tree
	tree.IMAGEBRANCHCOLLAPSED = str 
end

function Class:set_imagebranchexpanded(str) 
	local tree = self.tree
	tree.IMAGEBRANCHEXPANDED = str 
end

--arg = {expanded,collapsed}
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_branch_image{expanded = ��collapsed = } --����ֵ��leaf image�����÷�������
	�����뿴 IMAGEBRANCHEXPANDED �� IMAGEBRANCHCOLLAPSED ���ԡ�
--]]
function Class:set_branch_image(arg) 
	arg = arg or {}
	self:set_imagebranchexpanded(arg.expanded) 
	self:set_imagebranchcollapsed(arg.collapsed) 
end


--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_fgcolor('255 0 0') -- �ַ����ĺ�����"R G B"��R��G��B��ȡֵ��Χ��0~255
	����
	tree:set_fgcolor('#ff0000') -- ��ɫ16���Ʊ�ʾ����Ч�����ϵ�ͬ���Ǻ�ɫ��
--]]
function Class:set_fgcolor(str)
	local tree = self.tree
	tree.FGCOLOR =  str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_bgcolor('255 0 0') -- �ַ����ĺ�����"R G B"��R��G��B��ȡֵ��Χ��0~255
	����
	tree:set_bgcolor('#ff0000') -- ��ɫ16���Ʊ�ʾ����Ч�����ϵ�ͬ���Ǻ�ɫ��
--]]
function Class:set_bgcolor(str) 
	local tree = self.tree
	tree.BGCOLOR =str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_hlcolor('255 0 0') -- �ַ����ĺ�����"R G B"��R��G��B��ȡֵ��Χ��0~255
	����
	tree:set_hlcolor('#ff0000') -- ��ɫ16���Ʊ�ʾ����Ч�����ϵ�ͬ���Ǻ�ɫ��
--]]
function Class:set_hlcolor(str)  
	local tree = self.tree
	tree.HLCOLOR  = str
end


--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_rastersize('100x100')
--]]
function Class:set_rastersize(str)
	local tree = self.tree
	tree.rastersize = str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_size('100x100')
--]]
function Class:set_size(width,height) 
	local tree = self.tree
	tree.size = str
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_tabtitle('Project')
--]]
function Class:set_tabtitle(str)
	-- self.tabtitle = str
	self.tree.TABTITLE  = str
end

----------------------------------------------------------------------------------------------------------
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_data({test = 'Test'},1)
	ע�⣺
		data ���յ�ֵֻ���� table��userdata��nil ���������ͣ�nil ɾ�����ݣ���
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Class:set_node_data(data,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	iup.TreeSetUserId(tree,id,data)
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_title('TestText',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Class:set_node_title(text,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	tree['TITLE' .. id] = text
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_color('255 0 0',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Class:set_node_color(color,id) 
	if not map_warning(self) then return end 
	local id = id  or self:get_tree_selected()
	local tree = self.tree
	tree['COLOR' .. id] = color
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_state('EXPANDED',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
--]]
function Class:set_node_state(state,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	tree["STATE" .. id] = state or "COLLAPSED"
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_image('IMGPAPER',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
		������õĽڵ���branch,��ô�����õ�ͼ�������պ�״̬�µ�ͼ����ʽ��
--]]
function Class:set_node_image(image,id)
	if not map_warning(self) then return end 
	local id = id  or self:get_tree_selected()
	local tree = self.tree
	tree['IMAGE' .. id] = image
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_expanded_image('IMGPAPER',1)
	ע�⣺
		���û������id�����������Ĭ�����õ��ǵ�ǰѡ�нڵ㡣
		��������branch�ڵ�չ��״̬�µ�ͼ��
--]]
function Class:set_expanded_image(image,id)
	if not map_warning(self) then return end 
	local id = id and tonumber(id) or self:get_tree_selected()
	local tree = self.tree
	tree['IMAGEEXPANDED' .. id] = image
end


--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_top(5)
--]]
function Class:set_node_top(id)
	if not map_warning(self) then return end 
	local tree = self.tree
	local id = id  or self:get_tree_selected()
	tree.TOPITEM = id
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:set_node_marked(5)
--]]
function Class:set_node_marked(id)
	if not map_warning(self) then return end 
	local tree = self.tree
	tree['MARKED' .. id] = 'YES'
	-- self:set_node_top(id)
end



----------------------------------------------------------------------------------------------------------
--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local count = tree:get_tree_ids(5)
	print(type(count)) --> number
--]]
function Class:get_tree_ids()
	if not map_warning(self) then return end 
	local tree = self.tree
	return tonumber(tree.COUNT)
end


function Class:get_totalchildcount(id)
	if not map_warning(self) then return end 
	local tree = self.tree
	local id = id  or self:get_tree_selected()
	return tonumber(tree['TOTALCHILDCOUNT' .. id])
end

function Class:get_childcount(id)
	if not map_warning(self) then return end 
	local tree = self.tree
	local id = id  or self:get_tree_selected()
	return tonumber(tree['CHILDCOUNT' .. id])
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
		local count = tree:get_node_ids(1,true)
		print(count)
		���� 
		local count = tree:get_node_ids(1)
		print(count)
		
		print(type(count)) --> number
--]]
function Class:get_node_ids(id,total)
	if not map_warning(self) then return end 
	local tree = self.tree
	local id = id or self:get_tree_selected()
	if total then 
		return self:get_totalchildcount(id)
	end
	return self:get_childcount(id)
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local depth = tree:get_node_depth(1)
	print(type(depth)) --> number
	ע�⣺
		���ڵ����ڵĲ㼶�� 0 ��
--]]
function Class:get_node_depth(id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	return tonumber(tree["DEPTH" .. id])
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local kind = tree:get_node_kind(1)
	print(type(kind)) --> string
	ע�⣺
		����ֵ�ǿ����ǣ�"BRANCH"����"LEAF"��
--]]
function Class:get_node_kind(id)	
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	return tree["KIND" .. id]
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local id = tree:get_node_parent(1)
	print(type(id)) --> number
	ע�⣺
		���ڵ��id �� 0 ��
--]]
function Class:get_node_parent(id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	return tonumber(tree["parent" .. id])
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local state = tree:get_node_state(1)
	print(type(state)) --> string
	ע�⣺
		����ֵ�ǿ����ǣ�"EXPANDED"����"COLLAPSED"��
--]]
function Class:get_node_state(id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	local tree = self.tree
	return tree["STATE" .. id]
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local title = tree:get_node_title(1)
	print(type(title)) --> string
--]]
function Class:get_node_title(id)
	if not map_warning(self) then return end 
	local tree = self.tree
	return tree['TITLE' .. id]
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local id = tree:get_tree_value()
	print(type(id)) --> number
--]]
function Class:get_tree_value()
	if not map_warning(self) then return end 
	local tree = self.tree
	return tonumber(tree.VALUE )
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	local data = tree:get_node_data(3)
	print(type(id)) --> userdata or table or nil
--]]
function Class:get_node_data(id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	return iup.TreeGetUserId(self.tree,id)
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:add_branch('name',1)
	ע�⣺
		��ӵ�λ��������ļ��нڵ㣬���Ϊ���ļ��е��׽ڵ㣬�����������ļ��ڵ��·��������ڲ��������
--]]
function Class:add_branch(name,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected() 
	self.tree["ADDBRANCH" .. id] = name
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:add_leaf('name',1)
	ע�⣺
		��ӵ�λ��������ļ��нڵ㣬���Ϊ���ļ��е��׽ڵ㣬�����������ļ��ڵ��·��������ڲ��������
--]]
function Class:add_leaf(name,id)
	if not map_warning(self) then return end
	local id = id or self:get_tree_selected()	
	self.tree["ADDLEAF" .. id] = name
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:insert_branch('name',1)
--]]
function Class:insert_branch(name,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	self.tree["INSERTBRANCH" .. id] = name
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:insert_leaf('name',1)
--]]
function Class:insert_leaf(name,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	self.tree["INSERTLEAF" .. id] = name
end

--[[
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:delete_nodes('SELECTED',1)
	ע�⣺	
		status ��ֵ����Ϊ��
			"ALL": deletes all nodes, id is ignored (Since 3.1)
			"SELECTED": deletes the specified node and its children
			"CHILDREN": deletes only the children of the specified node
			"MARKED": deletes all the selected nodes (and all their children), id is ignored
--]]
function Class:delete_nodes(status,id)
	if not map_warning(self) then return end 
	local id = id or self:get_tree_selected()
	self.tree["DELNODE" .. id] = status
end

local function get_selected_nodes(tree)
	if not tree  then error("Missing parameter !") return end 
	local str = tree.MARKEDNODES
	local ids = {}
	for i = 1,#str do 
		if string_sub_(str,i,i) == "+" then
			table_insert_(ids,i-1)
		end
	end
	return ids
end

function Class:get_tree_selected()
	return self:get_tree_value() or get_selected_nodes(self.tree)[1]
end

--------------------------------------------------------------------------------------------------
--t = {font,root,size,data}
local function create_tree(t)
	t = t or {}
	return iup.tree{
		font = t.font or "Courier, 10"; --��������
		addexpanded = "NO"; --Ĭ�ϲ�չ��ȫ�����ӽڵ�ķ�֧
		expand=   "YES"; --���õ������Ĵ�С��������tree�ؼ��Ĵ�Сʱ��ʹtree�Ĵ�С�Զ���չ����������������ֵ��
		showrename = "NO"; --�������ڽ���״̬���޸�tree�нڵ���ʾ���ı���������ͨ���������޸ġ�
		MARKMODE =  "SINGLE"; --���ø�tree��ѡ��ģʽΪ��ѡ.
		IMAGELEAF = "IMGPAPER";--���ø�treeĬ�ϵ�leaf��Ҷ�ӣ��ڵ��ͼ����"IMGPAPER"�����������ļ�ͼ�꣩
		ADDROOT = 'YES'; --���ø�tree��һ��Ĭ�ϵĽڵ㡣
		title0 = t.root or 'Project'; --���ø�Ĭ�ϵĽڵ��Ĭ����ʾ�ı���
		rastersize = t.rastersize;
		map_cb =  function() --����tree����ʾ��ʱ��Ļص�����
			t.Map = true --��ʼ��Map����Ϊtrue
			t:init()
		end;
	};
end

function Class:new(t)
	local t = t or {}
	setmetatable(t,self)
	self.__index = self;
	t.tree = create_tree(t);
	return t
end

function Class:init()
	if not map_warning(self) then return end  
	self:init_lbtn() --��ʼ������������
	self:init_dlbtn() --��ʼ��˫������������
	self:init_rbtn() --��ʼ������Ҽ�����
	self:init_tree_data() --������������ʼ�������е���ʾ���ݡ�
end

function Class:set_data(data)
	self.data = data or {}
end

function Class:get_data()
	return self.data
end

function Class:set_tree(iupTree)
	self.tree = iupTree or  create_tree();
end

function Class:get_tree()
	return self.tree 
end

function Class:set_lbtn(f)
	self.lbtn = type(f) == 'function' and f
end


function Class:set_dlbtn(f)
	self.dlbtn = type(f) == 'function' and f 
end

function Class:set_rbtn(f)
	self.rbtn = type(f) == 'function' and f 
end

function Class:set_rmenu(menu)
	self.Rmenu = type(menu) == 'table' and menu 
end


-----------------------------------------------------------------------------------------
--op callback
function Class:init_lbtn()
	local tree = self.tree
	local function deal_callback(id,number)
		if  type(self.lbtn) == 'function' then 
			self.lbtn(self,id)
		end
	end
	
	function tree:selection_cb(id,number)
		if number == 1 then 
			deal_callback(id,number);
		end
	end
end



function Class:init_dlbtn()
	if not self.tree then return error('Please create tree firstly !') end 
	local tree = self.tree
	local function deal_callback(id)
		local id = self:get_tree_selected() 
		if  type(self.dlbtn) == 'function' then 
			self.dlbtn(self,id)
		end
		
	end

	function tree:button_cb(button,pressed,x,y,str)
		if string_find_(str,"1") and string_find_(str,"D") then
			deal_callback(args)
		end
	end
end

function Class:init_rbtn()
	if not self.tree then return error('Please create tree firstly !') end 
	local tree = self.tree
	local function deal_callback(id)
		self:set_node_marked(id)
		if self.Rmenu then 
			local rmenu = RMenu_.new()
			rmenu:set_data(self.Rmenu)
			return rmenu:show(self,id)
		elseif type(self.rbtn) == 'function' then 
			self.rbtn(self,id)
		end
	end
	function tree:rightclick_cb(id)
		deal_callback(id,args)
	end
end

function Class:set_node_tip(str,id)
	if not self.tree then return error('Please create tree firstly !') end 
	local tree = self.tree
	tree.tip = str
end

		
local cmds_ = {}
cmds_.image = function (self,id,image)  
	if type(image) == 'table' then 
		if image.open then  self:set_expanded_image(image.open,id) end
		if image.close then  self:set_node_image(image.close,id) end
	else 
		self:set_node_image(image,id) 
	end 
end
cmds_.imageExpanded = function (self,id,image)  self:set_expanded_image(image,id) end
cmds_.color = function (self,id,color)  self:set_node_color(color,id) end
cmds_.title = function (self,id,title)   self:set_node_title(title,id) end
cmds_.state = function (self,id,state)  self:set_node_state(state,id) end
cmds_.data = function (self,id,data)  self:set_node_data(data,id) end
cmds_.tip = function (self,id,str)  self:set_node_tip(str,id) end


		
local function set_node_status(self,id,attributes)
	attributes = attributes or {}
	for k,v in pairs(attributes) do 
		if type(cmds_[k]) == 'function' then
			cmds_[k](self,id,v)
		end
	end
end


function Class:set_tree_data(data,id)
	if type(data) ~= 'table' or #data == 0 then return end
	local cur_id = id
	for k,v in ipairs (data) do 
		if not v.attributes then error('Please check data !') return end 
		local t =  v.attributes
		if k == 1 then
			if t.kind and t.kind == 'branch' then
				self:add_branch('',cur_id)
				cur_id = cur_id + 1
				self:set_tree_data(v[1],cur_id)
			else 
				self:add_leaf('',id)
				cur_id = cur_id + 1
			end 
		else 
			if t.kind and t.kind == 'branch' then
				self:insert_branch('',cur_id)	
				cur_id = cur_id + self:get_node_ids(cur_id) + 1
				self:set_tree_data(v[1],cur_id)
			else 
				self:insert_leaf('',cur_id)
				cur_id = cur_id + self:get_node_ids(cur_id) + 1
			end
		end
		set_node_status(self,cur_id,t)
	end
end

function Class:get_tree_datas(id)
	
end


function Class:init_tree_data(data)
	local data = data or self.data
	self:delete_nodes('ALL')
	self:set_tree_data(data,-1)
end

function Class:init_node_data(data,id)
	self:delete_nodes('CHILDREN',id)
	self:set_tree_data(data,id)
end
--]]

---------------------2017��5��22�� update ---------------------------------------------------------
local function get_path_data(path,rule)
	local data =  {}
	function add_data(path)
		local tempt = {}
		tempt.attributes = {title = string_match_(path,'.+/([^/]+)'),kind = 'branch',data = {file = path}}
		tempt[1] = {}
		local pos = 1
		for line in lfs.dir(path) do 
			if line ~= '.' and line ~= '..' then 
				local name = path .. '/' .. line
				local mode = lfs.attributes(name,'mode')
				local status = true
				local t = {}
				if mode == 'directory' then 
					t = add_data(name)
					if status then table_insert_(tempt[1],pos,t) pos = pos +1 end
				else 
					t.attributes = {title = line,kind = 'leaf' ,data = {file = name}}
					 if type(rule) =='function' then 
						status = rule(line,path .. '/',1)
						--print(status)
						if type(status) == 'table' then 
							
							t.attributes.image = status.icon
							t.attributes.tip = status.tip
							t.attributes.title = status.title or t.attributes.title
							for k,v in pairs (status) do
								t.attributes.data[k] = v
							end
						end
					end 
					if status then table_insert_(tempt[1],t) end
				end 
			end
		end 
		return tempt
	end
	table_insert_(data,add_data(path))
	return data
end

--[[
 Class:init_path_data(path,rule,id)
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	tree:init_path_data('e:/a/b/c',function(name,path,status) ... end ,	-1	)
	����˵����
		path�� ָ����·��
		rule���������򣬹��˺�����ȱʡȫ����ӣ��������ļ����ļ��У���
			rule ���ܵĲ�����
				name : �ļ������ļ��е����ơ����磺�ļ���test.lua���ļ��У�test
				path �� �ļ������ļ������ڵ�·�������磺e:/a/b/c/d/
					path .. name : ���ļ���ȫ·����
				status �� status ֵ�� 1���ļ���������  0���ļ��У���
				rule�����ķ���ֵ:
					�������ķ���ֵ��nil��false����Ϊ��Ҫ��Ӹ��ļ���tree�У�������ӡ�
					�������ֵ��table,table�������icon���ԣ���ᶨ��ýڵ���ʾ��ͼ�꣬table�������tip���ԣ���ᶨ��ýڵ��tip��Ϣ��
			id �� ָ��ĳ���ڵ�����Ӹ��ļ��С�ȱʡ����ڸ�����
˵����
	����Ի���û�е�����������δ���ƣ�����Ĭ����Ϊtree�ĳ�ʼ�����ݴ��ڡ�
	����Ի����Ѿ�����������ݵ�������������������µĽڵ��λ�á������Ϊnil����Ϊ-1������Ϊ���ԭ��������ʾ�µ����ݣ�
	��ʾ�Ľ��Ĭ�ϰ����ļ�������
--]]
function Class:init_path_data(path,rule,id)
	if type(path) ~= 'string' then return error('Please pass path !') end 
	path = string_gsub_(path,'\\','/')
	if string_sub_(path,-1,-1) == '/' then
		path = string_sub_(path,1,-2)
	end
	if not lfs.attributes(path) then return error('Local folder not exist !') end
	local data = get_path_data(path,rule)
	if self.Map then 
		if not id or id < 0 then 
			self:init_tree_data(data)
		else 
			self:init_node_data(data,id)
		end 
	else
		self.data  = data
	end
end
---------------------------2017��5��23��---------------------------------------------------
--[[
Class:get_selected_path(id)
���ܣ�
	���ѡ�нڵ㵽���ڵ�֮���title ·����Ϣ��
ʹ��ʾ����
	local tree = require '...'.Class:new(t)
	print(tree:get_selected_path(id))
	����˵����
		id �� ָ��ѡ�нڵ㣬ȱʡ���Զ����ѡ�еĽڵ㡣
	����ֵ��
		����һ���ַ�����ʾ�� : a/b/c.lua
--]]
function Class:get_selected_path(id)
	if not map_warning(self) then return end
	local id = id or self:get_tree_selected()	
	local function get_path(id,str)
		if self:get_node_depth(id) == 0 then 
			return str
		end
		local str = str and ('/' .. str) or ''
		str =  self:get_node_title(id) ..str
		return get_path(self:get_node_parent(id),str)
	end
	return get_path(id)
end

