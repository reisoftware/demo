return  {
   	{
  	 	name = "File";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Project";
				subs = {
					{
						name = "New";
						keyword ='AP.Project.New';
					};
					{
						name = "Open";
						keyword ='AP.Project.Open';
					};
					{
						name = "Save";
						keyword ='AP.Project.Save';
					};
				};
  	 	 	};
  	 	 	{
  	 	 	 	name = "Import";
				subs = {
					{
						name = "Lua";
						keyword ='AP.Work.Import.Lua';
					};
					{
					};
					{
						name = "Tekla";
						keyword ='AP.Project.Import.Tekla';
					};
					{
						name = "Tekla From File";
						keyword ='AP.Project.Import.Tekla From File';
					};
					{
					};
					{
						name = "Revit";
						keyword ='AP.Project.Import.Revit';
					};
					{
						name = "SketchUp";
						keyword ='AP.Project.Import.SketchUp';
					};
					
				};
  	 	 	};
  	 	 	{
  	 	 	 	name = "Export";
				subs = {
					{
						name = "Lua";
						keyword ='AP.Work.Export.Lua';
					};
				};
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "View";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "New";
  	 	 	 	keyword ='AP.View.New';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Show";
  	 	 	 	keyword ='AP.View.Show';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Hide";
  	 	 	 	keyword ='AP.View.Hide';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Fit";
  	 	 	 	keyword ='AP.View.Fit';
  	 	 	};
			{};
  	 	 	{
  	 	 	 	name = "Zoomin";
  	 	 	 	keyword ='AP.View.Zoomin';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Zoomout";
  	 	 	 	keyword ='AP.View.Zoomout';
  	 	 	};
			{};
			{
				name = "Default";
				keyword ='AP.View.Mode.Default';
			};
			{
				name = "3D";
				keyword ='AP.View.Mode.3D';
			};
			{
				name = "Top";
				keyword ='AP.View.Mode.Top';
			};
			{
				name = "Front";
				keyword ='AP.View.Mode.Front';
			};
			{
				name = "Back";
				keyword ='AP.View.Mode.Back';
			};
			{
				name = "Left";
				keyword ='AP.View.Mode.Left';
			};
			{
				name = "Right";
				keyword ='AP.View.Mode.Right';
			};
			{
				name = "Bottom";
				keyword ='AP.View.Mode.Bottom';
			};
  	 	};
  	};
 	{
  	 	name = "Show";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Property";
  	 	 	 	keyword ='AP.Show.Property';
  	 	 	};
			{};
  	 	 	{
  	 	 	 	name = "Diagram";
  	 	 	 	keyword ='AP.Show.Diagram';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Wireframe";
  	 	 	 	keyword ='AP.Show.Wireframe';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Rendering";
  	 	 	 	keyword ='AP.Show.Rendering';
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "Select";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Idle";
  	 	 	 	keyword ='AP.Select.Idle';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Cursor";
  	 	 	 	keyword ='AP.Select.Cursor';
  	 	 	};
			{};
  	 	 	{
  	 	 	 	name = "All";
  	 	 	 	keyword ='AP.Select.All';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Cancel";
  	 	 	 	keyword ='AP.Select.Cancel';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Reverse";
  	 	 	 	keyword ='AP.Select.Reverse';
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "Edit";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Property";
  	 	 	 	keyword ='AP.Edit.Property';
  	 	 	};
			{};
  	 	 	{
  	 	 	 	name = "Copy";
  	 	 	 	keyword ='AP.Edit.Copy';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Move";
  	 	 	 	keyword ='AP.Edit.Move';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Del";
  	 	 	 	keyword ='AP.Edit.Del';
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "Snap";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Point";
  	 	 	 	keyword ='AP.Snap.Point';
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "Family";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Show";
				keyword ='AP.Family.Lib';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Property";
				keyword ='AP.Family.Property';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Make";
				keyword ='AP.Family.Make';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Create";
				keyword ='AP.Family.Create';
  	 	 	};
			{};
			{
				name = 'Create';
				keyword = 'REI.Ap.FamilyCreate'
			};
  	 	};
  	};
    {
  	 	name = "Model";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Show";
				subs = {
					{
						name = "All";
						keyword ='AP.Model.Show.All';
					};
					{};
					{
						name = "Diagram";
						keyword ='AP.Model.Show.Diagram';
					};
					{
						name = "Wireframe";
						keyword ='AP.Model.Show.Wireframe';
					};
					{
						name = "Rendering";
						keyword ='AP.Model.Show.Rendering';
					};
				};
  	 	 	};
			{
				name = "Report";
				subs = {
					{
						name = "Selection";
						keyword ='AP.Report.Selection';
					};
					{
						name = "View";
						keyword ='AP.Report.View';
					};
					{
						name = "All";
						keyword ='AP.Report.All';
					};
				};
			};
  	 	 	{
  	 	 	 	name = "Database";
				subs = {
					{
						name = "Show";
						keyword ='AP.Work.Database.Show';
					};
					{
						name = "Find";
						keyword ='AP.Work.Database.Find';
					};
				};
  	 	 	};
  	 	 	{
  	 	 	 	name = "Dat";
				subs = {
					{
						name = "Append";
						keyword ='AP.Dat.Append';
					};
				};
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "Tools";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Restart";
  	 	 	 	keyword ='AP.Tools.Restart';
  	 	 	};
  	 	};
  	};
 	{
  	 	name = "Window";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "Close";
  	 	 	 	keyword ='AP.Help.About';
  	 	 	};
  	 	 	{
  	 	 	 	name = "Close All";
  	 	 	 	keyword ='AP.Help.About';
  	 	 	};
			{};
  	 	};
  	};
 	{
  	 	name = "Help";
  	 	subs = {
  	 	 	{
  	 	 	 	name = "About";
  	 	 	 	keyword ='AP.Help.About';
  	 	 	};
  	 	};
  	};
};
