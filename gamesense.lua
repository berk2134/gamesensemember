-- [[ // Error Handling // ]]
local Passed, Statement = pcall(function()
	-- [[ // Libraries // ]]
	local library = {
		Renders = {},
		Connections = {},
		Folder = "PuppyWare", -- Change if wanted
		Assets = "Assets", -- Change if wanted
		Configs = "Configs" -- Change if wanted
	}
	local utility = {}
	-- [[ // Tables // ]]
	local pages = {}
	local sections = {}
	-- [[ // Indexes // ]]
	do
		library.__index = library
		pages.__index = pages
		sections.__index = sections
	end
	-- [[ // Variables // ]] 
	local tws = game:GetService("TweenService")
	local uis = game:GetService("UserInputService")
	local cre = game:GetService("CoreGui")
	-- [[ // Functions // ]]
	function utility:RenderObject(RenderType, RenderProperties, RenderHidden)
		local Render = Instance.new(RenderType)
		--
		if RenderProperties and typeof(RenderProperties) == "table" then
			for Property, Value in pairs(RenderProperties) do
				if Property ~= "RenderTime" then
					Render[Property] = Value
				end
			end
		end
		--
		library.Renders[#library.Renders + 1] = {Render, RenderProperties, RenderHidden, RenderProperties["RenderTime"] or nil}
		--
		return Render
	end
	--
	function utility:CreateConnection(ConnectionType, ConnectionCallback)
		local Connection = ConnectionType:Connect(ConnectionCallback)
		--
		library.Connections[#library.Connections + 1] = Connection
		--
		return Connection
	end
	--
	function utility:MouseLocation()
		return uis:GetMouseLocation()
	end
	--
	function utility:Serialise(Table)
		local Serialised = ""
		--
		for Index, Value in pairs(Table) do
			Serialised = Serialised .. Value .. ", "
		end
		--
		return Serialised:sub(0, #Serialised - 2)
	end
	--
	function utility:Sort(Table1, Table2)
		local Table3 = {}
		--
		for Index, Value in pairs(Table2) do
			if table.find(Table1, Index) then
				Table3[#Table3 + 1] = Value
			end
		end
		--
		return Table3
	end
	-- [[ // UI Functions // ]]
	function library:CreateWindow(Properties)
		Properties = Properties or {}
		--
		local Window = {
			Pages = {},
			Accent = Color3.fromRGB(138, 202, 0), -- Color3.fromRGB(136, 180, 57) -- Change if wanted
			Enabled = true,
			Key = Enum.KeyCode.Delete -- Change if wanted
		}
		--
		do
			local ScreenGui = utility:RenderObject("ScreenGui", {
				DisplayOrder = 9999,
				Enabled = true,
				IgnoreGuiInset = true,
				Parent = cre,
				ResetOnSpawn = false,
				ZIndexBehavior = "Global"
			})
			-- //
			local ScreenGui_MainFrame = utility:RenderObject("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(25, 25, 25),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Parent = ScreenGui,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 660, 0, 560)
			})
			-- //
			local ScreenGui_MainFrame_InnerBorder = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = ScreenGui_MainFrame,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2)
			})
			-- //
			local MainFrame_InnerBorder_InnerFrame = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(60, 60, 60),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Parent = ScreenGui_MainFrame,
				Position = UDim2.new(0, 3, 0, 3),
				Size = UDim2.new(1, -6, 1, -6)
			})
			-- //
			local InnerBorder_InnerFrame_Tabs = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = MainFrame_InnerBorder_InnerFrame,
				Position = UDim2.new(0, 0, 0, 4),
				Size = UDim2.new(0, 74, 1, -4)
			})
			--
			local InnerBorder_InnerFrame_Pages = utility:RenderObject("Frame", {
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = MainFrame_InnerBorder_InnerFrame,
				Position = UDim2.new(1, 0, 0, 4),
				Size = UDim2.new(1, -73, 1, -4)
			})
			--
			local InnerBorder_InnerFrame_TopGradient = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = MainFrame_InnerBorder_InnerFrame,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 4)
			})
			-- //
			local InnerFrame_Tabs_List = utility:RenderObject("UIListLayout", {
				Padding = UDim.new(0, 4),
				Parent = InnerBorder_InnerFrame_Tabs,
				FillDirection = "Vertical",
				HorizontalAlignment = "Left",
				VerticalAlignment = "Top"
			})
			--
			local InnerFrame_Tabs_Padding = utility:RenderObject("UIPadding", {
				Parent = InnerBorder_InnerFrame_Tabs,
				PaddingTop = UDim.new(0, 9)
			})
			--
			local InnerFrame_Pages_InnerBorder = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(45, 45, 45),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = InnerBorder_InnerFrame_Pages,
				Position = UDim2.new(0, 1, 0, 0),
				Size = UDim2.new(1, -1, 1, 0)
			})
			--
			local InnerFrame_TopGradient_Gradient = utility:RenderObject("ImageLabel", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = InnerBorder_InnerFrame_TopGradient,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				Image = "rbxassetid://8508019876",
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			})
			-- //
			local Pages_InnerBorder_InnerFrame = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = InnerFrame_Pages_InnerBorder,
				Position = UDim2.new(0, 1, 0, 0),
				Size = UDim2.new(1, -1, 1, 0)
			})
			-- //
			local InnerBorder_InnerFrame_Folder = utility:RenderObject("Folder", {
				Parent = Pages_InnerBorder_InnerFrame
			})
			--
			local InnerBorder_InnerFrame_Pattern = utility:RenderObject("ImageLabel", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Pages_InnerBorder_InnerFrame,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Image = "rbxassetid://8547666218",
				ImageColor3 = Color3.fromRGB(12, 12, 12),
				ScaleType = "Tile",
				TileSize = UDim2.new(0, 8, 0, 8)
			})
			--
			do -- // Functions
				function Window:SetPage(Page)
					for index, page in pairs(Window.Pages) do
						if page.Open and page ~= Page then
							page:Set(false)
						end
					end
				end
				--
				function Window:Fade(state)
					for index, render in pairs(library.Renders) do
						if not render[3] then
							if render[1].ClassName == "Frame" and (render[2]["BackgroundTransparency"] or 0) ~= 1 then
								tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {BackgroundTransparency = state and (render[2]["BackgroundTransparency"] or 0) or 1}):Play()
							elseif render[1].ClassName == "ImageLabel" then
								if (render[2]["BackgroundTransparency"] or 0) ~= 1 then
									tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {BackgroundTransparency = state and (render[2]["BackgroundTransparency"] or 0) or 1}):Play()
								end
								--
								if (render[2]["ImageTransparency"] or 0) ~= 1 then
									tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {ImageTransparency = state and (render[2]["ImageTransparency"] or 0) or 1}):Play()
								end
							elseif render[1].ClassName == "TextLabel" then
								if (render[2]["BackgroundTransparency"] or 0) ~= 1 then
									tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {BackgroundTransparency = state and (render[2]["BackgroundTransparency"] or 0) or 1}):Play()
								end
								--
								if (render[2]["TextTransparency"] or 0) ~= 1 then
									tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {TextTransparency = state and (render[2]["TextTransparency"] or 0) or 1}):Play()
								end
							elseif render[1].ClassName == "ScrollingFrame" then
								if (render[2]["BackgroundTransparency"] or 0) ~= 1 then
									tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {BackgroundTransparency = state and (render[2]["BackgroundTransparency"] or 0) or 1}):Play()
								end
								--
								if (render[2]["ScrollBarImageTransparency"] or 0) ~= 1 then
									tws:Create(render[1], TweenInfo.new(render[4] or 0.25, Enum.EasingStyle["Linear"], state and Enum.EasingDirection["Out"] or Enum.EasingDirection["In"]), {ScrollBarImageTransparency = state and (render[2]["ScrollBarImageTransparency"] or 0) or 1}):Play()
								end
							end
						end
					end
				end
				--
				function Window:Unload()
					ScreenGui:Remove()
					--
					for index, connection in pairs(library.Connections) do
						connection:Disconnect()
					end
					--
					library = nil
					utility = nil
				end
			end
			--
			do -- // Index Setting
				Window["TabsHolder"] = InnerBorder_InnerFrame_Tabs
				Window["PagesHolder"] = InnerBorder_InnerFrame_Folder
			end
			--
			do -- // Connections
				utility:CreateConnection(uis.InputBegan, function(Input)
					if Input.KeyCode and Input.KeyCode == Window.Key then
						ScreenGui.Enabled = not ScreenGui.Enabled
						--
						Window:Fade(ScreenGui.Enabled)
					elseif Input.KeyCode and Input.KeyCode == Enum.KeyCode.X then
						ScreenGui:Unload()
					end
				end)
			end
		end
		--
		return setmetatable(Window, library)
	end
	--
	function library:CreatePage(Properties)
		Properties = Properties or {}
		--
		local Page = {
			Image = (Properties.image or Properties.Image or Properties.icon or Properties.Icon),
			Size = (Properties.size or Properties.Size or UDim2.new(0, 50, 0, 50)),
			Open = false,
			Window = self
		}
		--
		do
			local Page_Tab = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page.Window["TabsHolder"],
				Size = UDim2.new(1, 0, 0, 72)
			})
			-- //
			local Page_Tab_Border = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page_Tab,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = false,
				ZIndex = 2,
				RenderTime = 0.15
			})
			--
			local Page_Tab_Image = utility:RenderObject("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page_Tab,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = Page.Size,
				ZIndex = 2,
				Image = Page.Image,
				ImageColor3 = Color3.fromRGB(100, 100, 100)
			})
			--
			local Page_Tab_Button = utility:RenderObject("TextButton", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page_Tab,
				Size = UDim2.new(1, 0, 1, 0),
				Text = ""
			})
			-- //
			local Tab_Border_Inner = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page_Tab_Border,
				Position = UDim2.new(0, 0, 0, 1),
				Size = UDim2.new(1, 1, 1, -2),
				ZIndex = 2,
				RenderTime = 0.15
			})
			-- //
			local Border_Inner_Inner = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Tab_Border_Inner,
				Position = UDim2.new(0, 0, 0, 1),
				Size = UDim2.new(1, 0, 1, -2),
				ZIndex = 2,
				RenderTime = 0.15
			})
			--
			local Inner_Inner_Pattern = utility:RenderObject("ImageLabel", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Border_Inner_Inner,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Image = "rbxassetid://8509210785",
				ImageColor3 = Color3.fromRGB(12, 12, 12),
				ScaleType = "Tile",
				TileSize = UDim2.new(0, 8, 0, 8),
				ZIndex = 2
			})
			-- //
			local Page_Page = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page.Window["PagesHolder"],
				Position = UDim2.new(0, 20, 0, 20),
				Size = UDim2.new(1, -40, 1, -40),
				Visible = false
			})
			-- //
			local Page_Page_Left = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page_Page,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0.5, -10, 1, 0)
			})
			--
			local Page_Page_Right = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Page_Page,
				Position = UDim2.new(0.5, 10, 0, 0),
				Size = UDim2.new(0.5, -10, 1, 0)
			})
			-- //
			local Page_Left_List = utility:RenderObject("UIListLayout", {
				Padding = UDim.new(0, 18),
				Parent = Page_Page_Left,
				FillDirection = "Vertical",
				HorizontalAlignment = "Left",
				VerticalAlignment = "Top"
			})
			--
			local Page_Right_List = utility:RenderObject("UIListLayout", {
				Padding = UDim.new(0, 18),
				Parent = Page_Page_Right,
				FillDirection = "Vertical",
				HorizontalAlignment = "Left",
				VerticalAlignment = "Top"
			})
			--
			do -- // Index Setting
				Page["Page"] = Page_Page
				Page["Left"] = Page_Page_Left
				Page["Right"] = Page_Page_Right
			end
			--
			do -- // Functions
				function Page:Set(state)
					Page.Open = state
					--
					Page_Page.Visible = Page.Open
					Page_Tab_Border.Visible = Page.Open
					Page_Tab_Image.ImageColor3 = Page.Open and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(90, 90, 90)
					--
					if Page.Open then
						Page.Window:SetPage(Page)
					end
				end
			end
			--
			do -- // Connections
				utility:CreateConnection(Page_Tab_Button.MouseButton1Click, function(Input)
					if not Page.Open then
						Page:Set(true)
					end
				end)
				--
				utility:CreateConnection(Page_Tab_Button.MouseEnter, function(Input)
					Page_Tab_Image.ImageColor3 = Color3.fromRGB(172, 172, 172)
				end)
				--
				utility:CreateConnection(Page_Tab_Button.MouseLeave, function(Input)
					Page_Tab_Image.ImageColor3 = Page.Open and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(90, 90, 90)
				end)
			end
		end
		--
		if #Page.Window.Pages == 0 then Page:Set(true) end
		Page.Window.Pages[#Page.Window.Pages + 1] = Page
		return setmetatable(Page, pages)
	end
	--
	function pages:CreateSection(Properties)
		Properties = Properties or {}
		--
		local Section = {
			Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or "New Section"),
			Size = (Properties.size or Properties.Size or 150),
			Side = (Properties.side or Properties.Side or "Left"),
			Content = {},
			Window = self.Window,
			Page = self
		}
		--
		do
			local Section_Holder = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(12, 12, 12),
				BorderMode = "Inset",
				BorderSizePixel = 1,
				Parent = Section.Page[Section.Side],
				Size = UDim2.new(1, 0, 0, Section.Size),
				ZIndex = 2
			})
			-- //
			local Section_Holder_Extra = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 2
			})
			--
			local Section_Holder_Frame = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(23, 23, 23),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 2
			})
			--
			local Section_Holder_TitleInline = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(23, 23, 23),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder,
				Position = UDim2.new(0, 9, 0, -1),
				Size = UDim2.new(0, 0, 0, 2),
				ZIndex = 5
			})
			--
			local Section_Holder_Title = utility:RenderObject("TextLabel", {
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder,
				Position = UDim2.new(0, 12, 0, 0),
				Size = UDim2.new(1, -26, 0, 15),
				ZIndex = 5,
				Font = "Code",
				RichText = true,
				Text = "<b>" .. Section.Name .. "</b>",
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextSize = 11,
				TextStrokeTransparency = 1,
				TextXAlignment = "Left"
			})
			-- //
			local Holder_Extra_Gradient1 = utility:RenderObject("ImageLabel", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Extra,
				Position = UDim2.new(0, 1, 0, 1),
				Rotation = 180,
				Size = UDim2.new(1, -2, 0, 20),
				Visible = false,
				ZIndex = 4,
				Image = "rbxassetid://7783533907",
				ImageColor3 = Color3.fromRGB(23, 23, 23)
			})
			--
			local Holder_Extra_Gradient2 = utility:RenderObject("ImageLabel", {
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Extra,
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, -2, 0, 20),
				Visible = false,
				ZIndex = 4,
				Image = "rbxassetid://7783533907",
				ImageColor3 = Color3.fromRGB(23, 23, 23)
			})
			--
			local Holder_Extra_ArrowUp = utility:RenderObject("TextButton", {
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Extra,
				Position = UDim2.new(1, -21, 0, 0),
				Size = UDim2.new(0, 7 + 8, 0, 6 + 8),
				Text = "",
                Visible = false,
				ZIndex = 4
			})
			--
			local Holder_Extra_ArrowDown = utility:RenderObject("TextButton", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Extra,
				Position = UDim2.new(1, -21, 1, -(6 + 8)),
				Size = UDim2.new(0, 7 + 8, 0, 6 + 8),
				Text = "",
                Visible = false,
				ZIndex = 4
			})
			-- //
			local Extra_ArrowUp_Image = utility:RenderObject("ImageLabel", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Holder_Extra_ArrowUp,
				Position = UDim2.new(0, 4, 0, 4),
				Size = UDim2.new(0, 7, 0, 6),
				Visible = true,
				ZIndex = 4,
				Image = "rbxassetid://8548757311",
				ImageColor3 = Color3.fromRGB(205, 205, 205)
			})
			--
			local Extra_ArrowDown_Image = utility:RenderObject("ImageLabel", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Holder_Extra_ArrowDown,
				Position = UDim2.new(0, 4, 0, 4),
				Size = UDim2.new(0, 7, 0, 6),
				Visible = true,
				ZIndex = 4,
				Image = "rbxassetid://8548723563",
				ImageColor3 = Color3.fromRGB(205, 205, 205)
			})
			--
			local Holder_Extra_Bar = utility:RenderObject("Frame", {
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(45, 45, 45),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Extra,
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 6, 1, 0),
				Visible = false,
				ZIndex = 4
			})
			--
			local Holder_Extra_Line = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(45, 45, 45),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Extra,
				Position = UDim2.new(0, 0, 0, -1),
				Size = UDim2.new(1, 0, 0, 1),
				ZIndex = 4
			})
			--
			local Holder_Frame_ContentHolder = utility:RenderObject("ScrollingFrame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Section_Holder_Frame,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 4,
				AutomaticCanvasSize = "Y",
				BottomImage = "rbxassetid://7783554086",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				MidImage = "rbxassetid://7783554086",
				ScrollBarImageColor3 = Color3.fromRGB(65, 65, 65),
				ScrollBarImageTransparency = 0,
				ScrollBarThickness = 5,
				TopImage = "rbxassetid://7783554086",
				VerticalScrollBarInset = "None"
			})
			-- //
			local Frame_ContentHolder_List = utility:RenderObject("UIListLayout", {
				Padding = UDim.new(0, 0),
				Parent = Holder_Frame_ContentHolder,
				FillDirection = "Vertical",
				HorizontalAlignment = "Center",
				VerticalAlignment = "Top"
			})
			--
			local Frame_ContentHolder_Padding = utility:RenderObject("UIPadding", {
				Parent = Holder_Frame_ContentHolder,
				PaddingTop = UDim.new(0, 15),
				PaddingBottom = UDim.new(0, 15)
			})
			--
			do -- // Section Init
				Section_Holder_TitleInline.Size = UDim2.new(0, Section_Holder_Title.TextBounds.X + 6, 0, 2)
			end
			--
			do -- // Index Setting
				Section["Holder"] = Holder_Frame_ContentHolder
				Section["Extra"] = Section_Holder_Extra
			end
			--
			do -- // Functions
				function Section:CloseContent()
					if Section.Content.Open then
						Section.Content:Close()
						--
						Section.Content = {}
					end
				end
			end
			--
			do -- // Connections
				utility:CreateConnection(Holder_Frame_ContentHolder:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
					Holder_Extra_Gradient1.Visible = Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y > Holder_Frame_ContentHolder.AbsoluteWindowSize.Y
					Holder_Extra_Gradient2.Visible = Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y > Holder_Frame_ContentHolder.AbsoluteWindowSize.Y
					Holder_Extra_Bar.Visible = Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y > Holder_Frame_ContentHolder.AbsoluteWindowSize.Y
                    --
                    if (Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y > Holder_Frame_ContentHolder.AbsoluteWindowSize.Y) then
                        Holder_Extra_ArrowUp.Visible = (Holder_Frame_ContentHolder.CanvasPosition.Y > 5)
                        Holder_Extra_ArrowDown.Visible = (Holder_Frame_ContentHolder.CanvasPosition.Y + 5 < (Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y - Holder_Frame_ContentHolder.AbsoluteSize.Y))
                    end
				end)
				--
				utility:CreateConnection(Holder_Frame_ContentHolder:GetPropertyChangedSignal("CanvasPosition"), function()
					if Section.Content.Open then
						Section.Content:Close()
						--
						Section.Content = {}
					end
                    --
                    Holder_Extra_ArrowUp.Visible = (Holder_Frame_ContentHolder.CanvasPosition.Y > 1)
                    Holder_Extra_ArrowDown.Visible = (Holder_Frame_ContentHolder.CanvasPosition.Y + 1 < (Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y - Holder_Frame_ContentHolder.AbsoluteSize.Y))
				end)
                --
                utility:CreateConnection(Holder_Extra_ArrowUp.MouseButton1Click, function()
					Holder_Frame_ContentHolder.CanvasPosition = Vector2.new(0, math.clamp(Holder_Frame_ContentHolder.CanvasPosition.Y - 10, 0, Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y - Holder_Frame_ContentHolder.AbsoluteSize.Y))
				end)
                --
                utility:CreateConnection(Holder_Extra_ArrowDown.MouseButton1Click, function()
					Holder_Frame_ContentHolder.CanvasPosition = Vector2.new(0, math.clamp(Holder_Frame_ContentHolder.CanvasPosition.Y + 10, 0, Holder_Frame_ContentHolder.AbsoluteCanvasSize.Y - Holder_Frame_ContentHolder.AbsoluteSize.Y))
				end)
			end
		end
		--
		return setmetatable(Section, sections)
	end
	--
	do -- // Content
		function sections:CreateToggle(Properties)
			Properties = Properties or {}
			--
			local Content = {
				Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or "New Toggle"),
				State = (Properties.state or Properties.State or Properties.def or Properties.Def or Properties.default or Properties.Default or false),
				Callback = (Properties.callback or Properties.Callback or Properties.callBack or Properties.CallBack or function() end),
				Window = self.Window,
				Page = self.Page,
				Section = self
			}
			--
			do
				local Content_Holder = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content.Section.Holder,
					Size = UDim2.new(1, 0, 0, 8 + 10),
					ZIndex = 3
				})
				-- //
				local Content_Holder_Outline = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(12, 12, 12),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 20, 0, 5),
					Size = UDim2.new(0, 8, 0, 8),
					ZIndex = 3
				})
				--
				local Content_Holder_Title = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -41, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_Title2 = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -41, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextTransparency = 0.5,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_Button = utility:RenderObject("TextButton", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Size = UDim2.new(1, 0, 1, 0),
					Text = ""
				})
				-- //
				local Holder_Outline_Frame = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(77, 77, 77),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder_Outline,
					Position = UDim2.new(0, 1, 0, 1),
					Size = UDim2.new(1, -2, 1, -2),
					ZIndex = 3
				})
				-- //
				local Outline_Frame_Gradient = utility:RenderObject("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(140, 140, 140)),
					Enabled = true,
					Rotation = 90,
					Parent = Holder_Outline_Frame
				})
				--
				do -- // Functions
					function Content:Set(state)
						Content.State = state
						--
						Holder_Outline_Frame.BackgroundColor3 = Content.State and Content.Window.Accent or Color3.fromRGB(77, 77, 77)
						--
						Content.Callback(Content:Get())
					end
					--
					function Content:Get()
						return Content.State
					end
				end
				--
				do -- // Connections
					utility:CreateConnection(Content_Holder_Button.MouseButton1Click, function(Input)
						Content:Set(not Content:Get())
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseEnter, function(Input)
						Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(180, 180, 180))
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseLeave, function(Input)
						Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(140, 140, 140))
					end)
				end
				--
				Content:Set(Content.State)
			end
			--
			return Content
		end
		--
		function sections:CreateSlider(Properties)
			Properties = Properties or {}
			--
			local Content = {
				Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or nil),
				State = (Properties.state or Properties.State or Properties.def or Properties.Def or Properties.default or Properties.Default or false),
				Min = (Properties.min or Properties.Min or Properties.minimum or Properties.Minimum or 0),
				Max = (Properties.max or Properties.Max or Properties.maxmimum or Properties.Maximum or 100),
				Ending = (Properties.ending or Properties.Ending or Properties.suffix or Properties.Suffix or ""),
				Decimals = (1 / (Properties.decimals or Properties.Decimals or Properties.tick or Properties.Tick or 1)),
				Callback = (Properties.callback or Properties.Callback or Properties.callBack or Properties.CallBack or function() end),
				Holding = false,
				Window = self.Window,
				Page = self.Page,
				Section = self
			}
			--
			do
				local Content_Holder = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content.Section.Holder,
					Size = UDim2.new(1, 0, 0, (Content.Name and 24 or 13) + 5),
					ZIndex = 3
				})
				-- //
				local Content_Holder_Outline = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(12, 12, 12),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 40, 0, Content.Name and 18 or 5),
					Size = UDim2.new(1, -99, 0, 7),
					ZIndex = 3
				})
				--
				if Content.Name then
					local Content_Holder_Title = utility:RenderObject("TextLabel", {
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = Color3.fromRGB(0, 0, 0),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Parent = Content_Holder,
						Position = UDim2.new(0, 41, 0, 4),
						Size = UDim2.new(1, -41, 0, 10),
						ZIndex = 3,
						Font = "Code",
						RichText = true,
						Text = Content.Name,
						TextColor3 = Color3.fromRGB(205, 205, 205),
						TextSize = 9,
						TextStrokeTransparency = 1,
						TextXAlignment = "Left"
					})
					--
					local Content_Holder_Title2 = utility:RenderObject("TextLabel", {
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = Color3.fromRGB(0, 0, 0),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						Parent = Content_Holder,
						Position = UDim2.new(0, 41, 0, 4),
						Size = UDim2.new(1, -41, 0, 10),
						ZIndex = 3,
						Font = "Code",
						RichText = true,
						Text = Content.Name,
						TextColor3 = Color3.fromRGB(205, 205, 205),
						TextSize = 9,
						TextStrokeTransparency = 1,
						TextTransparency = 0.5,
						TextXAlignment = "Left"
					})
				end
				--
				local Content_Holder_Button = utility:RenderObject("TextButton", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Size = UDim2.new(1, 0, 1, 0),
					Text = ""
				})
				-- //
				local Holder_Outline_Frame = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(71, 71, 71),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder_Outline,
					Position = UDim2.new(0, 1, 0, 1),
					Size = UDim2.new(1, -2, 1, -2),
					ZIndex = 3
				})
				-- //
				local Outline_Frame_Slider = utility:RenderObject("Frame", {
					BackgroundColor3 = Content.Window.Accent,
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Holder_Outline_Frame,
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(0, 0, 1, 0),
					ZIndex = 3
				})
				--
				local Outline_Frame_Gradient = utility:RenderObject("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(175, 175, 175)),
					Enabled = true,
					Rotation = 270,
					Parent = Holder_Outline_Frame
				})
                -- //
                local Frame_Slider_Gradient = utility:RenderObject("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(175, 175, 175)),
					Enabled = true,
					Rotation = 90,
					Parent = Outline_Frame_Slider
				})
				-- //
				local Frame_Slider_Title = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Outline_Frame_Slider,
					Position = UDim2.new(1, 0, 0.5, 1),
					Size = UDim2.new(0, 2, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = "",
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 11,
					TextStrokeTransparency = 0.5,
					TextXAlignment = "Center",
					RenderTime = 0.15
				})
				--
				local Frame_Slider_Title2 = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Outline_Frame_Slider,
					Position = UDim2.new(1, 0, 0.5, 1),
					Size = UDim2.new(0, 2, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = "",
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 11,
					TextStrokeTransparency = 0.5,
					TextTransparency = 0,
					TextXAlignment = "Center",
					RenderTime = 0.15
				})
				--
				do -- // Functions
					function Content:Set(state)
						Content.State = math.clamp(math.round(state * Content.Decimals) / Content.Decimals, Content.Min, Content.Max)
						--
						Frame_Slider_Title.Text = "<b>" .. Content.State .. Content.Ending .. "</b>"
						Outline_Frame_Slider.Size = UDim2.new((1 - ((Content.Max - Content.State) / (Content.Max - Content.Min))), 0, 1, 0)
						--
						Content.Callback(Content:Get())
					end
					--
					function Content:Refresh()
						local Mouse = utility:MouseLocation()
						--
						Content:Set(math.clamp(math.floor((Content.Min + (Content.Max - Content.Min) * math.clamp(Mouse.X - Outline_Frame_Slider.AbsolutePosition.X, 0, Holder_Outline_Frame.AbsoluteSize.X) / Holder_Outline_Frame.AbsoluteSize.X) * Content.Decimals) / Content.Decimals, Content.Min, Content.Max))
					end
					--
					function Content:Get()
						return Content.State
					end
				end
				--
				do -- // Connections
					utility:CreateConnection(Content_Holder_Button.MouseButton1Down, function(Input)
						Content:Refresh()
						--
						Content.Holding = true
                        --
                        Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(215, 215, 215))
                        Frame_Slider_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(215, 215, 215))
					end)
                    --
					utility:CreateConnection(Content_Holder_Button.MouseEnter, function(Input)
						Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(215, 215, 215))
                        Frame_Slider_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(215, 215, 215))
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseLeave, function(Input)
						Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Content.Holding and Color3.fromRGB(215, 215, 215) or Color3.fromRGB(175, 175, 175))
                        Frame_Slider_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Content.Holding and Color3.fromRGB(215, 215, 215) or Color3.fromRGB(175, 175, 175))
					end)
					--
					utility:CreateConnection(uis.InputChanged, function(Input)
						if Content.Holding then
							Content:Refresh()
						end
					end)
					--
					utility:CreateConnection(uis.InputEnded, function(Input)
						if Content.Holding and Input.UserInputType == Enum.UserInputType.MouseButton1 then
							Content.Holding = false
                            --
                            Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(175, 175, 175))
                        	Frame_Slider_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(175, 175, 175))
						end
					end)
				end
				--
				Content:Set(Content.State)
			end
			--
			return Content
		end
		--
		function sections:CreateKeybind(Properties)
			Properties = Properties or {}
			--
			local Content = {
				Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or "New Toggle"),
				State = (Properties.state or Properties.State or Properties.def or Properties.Def or Properties.default or Properties.Default or nil),
                Mode = (Properties.mode or Properties.Mode or "Hold"),
				Callback = (Properties.callback or Properties.Callback or Properties.callBack or Properties.CallBack or function() end),
                Active = false,
                Holding = false,
				Window = self.Window,
				Page = self.Page,
				Section = self
			}
            --
            local Keys = {
                KeyCodes = {"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", "One", "Two", "Three", "Four", "Five", "Six", "Seveen", "Eight", "Nine", "0", "Insert", "Tab", "Home", "End", "LeftAlt", "LeftControl", "LeftShift", "RightAlt", "RightControl", "RightShift", "CapsLock"},
                Inputs = {"MouseButton1", "MouseButton2", "MouseButton3"},
                Shortened = {["MouseButton1"] = "M1", ["MouseButton2"] = "M2", ["MouseButton3"] = "M3", ["Insert"] = "INS", ["LeftAlt"] = "LA", ["LeftControl"] = "LC", ["LeftShift"] = "LS", ["RightAlt"] = "RA", ["RightControl"] = "RC", ["RightShift"] = "RS", ["CapsLock"] = "CL"}
            }
			--
			do
				local Content_Holder = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content.Section.Holder,
					Size = UDim2.new(1, 0, 0, 8 + 10),
					ZIndex = 3
				})
				-- //
				local Content_Holder_Title = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -41, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_Title2 = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -41, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextTransparency = 0.5,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_Button = utility:RenderObject("TextButton", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Size = UDim2.new(1, 0, 1, 0),
					Text = ""
				})
                -- //
                local Content_Holder_Value = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -61, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text =  "",
					TextColor3 = Color3.fromRGB(114, 114, 114),
                    TextStrokeColor3 = Color3.fromRGB(15, 15, 15),
					TextSize = 9,
					TextStrokeTransparency = 0,
					TextXAlignment = "Right"
				})
				--
				do -- // Functions
					function Content:Set(state)
						Content.State = state or {}
                        Content.Active = false
                        --
                        Content_Holder_Value.Text = "[" .. (#Content:Get() > 0 and Content:Shorten(Content:Get()[2]) or "-") .. "]"
						--
						Content.Callback(Content:Get())
					end
					--
					function Content:Get()
						return Content.State
					end
                    --
                    function Content:Shorten(Str)
                        for Index, Value in pairs(Keys.Shortened) do
                            Str = string.gsub(Str, Index, Value)
                        end
                        --
                        return Str
                    end
                    --
                    function Content:Change(Key)
                        if Key.EnumType then
                            if Key.EnumType == Enum.KeyCode or Key.EnumType == Enum.UserInputType then
                                if table.find(Keys.KeyCodes, Key.Name) or table.find(Keys.Inputs, Key.Name) then
                                    Content:Set({Key.EnumType == Enum.KeyCode and "KeyCode" or "UserInputType", Key.Name})
                                    return true
                                end
                            end
                        end
                    end
				end
				--
				do -- // Connections
					utility:CreateConnection(Content_Holder_Button.MouseButton1Click, function(Input)
						Content.Holding = true
                        --
                        Content_Holder_Value.TextColor3 = Color3.fromRGB(255, 0, 0)
					end)
                    --
                    utility:CreateConnection(Content_Holder_Button.MouseButton2Click, function(Input)
						Content:Set()
					end)
                    --
					utility:CreateConnection(Content_Holder_Button.MouseEnter, function(Input)
						Content_Holder_Value.TextColor3 = Color3.fromRGB(164, 164, 164)
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseLeave, function(Input)
						Content_Holder_Value.TextColor3 = Content.Holding and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(114, 114, 114)
					end)
                    --
                    utility:CreateConnection(uis.InputBegan, function(Input)
                        if Content.Holding then
                            local Success = Content:Change(Input.KeyCode.Name ~= "Unknown" and Input.KeyCode or Input.UserInputType)
                            --
                            if Success then
                                Content.Holding = false
                                --
                                Content_Holder_Value.TextColor3 = Color3.fromRGB(114, 114, 114)
                            end
                        end
                        --
                        if Content:Get()[1] and Content:Get()[2] then
                            if Input.KeyCode == Enum[Content:Get()[1]][Content:Get()[2]] or Input.UserInputType == Enum[Content:Get()[1]][Content:Get()[2]] then
                                if Content.Mode == "Hold" then
                                    Content.Active = true
                                elseif Content.Mode == "Toggle" then
                                    Content.Active = not Content.Active
                                end
                            end
                        end
                    end)
                    --
                    utility:CreateConnection(uis.InputEnded, function(Input)
                        if Content:Get()[1] and Content:Get()[2] then
                            if Input.KeyCode == Enum[Content:Get()[1]][Content:Get()[2]] or Input.UserInputType == Enum[Content:Get()[1]][Content:Get()[2]] then
                                if Content.Mode == "Hold" then
                                    Content.Active = false
                                end
                            end
                        end
                    end)
				end
				--
				Content:Set(Content.State)
			end
			--
			return Content
		end
		--
		function sections:CreateColorpicker(Properties)
			Properties = Properties or {}
			--
			local Content = {
				Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or "New Toggle"),
				State = (Properties.state or Properties.State or Properties.def or Properties.Def or Properties.default or Properties.Default or Color3.fromRGB(255, 255, 255)),
				Callback = (Properties.callback or Properties.Callback or Properties.callBack or Properties.CallBack or function() end),
				Content = {
					Open = false
				},
				Window = self.Window,
				Page = self.Page,
				Section = self
			}
			--
			do
				local Content_Holder = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content.Section.Holder,
					Size = UDim2.new(1, 0, 0, 8 + 10),
					ZIndex = 3
				})
				-- //
				local Content_Holder_Outline = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(12, 12, 12),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(1, -38, 0, 4),
					Size = UDim2.new(0, 17, 0, 9),
					ZIndex = 3
				})
				--
				local Content_Holder_Title = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -41, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_Title2 = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 0),
					Size = UDim2.new(1, -41, 1, 0),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextTransparency = 0.5,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_Button = utility:RenderObject("TextButton", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Size = UDim2.new(1, 0, 1, 0),
					Text = ""
				})
				-- //
				local Holder_Outline_Frame = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder_Outline,
					Position = UDim2.new(0, 1, 0, 1),
					Size = UDim2.new(1, -2, 1, -2),
					ZIndex = 3
				})
				-- //
				local Outline_Frame_Gradient = utility:RenderObject("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(140, 140, 140)),
					Enabled = true,
					Rotation = 90,
					Parent = Holder_Outline_Frame
				})
				--
				do -- // Functions
					function Content:Set(state)
						Content.State = state
						--
						Holder_Outline_Frame.BackgroundColor3 = Content.State
						--
						Content.Callback(Content:Get())
					end
					--
					function Content:Get()
						return Content.State
					end
					--
					function Content:Open()
						Content.Section:CloseContent()
						--
						local Connections = {}
						--
						local InputCheck
						--
						local Content_Open_Holder = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Content.Section.Extra,
							Position = UDim2.new(0, Content_Holder_Outline.AbsolutePosition.X - Content.Section.Extra.AbsolutePosition.X, 0, Content_Holder_Outline.AbsolutePosition.Y - Content.Section.Extra.AbsolutePosition.Y + 10),
							Size = UDim2.new(0, 180, 0, 175),
							ZIndex = 6
						})
						-- //
						local Open_Holder_Button = utility:RenderObject("TextButton", {
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Content_Open_Holder,
							Position = UDim2.new(0, -1, 0, -1),
							Size = UDim2.new(1, 2, 1, 2),
							Text = ""
						})
						-- //
						local Open_Holder_Outline = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(60, 60, 60),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(12, 12, 12),
							BorderMode = "Inset",
							BorderSizePixel = 1,
							Parent = Content_Open_Holder,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 6
						})
						-- //
						local Open_Outline_Frame = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(40, 40, 40),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Open_Holder_Outline,
							Position = UDim2.new(0, 1, 0, 1),
							Size = UDim2.new(1, -2, 1, -2),
							ZIndex = 6
						})
						-- //
						local ValSat_Picker_Outline = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(12, 12, 12),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Open_Outline_Frame,
							Position = UDim2.new(0, 2, 0, 2),
							Size = UDim2.new(0, 152, 0, 152),
							ZIndex = 6
						})
						--
						local Hue_Picker_Outline = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(12, 12, 12),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Open_Outline_Frame,
							Position = UDim2.new(1, -19, 0, 2),
							Size = UDim2.new(0, 17, 0, 152),
							ZIndex = 6
						})
						--
						local Transparency_Picker_Outline = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(12, 12, 12),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Open_Outline_Frame,
							Position = UDim2.new(0, 2, 1, -14),
							Size = UDim2.new(0, 152, 0, 12),
							ZIndex = 6
						})
						-- //
						local ValSat_Picker_Color = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 12, 12),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = ValSat_Picker_Outline,
							Position = UDim2.new(0, 1, 0, 1),
							Size = UDim2.new(1, -2, 1, -2),
							ZIndex = 6
						})
						--
						do -- // Functions
							function Content.Content:Close()
								Content.Content.Open = false
								--
								for Index, Value in pairs(Connections) do
									Value:Disconnect()
								end
								--
								InputCheck:Disconnect()
								--
								Content_Open_Holder:Remove()
								--
								function Content.Content:Refresh() end
								--
								InputCheck = nil
								Connections = nil
							end
							--
							function Content.Content:Refresh(state)
							end
						end
						--
						Content.Content.Open = true
						Content.Section.Content = Content.Content
						--
						do -- // Connections
							InputCheck = utility:CreateConnection(uis.InputBegan, function(Input)
								if Content.Content.Open and Input.UserInputType == Enum.UserInputType.MouseButton1 then
									local Mouse = utility:MouseLocation()
									--
									if not (Mouse.X > Content_Open_Holder.AbsolutePosition.X and Mouse.Y > (Content_Open_Holder.AbsolutePosition.Y + 36) and Mouse.X < (Content_Open_Holder.AbsolutePosition.X + Content_Open_Holder.AbsoluteSize.X) and Mouse.Y < (Content_Open_Holder.AbsolutePosition.Y + Content_Open_Holder.AbsoluteSize.Y + 36)) then
										if not (Mouse.X > Content_Holder.AbsolutePosition.X and Mouse.Y > (Content_Holder.AbsolutePosition.Y) and Mouse.X < (Content_Holder.AbsolutePosition.X + Content_Holder.AbsoluteSize.X) and Mouse.Y < (Content_Holder.AbsolutePosition.Y + Content_Holder.AbsoluteSize.Y)) then
											if Content.Content.Open then
												Content.Section:CloseContent()
											end
										end
									end
								end
							end)
						end
					end
				end
				--
				do -- // Connections
					utility:CreateConnection(Content_Holder_Button.MouseButton1Click, function(Input)
						if Content.Content.Open then
							Content.Section:CloseContent()
						else
							Content:Open()
						end
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseEnter, function(Input)
						Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(180, 180, 180))
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseLeave, function(Input)
						Outline_Frame_Gradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(140, 140, 140))
					end)
				end
				--
				Content:Set(Content.State)
			end
			--
			return Content
		end
		--
		function sections:CreateButton(Properties)
			Properties = Properties or {}
			--
			local Content = {
				Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or "New Button"),
				Callback = (Properties.callback or Properties.Callback or Properties.callBack or Properties.CallBack or function() end),
				Window = self.Window,
				Page = self.Page,
				Section = self
			}
			--
			local Content_Holder = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Content.Section.Holder,
				Size = UDim2.new(1, 0, 0, 8 + 10),
				ZIndex = 3
			})

			local Content_Label = utility:RenderObject("TextLabel", {
				AnchorPoint = Vector2.new(0, 0),
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Content_Holder,
				Position = UDim2.new(0, 62, 0, 3),
				Size = UDim2.new(1, -100, 1, 0),
				ZIndex = 3,
				Font = "Code",
				Text = Content.Name,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextSize = 9,
				TextXAlignment = "Left"
			})

			local Content_Button = utility:RenderObject("TextButton", {
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(184, 177, 176),
				BackgroundTransparency = 0,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Parent = Content_Holder,
				Position = UDim2.new(0, 50, 0, 6),
				Size = UDim2.new(0, 30, 0, 12),
				ZIndex = 3,
				Font = "Code",
				Text = "click",
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 9
			})

			utility:CreateConnection(Content_Button.MouseButton1Click, function()
				Content.Callback()
			end)

			return Content
		end
		--
		function sections:CreateColorPicker(Properties)
			Properties = Properties or {}
			--
			local Content = {
				Name = (Properties.name or Properties.Name or Properties.title or Properties.Title or "Color Picker"),
				Color = (Properties.color or Properties.Color or Properties.default or Properties.Default or Color3.fromRGB(255, 255, 255)),
				Callback = (Properties.callback or Properties.Callback or function() end),
				Content = {
					Open = false
				},
				Window = self.Window,
				Page = self.Page,
				Section = self
			}
			--
			do
				local Content_Holder = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content.Section.Holder,
					Size = UDim2.new(1, 0, 0, 34 + 5),
					ZIndex = 3
				})
				--
				local Content_Holder_Outline = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(12, 12, 12),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 40, 0, 15),
					Size = UDim2.new(1, -98, 0, 20),
					ZIndex = 3
				})
				--
				local Content_Holder_Title = utility:RenderObject("TextLabel", {
					AnchorPoint = Vector2.new(0, 0),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Position = UDim2.new(0, 41, 0, 4),
					Size = UDim2.new(1, -41, 0, 10),
					ZIndex = 3,
					Font = "Code",
					RichText = true,
					Text = Content.Name,
					TextColor3 = Color3.fromRGB(205, 205, 205),
					TextSize = 9,
					TextStrokeTransparency = 1,
					TextXAlignment = "Left"
				})
				--
				local Content_Holder_ColorPreview = utility:RenderObject("Frame", {
					BackgroundColor3 = Content.Color,
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder_Outline,
					Position = UDim2.new(1, -20, 0, 2),
					Size = UDim2.new(0, 16, 0, 16),
					ZIndex = 3
				})
				--
				local Content_Holder_Button = utility:RenderObject("TextButton", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					ZIndex = 3,
					Active = true
				})
				--
				local Holder_Outline_Frame = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(36, 36, 36),
					BackgroundTransparency = 0,
					BorderColor3 = Color3.fromRGB(0, 0, 0),
					BorderSizePixel = 0,
					Parent = Content_Holder_Outline,
					Position = UDim2.new(0, 1, 0, 1),
					Size = UDim2.new(1, -2, 1, -2),
					ZIndex = 3
				})
				--
				local Outline_Frame_Gradient = utility:RenderObject("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220)),
					Enabled = true,
					Rotation = 270,
					Parent = Holder_Outline_Frame
				})
				--
				do -- // Functions
					function Content:Set(color)
						Content.Color = color
						Content_Holder_ColorPreview.BackgroundColor3 = color
						Content.Callback(color)
						if Content.Content.Open then
							Content.Content:Refresh(color)
						end
					end
					--
					function Content:Get()
						return Content.Color
					end
					--
					function Content:Open()
						Content.Section:CloseContent()
						--
						local Open = {}
						local Connections = {}
						--
						local InputCheck
						--
						local Content_Open_Holder = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Content.Section.Extra,
							Position = UDim2.new(0, Content_Holder_Outline.AbsolutePosition.X - Content.Section.Extra.AbsolutePosition.X, 0, Content_Holder_Outline.AbsolutePosition.Y - Content.Section.Extra.AbsolutePosition.Y + 21),
							Size = UDim2.new(1, -98, 0, 100),
							ZIndex = 6,
							ClipsDescendants = true
						})
						--
						local Open_Holder_Outline = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(12, 12, 12),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Content_Open_Holder,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 6
						})
						--
						local Open_Holder_Outline_Frame = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Open_Holder_Outline,
							Position = UDim2.new(0, 1, 0, 1),
							Size = UDim2.new(1, -2, 0, 80),
							ZIndex = 6
						})
						--
						local ColorPalette = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = Open_Holder_Outline_Frame,
							Position = UDim2.new(0, 2, 0, 2),
							Size = UDim2.new(1, -4, 1, -4),
							ZIndex = 6
						})
						--
						local Palette_Gradient_Hue = utility:RenderObject("UIGradient", {
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
								ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
								ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
								ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
								ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
								ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
							}),
							Rotation = 0,
							Parent = ColorPalette
						})
						--
						local Palette_Gradient_Brightness = utility:RenderObject("UIGradient", {
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
							}),
							Rotation = 90,
							Parent = ColorPalette
						})
						--
						local Palette_Selector = utility:RenderObject("Frame", {
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 1,
							Parent = ColorPalette,
							Size = UDim2.new(0, 6, 0, 6),
							ZIndex = 7
						})
						--
						local Palette_Button = utility:RenderObject("TextButton", {
							BackgroundColor3 = Color3.fromRGB(0, 0, 0),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Parent = ColorPalette,
							Size = UDim2.new(1, 0, 1, 0),
							Text = "",
							ZIndex = 7,
							Active = true
						})
						--
						do -- // Functions
							function Content.Content:Close()
								Content.Content.Open = false
								--
								Holder_Outline_Frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
								--
								for _, Value in pairs(Connections) do
									Value:Disconnect()
								end
								--
								if InputCheck then
									InputCheck:Disconnect()
								end
								--
								for _, Value in pairs(Open) do
									Value:Remove()
								end
								--
								Content_Open_Holder:Remove()
								Open_Holder_Outline:Remove()
								Open_Holder_Outline_Frame:Remove()
								ColorPalette:Remove()
								Palette_Gradient_Hue:Remove()
								Palette_Gradient_Brightness:Remove()
								Palette_Selector:Remove()
								Palette_Button:Remove()
								--
								function Content.Content:Refresh() end
								--
								InputCheck = nil
								Connections = nil
								Open = nil
							end
							--
							function Content.Content:Refresh(color)
								local h, s, v = color:ToHSV()
								local x = h
								local y = 1 - v
								Palette_Selector.Position = UDim2.new(x, -3, y, -3)
							end
							--
							local function UpdateColor(input)
								local mousePos = utility:MouseLocation()
								local palettePos = ColorPalette.AbsolutePosition
								local paletteSize = ColorPalette.AbsoluteSize
								local x = math.clamp((mousePos.X - palettePos.X) / paletteSize.X, 0, 1)
								local y = math.clamp((mousePos.Y - palettePos.Y) / paletteSize.Y, 0, 1)
								local hue = x
								local value = 1 - y
								local saturation = 1
								local color = Color3.fromHSV(hue, saturation, value)
								Content:Set(color)
							end
							--
							do -- // Connections
								local Clicked = utility:CreateConnection(Palette_Button.MouseButton1Down, function()
									UpdateColor()
								end)
								--
								local Moved = utility:CreateConnection(Palette_Button.MouseMoved, function()
									if uis:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
										UpdateColor()
									end
								end)
								--
								local Entered = utility:CreateConnection(Palette_Button.MouseEnter, function()
									ColorPalette.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								end)
								--
								local Left = utility:CreateConnection(Palette_Button.MouseLeave, function()
									ColorPalette.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
								end)
								--
								Connections[#Connections + 1] = Clicked
								Connections[#Connections + 1] = Moved
								Connections[#Connections + 1] = Entered
								Connections[#Connections + 1] = Left
							end
							--
							Open[#Open + 1] = ColorPalette
							Open[#Open + 1] = Palette_Gradient_Hue
							Open[#Open + 1] = Palette_Gradient_Brightness
							Open[#Open + 1] = Palette_Selector
							Open[#Open + 1] = Palette_Button
						end
						--
						Content.Content.Open = true
						Content.Section.Content = Content.Content
						--
						Holder_Outline_Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
						--
						do -- // Connections
							task.wait()
							--
							InputCheck = utility:CreateConnection(uis.InputBegan, function(Input)
								if Content.Content.Open and Input.UserInputType == Enum.UserInputType.MouseButton1 then
									local Mouse = utility:MouseLocation()
									local holderPos = Content_Open_Holder.AbsolutePosition
									local holderSize = Content_Open_Holder.AbsoluteSize
									if not (Mouse.X >= holderPos.X and Mouse.Y >= holderPos.Y and Mouse.X <= (holderPos.X + holderSize.X) and Mouse.Y <= (holderPos.Y + holderSize.Y)) then
										Content.Section:CloseContent()
									end
								end
							end)
						end
						--
						Content.Content:Refresh(Content:Get())
					end
				end
				--
				do -- // Connections
					utility:CreateConnection(Content_Holder_Button.MouseButton1Down, function()
						if Content.Content.Open then
							Content.Section:CloseContent()
						else
							Content:Open()
						end
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseEnter, function()
						Holder_Outline_Frame.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
					end)
					--
					utility:CreateConnection(Content_Holder_Button.MouseLeave, function()
						Holder_Outline_Frame.BackgroundColor3 = Content.Content.Open and Color3.fromRGB(46, 46, 46) or Color3.fromRGB(36, 36, 36)
					end)
				end
				--
				Content:Set(Content.Color)
			end
			--
			return Content
		end
		--
		function sections:CreateDropdown(Properties)
			Properties = Properties or {}
			local dropdown = {}
			dropdown.Name = Properties.name or Properties.Name or Properties.title or Properties.Title or "New Dropdown"
			dropdown.State = Properties.state or Properties.State or 1
			dropdown.Options = Properties.options or Properties.Options or { "Option 1", "Option 2", "Option 3" }
			dropdown.Callback = Properties.callback or Properties.Callback or function() end
			dropdown.IsOpen = false
			dropdown.Window = self.Window
			dropdown.Page = self.Page
			dropdown.Section = self

			local container = utility:RenderObject("Frame", {
				BackgroundTransparency = 1,
				Parent = dropdown.Section.Holder,
				Size = UDim2.new(1, 0, 0, 39),
				ZIndex = 3
			})

			utility:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				Parent = container,
				Position = UDim2.new(0, 42, 0, 3),
				Size = UDim2.new(1, -12, 0, 11),
				Font = "Code",
				TextSize = 9,
				TextColor3 = Color3.fromRGB(215, 215, 215),
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = dropdown.Name,
				ZIndex = 3
			})

			local outline = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(12, 12, 12),
				BorderSizePixel = 0,
				Parent = container,
				Position = UDim2.new(0, 40, 0, 18),
				Size = UDim2.new(1, -98, 0, 20),
				ZIndex = 3
			})

			local innerFrame = utility:RenderObject("Frame", {
				BackgroundColor3 = Color3.fromRGB(36, 36, 36),
				BorderSizePixel = 0,
				Parent = outline,
				Position = UDim2.new(0, 1, 0, 1),
				Size = UDim2.new(1, -2, 1, -2),
				ZIndex = 3
			})

			utility:RenderObject("UIGradient", {
				Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220)),
				Rotation = 270,
				Parent = innerFrame
			})

			local mainText = utility:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				Parent = innerFrame,
				Position = UDim2.new(0, 8, 0, 0),
				Size = UDim2.new(1, -8, 1, 0),
				Font = "Code",
				TextSize = 9,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = dropdown.Options[dropdown.State],
				ZIndex = 3
			})

			local shadowText = utility:RenderObject("TextLabel", {
				BackgroundTransparency = 1,
				Parent = innerFrame,
				Position = UDim2.new(0, 8, 0, 0),
				Size = UDim2.new(1, -8, 1, 0),
				Font = "Code",
				TextSize = 9,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				TextTransparency = 0.5,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = dropdown.Options[dropdown.State],
				ZIndex = 3
			})

			utility:RenderObject("ImageLabel", {
				BackgroundTransparency = 1,
				Parent = innerFrame,
				Position = UDim2.new(1, -11, 0.5, -4),
				Size = UDim2.new(0, 7, 0, 6),
				Image = "rbxassetid://8532000591",
				ImageColor3 = Color3.fromRGB(255, 255, 255),
				ZIndex = 3
			})

			local button = utility:RenderObject("TextButton", {
				BackgroundTransparency = 1,
				Parent = container,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				ZIndex = 3
			})

			function dropdown:UpdateDisplay()
				mainText.Text = self.Options[self.State]
				shadowText.Text = self.Options[self.State]
				self.Callback(self.Options[self.State])
			end

			function dropdown:HideDropdown()
				if self.dropdownList then
					self.dropdownList:Destroy()
					self.dropdownList = nil
				end
				self.IsOpen = false
			end

			function dropdown:ShowDropdown()
				self.IsOpen = true

				local mousePos = utility:MouseLocation()

				local parentGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("SkeetGUI") or dropdown.Section.Holder

				self.dropdownList = utility:RenderObject("Frame", {
					BackgroundTransparency = 1,
					Parent = container, -- dropdown'un bağlı olduğu container
					Position = UDim2.new(0, 40, 0, 39), -- 40px soldan, 39px yukardan (dropdown'un altına hizalanmış)
					Size = UDim2.new(1, -98, 0, (#self.Options * 18) + 2),
					ZIndex = 9999999 -- Diğerlerinden biraz daha yüksek tut
				})

				local listOutline = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(12, 12, 12),
					BorderSizePixel = 0,
					Parent = self.dropdownList,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0, 0, 0, 0),
					ZIndex = 9999
				})

				local innerList = utility:RenderObject("Frame", {
					BackgroundColor3 = Color3.fromRGB(35, 35, 35),
					BorderSizePixel = 0,
					Parent = listOutline,
					Position = UDim2.new(0, 1.8, 0.03, 1),
					Size = UDim2.new(1, -3, 0, -1),
					ZIndex = 9999
				})

				for i, option in ipairs(self.Options) do
					local optFrame = utility:RenderObject("Frame", {
						BackgroundColor3 = Color3.fromRGB(35, 35, 35),
						BorderSizePixel = 0,
						Parent = innerList,
						Size = UDim2.new(1, 0, 0, 18),
						Position = UDim2.new(0, 0, 0, 18 * (i - 1)),
						ZIndex = 9999
					})

					utility:RenderObject("TextLabel", {
						BackgroundTransparency = 1,
						Parent = optFrame,
						Position = UDim2.new(0, 8, 0, 0),
						Size = UDim2.new(1, -8, 1, 0),
						Font = "Code",
						TextSize = 9,
						TextColor3 = (i == self.State) and self.Window.Accent or Color3.fromRGB(205, 205, 205),
						Text = tostring(option),
						TextXAlignment = Enum.TextXAlignment.Left,
						ZIndex = 9999
					})

					utility:RenderObject("TextLabel", {
						BackgroundTransparency = 1,
						Parent = optFrame,
						Position = UDim2.new(0, 8, 0, 0),
						Size = UDim2.new(1, -8, 1, 0),
						Font = "Code",
						TextSize = 9,
						TextColor3 = (i == self.State) and self.Window.Accent or Color3.fromRGB(205, 205, 205),
						TextTransparency = 0.5,
						Text = tostring(option),
						TextXAlignment = Enum.TextXAlignment.Left,
						ZIndex = 9999
					})

					local optButton = utility:RenderObject("TextButton", {
						BackgroundTransparency = 1,
						Parent = optFrame,
						Size = UDim2.new(1, 0, 1, 0),
						Text = "",
						ZIndex = 9999
					})

					optButton.MouseEnter:Connect(function()
						optFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					end)

					optButton.MouseLeave:Connect(function()
						optFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					end)

					optButton.MouseButton1Click:Connect(function()
						self.State = i
						self:UpdateDisplay()
						self:HideDropdown()
					end)
				end
			end

			function dropdown:ToggleDropdown()
				if self.IsOpen then
					self:HideDropdown()
				else
					self:ShowDropdown()
				end
			end

			button.MouseButton1Click:Connect(function()
				dropdown:ToggleDropdown()
			end)

			dropdown:UpdateDisplay()
			return dropdown
		end
	end
	--


	-- Servisler
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local Camera = workspace.CurrentCamera
	local LocalPlayer = Players.LocalPlayer

	-- Ayar Değişkenleri
	local masterswitch = false
	local boxesp = false
	local outline = false
	local healthesp = false
	local tracers = false
	local nameesp = false

	local boxthickness = 1
	local outlineThickness = 1.4

	local boxcolor = Color3.new(1, 1, 1)
	local outlineColor = Color3.new(0, 0, 0)
	local tracerColor = Color3.new(1, 1, 1)
	local nameColor = Color3.new(1, 1, 1)

	local healthPosition = "left"
	local healthStartColor = Color3.fromRGB(128, 0, 128)
	local healthEndColor = Color3.fromRGB(0, 0, 255)

	-- Renk geçişi fonksiyonu
	local function lerpColor(colorA, colorB, t)
		return Color3.new(
			colorA.R + (colorB.R - colorA.R) * t,
			colorA.G + (colorB.G - colorA.G) * t,
			colorA.B + (colorB.B - colorA.B) * t
		)
	end

	-- ESP fonksiyonu
	local function CreateESP(player)
		local outlineBox = Drawing.new("Square")
		outlineBox.Filled = false
		outlineBox.Visible = false

		local innerBox = Drawing.new("Square")
		innerBox.Filled = false
		innerBox.Visible = false

		local healthBar = Drawing.new("Line")
		healthBar.Visible = false

		local nameText = Drawing.new("Text")
		nameText.Size = 14
		nameText.Center = true
		nameText.Outline = true
		nameText.Font = 2
		nameText.Visible = false

		local tracerLine = Drawing.new("Line")
		tracerLine.Visible = false

		local function update()
			-- Öncelikle master switch kapalıysa hiçbir şey çizilmesin
			if not masterswitch then
				innerBox.Visible = false
				outlineBox.Visible = false
				healthBar.Visible = false
				nameText.Visible = false
				tracerLine.Visible = false
				return
			end

			if player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
				local head = player.Character.Head
				local root = player.Character.HumanoidRootPart
				local humanoid = player.Character.Humanoid

				local headPos, onScreen1 = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.3, 0))
				local footPos, onScreen2 = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 2.5, 0))

				if onScreen1 and onScreen2 then
					local height = math.abs(headPos.Y - footPos.Y) * 1.2
					local width = height / 1.7
					local x = footPos.X - width / 2
					local y = headPos.Y - (height * 0.1)

					-- Box ESP aktifse çiz
					if boxesp then
						innerBox.Size = Vector2.new(width, height)
						innerBox.Position = Vector2.new(x, y)
						innerBox.Color = boxcolor
						innerBox.Thickness = boxthickness
						innerBox.Visible = true
					else
						innerBox.Visible = false
					end

					-- Outline sadece boxesp açıksa göster
					if outline and boxesp then
						outlineBox.Size = innerBox.Size
						outlineBox.Position = innerBox.Position
						outlineBox.Color = outlineColor
						outlineBox.Thickness = outlineThickness
						outlineBox.Visible = true
					else
						outlineBox.Visible = false
					end

					-- Health ESP, masterswitch açık ve healthesp açıksa çiz (boxesp'e bağlı değil artık)
					if healthesp then
						local hpPercent = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
						local barHeight = height * hpPercent
						local barY = y + height - barHeight
						local barX = (healthPosition == "right") and (x + width + 1) or (x - 3)

						healthBar.From = Vector2.new(barX, y + height)
						healthBar.To = Vector2.new(barX, barY)
						healthBar.Color = lerpColor(healthStartColor, healthEndColor, hpPercent)
						healthBar.Thickness = 2
						healthBar.Visible = true
					else
						healthBar.Visible = false
					end

					-- İsim ESP, masterswitch ve nameesp açıksa çiz (boxesp'e bağlı değil)
					if nameesp then
						nameText.Text = player.DisplayName
						nameText.Position = Vector2.new(x + width / 2, y - 20)
						nameText.Color = nameColor
						nameText.Visible = true
					else
						nameText.Visible = false
					end

					-- Tracers, masterswitch ve tracers açıksa çiz (boxesp'e bağlı değil)
					if tracers then
						local bottom = Vector2.new(x + width / 2, y + height)
						tracerLine.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
						tracerLine.To = bottom
						tracerLine.Color = tracerColor
						tracerLine.Thickness = 1.5
						tracerLine.Visible = true
					else
						tracerLine.Visible = false
					end

					return
				end
			end

			-- Geçersiz durumlarda gizle
			innerBox.Visible = false
			outlineBox.Visible = false
			healthBar.Visible = false
			nameText.Visible = false
			tracerLine.Visible = false
		end

		local conn = RunService.RenderStepped:Connect(update)

		player.AncestryChanged:Connect(function(_, parent)
			if not parent then
				innerBox:Remove()
				outlineBox:Remove()
				healthBar:Remove()
				nameText:Remove()
				tracerLine:Remove()
				conn:Disconnect()
			end
		end)
	end

	-- Mevcut oyunculara uygula
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			CreateESP(player)
		end
	end

	-- Yeni giren oyunculara uygula
	Players.PlayerAdded:Connect(function(player)
		if player ~= LocalPlayer then
			CreateESP(player)
		end
	end)

	-- watermark
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local LocalPlayer = Players.LocalPlayer

	-- Seçenekler (true/false)
	local watermark = false
	local fps = false
	local name = false
	local ms = false

	-- GUI oluştur
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "WatermarkUI"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.Parent = game.CoreGui

	local Frame = Instance.new("Frame")
	Frame.Name = "WatermarkFrame"
	Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Frame.BackgroundTransparency = 0.2
	Frame.Size = UDim2.new(0, 300, 0, 30)
	Frame.Position = UDim2.new(1, -310, 0, 4)
	Frame.BorderSizePixel = 0
	Frame.Parent = ScreenGui

	local Border = Instance.new("UIStroke")
	Border.Thickness = 1
	Border.Color = Color3.fromRGB(60, 60, 60)
	Border.Parent = Frame

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 6)
	Corner.Parent = Frame

	-- Tek bilgi label (tüm metin buraya)
	local InfoLabel = Instance.new("TextLabel")
	InfoLabel.Size = UDim2.new(1, -12, 1, 0) -- Frame içi boşluk için 12 px çıkarıldı
	InfoLabel.Position = UDim2.new(0, 6, 0, 0)
	InfoLabel.BackgroundTransparency = 1
	InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	InfoLabel.Font = Enum.Font.Code
	InfoLabel.TextSize = 14
	InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
	InfoLabel.TextStrokeTransparency = 0.7
	InfoLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
	InfoLabel.Parent = Frame

	-- FPS ve ping değişkenleri
	local lastUpdate = tick()
	local frameCount = 0
	local currentFPS = 0
	local ping = 0

	local function measurePing()
		local startTime = tick()
		RunService.Heartbeat:Wait()
		ping = math.floor((tick() - startTime) * 1000)
	end

	RunService.RenderStepped:Connect(function()
		frameCount += 1
		local now = tick()

		if now - lastUpdate >= 1 then
			currentFPS = frameCount
			frameCount = 0
			lastUpdate = now
			measurePing()
		end

		if not watermark then
			Frame.Visible = false
			InfoLabel.Text = ""
			return
		else
			Frame.Visible = true
		end

		local parts = {}
		table.insert(parts, "GAMESENSE.PUB") -- hep başta

		if name then
			table.insert(parts, LocalPlayer.Name)
		end
		if fps then
			table.insert(parts, "FPS: "..currentFPS)
		end
		if ms then
			table.insert(parts, "MS: "..ping)
		end

		InfoLabel.Text = table.concat(parts, " | ")

		-- Dinamik genişlik hesaplama
		local padding = 12
		local totalWidth = InfoLabel.TextBounds.X + padding + 12
		Frame.Size = UDim2.new(0, totalWidth, 0, 30)
		Frame.Position = UDim2.new(1, -totalWidth - 10, 0, 4)
	end)

	local Players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")

	-- 🔧 Modlar
	local bhop = false
	local tickratebhop = false

	-- Oyuncu ve karakter referansları
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")
	local HRP = Character:WaitForChild("HumanoidRootPart")

	-- Karakter yeniden doğduğunda güncelle
	LocalPlayer.CharacterAdded:Connect(function(char)
		Character = char
		Humanoid = char:WaitForChild("Humanoid")
		HRP = char:WaitForChild("HumanoidRootPart")
	end)

	-- Tuş kontrolü
	local UserInputService = game:GetService("UserInputService")
	local HoldingSpace = false

	UserInputService.InputBegan:Connect(function(input, gpe)
		if input.KeyCode == Enum.KeyCode.Space and not gpe then
			HoldingSpace = true
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Space then
			HoldingSpace = false
		end
	end)

	-- Bhop sistemi
	local RunService = game:GetService("RunService")

	RunService.RenderStepped:Connect(function()
		if not bhop then return end
		if not Character or not Humanoid or not HRP then return end

		if HoldingSpace then
			local speedMultiplier = tickratebhop and 1.45 or 1.1
			local moveDir = Humanoid.MoveDirection

			if moveDir.Magnitude > 0 then
				local boost = Vector3.new(moveDir.X * 50 * speedMultiplier, HRP.Velocity.Y, moveDir.Z * 50 * speedMultiplier)
				HRP.Velocity = boost
			end

			if Humanoid.FloorMaterial ~= Enum.Material.Air then
				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")

	local fastwalk = false
	local normalWalkSpeed = 16
	local multiplier = 2

	local LocalPlayer = Players.LocalPlayer
	local function getHumanoid()
		local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		return character:WaitForChild("Humanoid")
	end

	-- Sürekli kontrol döngüsü
	RunService.RenderStepped:Connect(function()
		local humanoid = getHumanoid()
		if humanoid then
			if fastwalk then
				humanoid.WalkSpeed = normalWalkSpeed * multiplier
			else
				humanoid.WalkSpeed = normalWalkSpeed
			end
		end
	end)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")

	local player = Players.LocalPlayer
	local fly = false -- Menüden true yapılınca aktif olur

	local flySpeed = 50
	local bv, bg
	local hrp, humanoid

	-- Hareket takibi
	local input = {
		W = false,
		A = false,
		S = false,
		D = false,
		Space = false,
		LeftShift = false
	}

	-- Tuş girişleri
	UserInputService.InputBegan:Connect(function(inputObj, gpe)
		if gpe then return end
		local key = inputObj.KeyCode.Name
		if input[key] ~= nil then input[key] = true end
	end)

	UserInputService.InputEnded:Connect(function(inputObj)
		local key = inputObj.KeyCode.Name
		if input[key] ~= nil then input[key] = false end
	end)

	-- Sistemi sıfırla
	local function cleanupFly()
		if bv then bv:Destroy() bv = nil end
		if bg then bg:Destroy() bg = nil end
		if humanoid then
			humanoid.PlatformStand = false
		end
	end

	-- Uçma sistemini kur
	local function setupFly()
		cleanupFly() -- 🧼 Her seferinde temiz başla
		if not fly or not hrp or not humanoid then return end

		bv = Instance.new("BodyVelocity")
		bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
		bv.Velocity = Vector3.zero
		bv.Parent = hrp

		bg = Instance.new("BodyGyro")
		bg.P = 1e4
		bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
		bg.CFrame = hrp.CFrame
		bg.Parent = hrp

		humanoid.PlatformStand = true
	end

	-- Karakter doğduğunda uygulanacak
	local function onCharacterAdded(char)
		task.spawn(function()
			task.wait(3) -- Yere oturması için

			hrp = char:WaitForChild("HumanoidRootPart")
			humanoid = char:WaitForChild("Humanoid")

			if fly then
				setupFly()
			end
		end)
	end

	RunService.Heartbeat:Connect(function()
		if fly then
			if not (bv and bg and hrp and humanoid) then
				if player.Character then
					hrp = player.Character:FindFirstChild("HumanoidRootPart")
					humanoid = player.Character:FindFirstChild("Humanoid")
				end
				if hrp and humanoid then
					setupFly()
				end
			end

			if bv and bg and hrp then
				local cam = workspace.CurrentCamera
				local dir = Vector3.zero

				if input.W then dir += Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z) end
				if input.S then dir -= Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z) end
				if input.A then dir -= Vector3.new(cam.CFrame.RightVector.X, 0, cam.CFrame.RightVector.Z) end
				if input.D then dir += Vector3.new(cam.CFrame.RightVector.X, 0, cam.CFrame.RightVector.Z) end

				local y = 0
				if input.Space then y += flySpeed end
				if input.LeftShift then y -= flySpeed end

				if dir.Magnitude > 0 then dir = dir.Unit * flySpeed end

				bv.Velocity = Vector3.new(dir.X, y, dir.Z)
				bg.CFrame = cam.CFrame
			end
		elseif bv or bg then
			cleanupFly()
		end
	end)

	-- Karakter hazır olduğunda uçuş kur
	if player.Character then
		onCharacterAdded(player.Character)
	end
	player.CharacterAdded:Connect(onCharacterAdded)

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local jumpBoostEnabled = false
	local defaultJumpPower = 50 -- Roblox standart zıplama gücü
	local boostedJumpPower = 100 -- Artırılmış zıplama gücü

	local humanoid

	local function onCharacterAdded(character)
		humanoid = character:WaitForChild("Humanoid")
		-- Başlangıçta varsayılan değeri ayarla
		humanoid.JumpPower = jumpBoostEnabled and boostedJumpPower or defaultJumpPower
	end

	-- Karakter yüklendiğinde tetikle
	if LocalPlayer.Character then
		onCharacterAdded(LocalPlayer.Character)
	end
	LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

	-- Jump boost durumu değiştiğinde çağrılacak fonksiyon
	local function updateJumpBoost()
		if humanoid then
			humanoid.JumpPower = jumpBoostEnabled and boostedJumpPower or defaultJumpPower
		end
	end

	--// Ayarlar (hepsi local, hepsi başlangıçta false)
	local SendNotifications = false
	local SaveSettings = false
	local ReloadOnTeleport = false
	local Enabled = false
	local TeamCheck = false
	local AliveCheck = false
	local WallCheck = false
	local Sensitivity = 0
	local ThirdPerson = false
	local ThirdPersonSensitivity = 3
	local TriggerKey = "MouseButton1"
	local LockMode = "toggle" -- "toggle", "hold", "always"
	local LockPart = "Head"

	local FOVEnabled = false
	local FOVVisible = false
	local FOVAmount = 90
	local FOVColor = "255, 255, 255"
	local FOVLockedColor = "255, 70, 70"
	local FOVTransparency = 0.5
	local FOVSides = 60
	local FOVThickness = 1
	local FOVFilled = false

	--// Servisler
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local Players = game:GetService("Players")
	local Camera = workspace.CurrentCamera
	local LocalPlayer = Players.LocalPlayer

	--// Genel Değişkenler
	local Locked = nil
	local Running = false
	local Typing = false
	local Animation = nil
	local FOVCircle = Drawing.new("Circle")

	--// Renk Fonksiyonu
	local function GetColor(rgbStr)
		local r, g, b = rgbStr:match("(%d+),%s*(%d+),%s*(%d+)")
		return Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
	end

	--// Oyuncu Bulucu
	local function GetClosestPlayer()
		local closest, closestDistance = nil, FOVAmount
		for _, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild(LockPart) then
				if TeamCheck and v.Team == LocalPlayer.Team then continue end
				if AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
				if WallCheck and #Camera:GetPartsObscuringTarget({v.Character[LockPart].Position}, v.Character:GetDescendants()) > 0 then continue end

				local screenPoint, onScreen = Camera:WorldToViewportPoint(v.Character[LockPart].Position)
				local mousePos = UserInputService:GetMouseLocation()
				local distance = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude

				if distance < closestDistance and onScreen then
					closest = v
					closestDistance = distance
				end
			end
		end
		return closest
	end

	--// Input Kontrolleri
	UserInputService.TextBoxFocused:Connect(function() Typing = true end)
	UserInputService.TextBoxFocusReleased:Connect(function() Typing = false end)

	UserInputService.InputBegan:Connect(function(input)
		if Typing then return end
		if LockMode == "toggle" and input.UserInputType.Name == TriggerKey or input.KeyCode.Name == TriggerKey then
			Running = not Running
		elseif LockMode == "hold" and (input.UserInputType.Name == TriggerKey or input.KeyCode.Name == TriggerKey) then
			Running = true
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if Typing then return end
		if LockMode == "hold" and (input.UserInputType.Name == TriggerKey or input.KeyCode.Name == TriggerKey) then
			Running = false
			Locked = nil
			if Animation then Animation:Cancel() end
		end
	end)

	--// Render Loop
	RunService.RenderStepped:Connect(function()
		if LockMode == "always" then Running = true end
		
		if FOVEnabled and Enabled then
			FOVCircle.Radius = FOVAmount
			FOVCircle.Thickness = FOVThickness
			FOVCircle.Filled = FOVFilled
			FOVCircle.NumSides = FOVSides
			FOVCircle.Color = GetColor(FOVColor)
			FOVCircle.Transparency = FOVTransparency
			FOVCircle.Visible = FOVVisible
			FOVCircle.Position = UserInputService:GetMouseLocation()
		else
			FOVCircle.Visible = false
		end

		if not Running or not Enabled then return end

		Locked = GetClosestPlayer()
		if not Locked or not Locked.Character:FindFirstChild(LockPart) then return end

		local targetPos = Locked.Character[LockPart].Position
		
		if ThirdPerson then
			local screenPoint = Camera:WorldToViewportPoint(targetPos)
			local mousePos = UserInputService:GetMouseLocation()
			local x = (screenPoint.X - mousePos.X) * math.clamp(ThirdPersonSensitivity, 0.1, 5)
			local y = (screenPoint.Y - mousePos.Y) * math.clamp(ThirdPersonSensitivity, 0.1, 5)
			mousemoverel(x, y)
		else
			if Sensitivity > 0 then
				Animation = TweenService:Create(Camera, TweenInfo.new(Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, targetPos)})
				Animation:Play()
			else
				Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
			end
		end

		FOVCircle.Color = GetColor(FOVLockedColor)
	end)

	--// Yükleyici Bilgi
	if SendNotifications then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Aimbot", Text = "Script yüklendi.", Duration = 5
		})
	end



	-- [[  // Main // ]]
	local window = library:CreateWindow({})
	--
	local rage = window:CreatePage({Icon = "rbxassetid://8547236654"})
	local antiaim = window:CreatePage({Icon = "rbxassetid://108850311121148"})
	local aimbot = window:CreatePage({Icon = "rbxassetid://8547249956"})
	local visuals = window:CreatePage({Icon = "rbxassetid://8547254518"})
	local setting = window:CreatePage({Icon = "rbxassetid://8547256547"})
	local skins = window:CreatePage({Icon = "rbxassetid://8547258459"})
	local config = window:CreatePage({Icon = "rbxassetid://8547269749"})
	--
	local playeresp = visuals:CreateSection({Name = "Player ESP", Size = 330, Side = "Left"})
	local coloredmodels = visuals:CreateSection({Name = "Colored models", Size = 158, Side = "Left"})
	local otheresp = visuals:CreateSection({Name = "Other ESP", Size = 200, Side = "Right"})
	local effects = visuals:CreateSection({Name = "Effects", Size = 288, Side = "Right"})

	local skns = skins:CreateSection({Name = "Skin Changer", Size = 330, Side = "Left"})

	local misc = setting:CreateSection({Name = "Miscellaneous", Size = 505, Side = "Left"})

	local movement = setting:CreateSection({Name = "Movement", Size = 158, Side = "Right"})

	local wm = setting:CreateSection({Name = "Watermark", Size = 158, Side = "Right"})

	local menuset = setting:CreateSection({Name = "Menu", Size = 155, Side = "Right"})

	local legit = aimbot:CreateSection({Name = "Legitbot", Size = 330, Side = "Left"})

	local fovset = aimbot:CreateSection({Name = "FOV settings", Size = 158, Side = "Left"})

	local aimbotkey = legit:CreateKeybind({
		Name = "Activation Type",
	})

	legit:CreateToggle({
		Name = "Legitbot",
		State = Enabled,
		Callback = function(state)
			Enabled = state
		end
	})

	legit:CreateDropdown({
		Name = "Legitbot type",
		Options = {"toggle", "hold", "always"},
		Default = 1,
		Callback = function(value)
			LockMode = string.lower(value)
		end
	})

	legit:CreateToggle({
		Name = "Team check",
		State = TeamCheck,
		Callback = function(state)
			TeamCheck = state
		end
	})

	legit:CreateToggle({
		Name = "Alive check",
		State = AliveCheck,
		Callback = function(state)
			AliveCheck = state
		end
	})

	legit:CreateToggle({
		Name = "Wall check",
		State = WallCheck,
		Callback = function(state)
			WallCheck = state
		end
	})

	fovset:CreateToggle({
		Name = "Enable FOV",
		State = FOVEnabled,
		Callback = function(state)
			FOVEnabled = state
		end
	})

	fovset:CreateToggle({
		Name = "FOV Visible",
		State = FOVVisible,
		Callback = function(state)
			FOVVisible = state
		end
	})

	fovset:CreateToggle({
		Name = "FOV Filled",
		State = FOVFilled,
		Callback = function(state)
			FOVFilled = state
		end
	})

	fovset:CreateSlider({
		Name = "FOV Radius",
		Suffix = "px",
		Default = 90,
		Min = 0,
		Max = 360,
		Callback = function(value)
			FOVAmount = value
		end
	})

	fovset:CreateSlider({
		Name = "FOV Thickness",
		Suffix = "px",
		Default = 0.5,
		Decimals = 0.01,
		Min = 0,
		Max = 5,
		Callback = function(value)
			FOVThickness = value
		end
	})

	fovset:CreateSlider({
		Name = "FOV Transparency",
		Suffix = "px",
		Default = 0.5,
		Decimals = 0.01,
		Min = 0,
		Max = 1,
		Callback = function(value)
			FOVTransparency = value
		end
	})

	playeresp:CreateToggle({
		Name = "Enabled",
		State = masterswitch,
		Callback = function(state)
			masterswitch = state
		end
	})

	playeresp:CreateToggle({
		Name = "Bounding box",
		State = false,
		Callback = function(state)
			boxesp = state
		end
	})

	playeresp:CreateToggle({
		Name = "Outlined box",
		State = false,
		Callback = function(state)
			outline = state
		end
	})

	playeresp:CreateToggle({
		Name = "Health bar",
		State = false,
		Callback = function(state)
			healthesp = state
		end
	})

	playeresp:CreateDropdown({
		Name = "Health bar position",
		Options = {"Left", "Right"},
		Default = 1,
		Callback = function(value)
			healthPosition = string.lower(value)
		end
	})

	playeresp:CreateToggle({
		Name = "Name",
		State = false,
		Callback = function(state)
			nameesp = state
		end
	})

	playeresp:CreateToggle({
		Name = "Tracers",
		State = false,
		Callback = function(state)
			tracers = state
		end
	})

	skns:CreateButton({
		Name = "Unlock Inventory",
		Text = "Reset",
		Callback = function()
			print("Envanterinize Skinler eklendi")
		end
	})

	local colorPicker = skns:CreateColorPicker({
		Name = "Renk Seçici",
		Color = Color3.fromRGB(255, 0, 0), -- Varsayılan kırmızı
		Callback = function(color)
			print("Seçilen renk:", color)
		end
	})

	movement:CreateToggle({
		Name = "Bunny hop",
		State = bhop,
		Callback = function(state)
			bhop = state
		end
	})

	movement:CreateToggle({
		Name = "Tickrate Bhop",
		State = tickratebhop,
		Callback = function(state)
			tickratebhop = state
		end
	})

	movement:CreateToggle({
		Name = "Fast walk",
		State = fastwalk,
		Callback = function(state)
			fastwalk = state
		end
	})

	movement:CreateToggle({
		Name = "Fly",
		State = fly,
		Callback = function(state)
			fly = state
		end
	})

	movement:CreateToggle({
		Name = "Jump Boost",
		State = jumpBoostEnabled,
		Callback = function(state)
			jumpBoostEnabled = state
			updateJumpBoost()
		end
	})

	wm:CreateToggle({
		Name = "Watermark",
		State = watermark,
		Callback = function(state)
			watermark = state
		end
	})

	wm:CreateToggle({
		Name = "Show FPS",
		State = watermark,
		Callback = function(state)
			fps = state
		end
	})

	wm:CreateToggle({
		Name = "Show Name",
		State = name,
		Callback = function(state)
			name = state
		end
	})

	wm:CreateToggle({
		Name = "Show MS",
		State = ms,
		Callback = function(state)
			ms = state
		end
	})
end)
