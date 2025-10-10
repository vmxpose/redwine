-- redwine UI library by vmxpose
local helpers = loadstring(game:HttpGet("https://raw.githubusercontent.com/vmxpose/redwine/refs/heads/main/libraries/helpers.lua"))()
local styles = loadstring(game:HttpGet("https://raw.githubusercontent.com/vmxpose/redwine/refs/heads/main/libraries/styles.lua"))()

-- Centralized ZIndex hierarchy
local Z = {
    REST = 1,        -- background, chrome
    CONTAINER = 5,   -- tab content container and sections
    CARD = 10,       -- card frames
    COMPONENT = 20,  -- controls inside cards and tab buttons
    POPOUT = 50,     -- dropdown lists, colorpicker panels
}

local redwine = {}

redwine.flags = {}

redwine.helpers = assert(helpers, "[redwine] helpers library failed to load")
redwine.styles = assert(styles, "[redwine] styles library failed to load")

function redwine.new(redwineSettings)
    local window = {}

    window.settings =
        redwineSettings or
        {
            name = "red wine",
            toggleKey = Enum.KeyCode.RightControl,
            theme = redwine.styles.default,
            watermark = true,
            watermarkSettings = {
                text = "red wine for {game} | {fps} | {ping} | {version}"
            }
        }

    window.theme = window.settings.theme or redwine.styles.default

    window.redwinegui =
        helpers.createInstance(
        "ScreenGui",
        {
            Name = "redwine",
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            ResetOnSpawn = false,
            Parent = game:GetService("CoreGui")
        }
    )

    window.main_frame =
        helpers.createInstance(
        "Frame",
        {
            Name = "main_ui",
            AnchorPoint = window.theme.main_frame.anchorPoint,
            Size = window.theme.main_frame.size,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundColor3 = window.theme.main_frame.background,
            BackgroundTransparency = window.theme.main_frame.backgroundtransparency,
            BorderSizePixel = 0,
            ZIndex = Z.REST,
            ClipsDescendants = true,
            Visible = true,
            Parent = window.redwinegui
        }
    )

    helpers.appendUICorner(window.main_frame, window.theme.main_frame.cornerRadius)
    helpers.appendUIStroke(
        window.main_frame,
        window.theme.main_frame.stroke.color,
        window.theme.main_frame.stroke.thickness,
        window.theme.main_frame.stroke.strokeMode,
        window.theme.main_frame.stroke.lineJoinMode
    )
    helpers.applyUIGradient(
        window.main_frame,
        window.theme.main_frame.gradient.ColorSequence,
        window.theme.main_frame.gradient.Rotation
    )

    -- make topbar size of main frame's width and 35 pixels in height
    window.topbar =
        helpers.createInstance(
        "Frame",
        {
            Name = "topbar",
            AnchorPoint = window.theme.topbar.anchorPoint,
            Size = window.theme.topbar.size,
            Position = window.theme.topbar.position,
            BackgroundColor3 = window.theme.topbar.background,
            BackgroundTransparency = window.theme.topbar.backgroundtransparency,
            ZIndex = Z.REST + 1,
            BorderSizePixel = 0,
            Visible = true,
            Parent = window.main_frame
        }
    )

    helpers.appendUICorner(window.topbar, window.theme.topbar.cornerRadius)
    helpers.applyUIGradient(
        window.topbar,
        window.theme.topbar.gradient.ColorSequence,
        window.theme.topbar.gradient.Rotation
    )
    -- drag only when interacting with the topbar
    do
        local UIS = game:GetService("UserInputService")
        local dragging = false
        local dragStart
        local startPos

        window.topbar.InputBegan:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseButton1 or
                        input.UserInputType == Enum.UserInputType.Touch
                 then
                    dragging = true
                    dragStart = input.Position
                    startPos = window.main_frame.Position
                    -- End dragging if this input ends
                    input.Changed:Connect(
                        function()
                            if input.UserInputState == Enum.UserInputState.End then
                                dragging = false
                            end
                        end
                    )
                end
            end
        )

        window.topbar.InputEnded:Connect(
            function(input)
                if
                    input.UserInputType == Enum.UserInputType.MouseButton1 or
                        input.UserInputType == Enum.UserInputType.Touch
                 then
                    dragging = false
                end
            end
        )

        UIS.InputChanged:Connect(
            function(input)
                if
                    dragging and
                        (input.UserInputType == Enum.UserInputType.MouseMovement or
                            input.UserInputType == Enum.UserInputType.Touch)
                 then
                    local delta = input.Position - dragStart
                    window.main_frame.Position =
                        UDim2.new(
                        startPos.X.Scale,
                        startPos.X.Offset + delta.X,
                        startPos.Y.Scale,
                        startPos.Y.Offset + delta.Y
                    )
                end
            end
        )
    end

    window.windowtitle =
        helpers.createInstance(
        "TextLabel",
        {
            Name = "window_title",
            AnchorPoint = window.theme.windowtitle.anchorPoint,
            Size = window.theme.windowtitle.size,
            Position = window.theme.windowtitle.position,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = Z.REST + 2,
            Font = window.theme.windowtitle.textFont,
            Text = window.settings.name or "red wine",
            TextColor3 = window.theme.windowtitle.textColor,
            TextSize = window.theme.windowtitle.textSize,
            TextXAlignment = window.theme.windowtitle.textalignment,
            Parent = window.topbar
        }
    )
    helpers.applyUIGradient(
        window.windowtitle,
        window.theme.windowtitle.gradient.ColorSequence,
        window.theme.windowtitle.gradient.Rotation
    )
    helpers.applyPadding(
        window.windowtitle,
        {
            PaddingLeft = window.theme.windowtitle.padding.left,
            PaddingRight = window.theme.windowtitle.padding.right,
            PaddingTop = window.theme.windowtitle.padding.top,
            PaddingBottom = window.theme.windowtitle.padding.bottom
        }
    )

    window.tab_buttons =
        helpers.createInstance(
        "ScrollingFrame",
        {
            Name = "tab_buttons",
            AnchorPoint = window.theme.tab_buttons.anchorPoint,
            Size = window.theme.tab_buttons.size,
            Position = window.theme.tab_buttons.position,
            BackgroundColor3 = window.theme.tab_buttons.background,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = Z.COMPONENT,
            ScrollBarThickness = 1,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Parent = window.main_frame
        }
    )

    helpers.applyListLayout(
        window.tab_buttons,
        {
            FillDirection = window.theme.tab_buttons.listlayout.fillDirection,
            HorizontalAlignment = window.theme.tab_buttons.listlayout.horizontalAlignment,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = window.theme.tab_buttons.listlayout.verticalAlignment,
            Padding = window.theme.tab_buttons.listlayout.padding
        }
    )

    local tabs = {}

    -- HttpService for JSON encode/decode
    local HttpService = game:GetService("HttpService")

    -- Simple filesystem abstraction for common executor APIs
    local FS = {}
    local BASE_DIR = "redwine"
    local CFG_DIR = BASE_DIR .. "/configs"
    local AUTOLOAD_FILE = CFG_DIR .. "/_autoload.json"

    local function _safe(fn, ...)
        if not fn then return nil end
        local ok, res = pcall(fn, ...)
        if ok then return res end
        return nil
    end

    -- ensure folders (best effort)
    if _safe(isfolder, BASE_DIR) ~= true then _safe(makefolder, BASE_DIR) end
    if _safe(isfolder, CFG_DIR) ~= true then _safe(makefolder, CFG_DIR) end

    function FS.path(name)
        return CFG_DIR .. "/" .. tostring(name) .. ".json"
    end
    function FS.exists(name)
        return _safe(isfile, FS.path(name)) and true or false
    end
    function FS.list()
        local out = {}
        local files = _safe(listfiles, CFG_DIR) or {}
        for _, f in ipairs(files) do
            local name = tostring(f)
            -- strip directory and extension
            local base = name:match("([^/\\]+)$") or name
            if base ~= "_autoload.json" then
                local n = base:gsub("%.json$", "")
                table.insert(out, n)
            end
        end
        table.sort(out)
        return out
    end
    function FS.save(name, tbl, overwrite)
        if not name or name == "" then return false, "empty name" end
        local p = FS.path(name)
        if not overwrite and _safe(isfile, p) then return false, "exists" end
        local json = HttpService:JSONEncode(tbl)
        _safe(writefile, p, json)
        return true
    end
    function FS.load(name)
        local p = FS.path(name)
        if not _safe(isfile, p) then return nil end
        local s = _safe(readfile, p)
        if not s then return nil end
        local ok, data = pcall(function() return HttpService:JSONDecode(s) end)
        if ok then return data end
        return nil
    end
    function FS.delete(name)
        return _safe(delfile, FS.path(name)) and true or false
    end
    function FS.rename(oldName, newName, overwrite)
        if not oldName or not newName or oldName == newName then return false, "bad names" end
        local oldP = FS.path(oldName)
        local newP = FS.path(newName)
        if not _safe(isfile, oldP) then return false, "missing source" end
        if (not overwrite) and _safe(isfile, newP) then return false, "target exists" end
        local content = _safe(readfile, oldP)
        if not content then return false, "read failed" end
        _safe(writefile, newP, content)
        _safe(delfile, oldP)
        return true
    end
    function FS.setAutoload(name)
        local data = { enabled = name ~= nil and name ~= "", name = name or "" }
        local json = HttpService:JSONEncode(data)
        _safe(writefile, AUTOLOAD_FILE, json)
        return true
    end
    function FS.getAutoload()
        if not _safe(isfile, AUTOLOAD_FILE) then return {enabled=false,name=""} end
        local s = _safe(readfile, AUTOLOAD_FILE)
        if not s then return {enabled=false,name=""} end
        local ok, data = pcall(function() return HttpService:JSONDecode(s) end)
        if ok and type(data) == "table" then return data end
        return {enabled=false,name=""}
    end

    -- Utilities to update existing UI objects without duplicating adorners
    local function getFirstChildOfClass(inst, className)
        for _, ch in ipairs(inst:GetChildren()) do
            if ch.ClassName == className then return ch end
        end
        return nil
    end
    local function setUICorner(inst, radius)
        local c = getFirstChildOfClass(inst, "UICorner")
        if not c then
            c = helpers.createInstance("UICorner", {})
            c.Parent = inst
        end
        c.CornerRadius = UDim.new(0, radius)
        return c
    end
    local function setUIStroke(inst, color, thickness, strokeMode, lineJoinMode)
        local s = getFirstChildOfClass(inst, "UIStroke")
        if not s then
            s = helpers.createInstance("UIStroke", {})
            s.Parent = inst
        end
        s.Color = color
        s.Thickness = thickness
        s.ApplyStrokeMode = strokeMode
        s.LineJoinMode = lineJoinMode
        return s
    end
    local function setUIGradient(inst, colorSequence, rotation)
        local g = getFirstChildOfClass(inst, "UIGradient")
        if not g then
            g = helpers.createInstance("UIGradient", {})
            g.Parent = inst
        end
        g.Color = colorSequence
        g.Rotation = rotation
        return g
    end
    local function setUIPadding(inst, padding)
        local p = getFirstChildOfClass(inst, "UIPadding")
        if not p then
            p = helpers.createInstance("UIPadding", {})
            p.Parent = inst
        end
        if padding.left then p.PaddingLeft = padding.left end
        if padding.right then p.PaddingRight = padding.right end
        if padding.top then p.PaddingTop = padding.top end
        if padding.bottom then p.PaddingBottom = padding.bottom end
        return p
    end
    local function setUIListLayout(inst, props)
        local l = getFirstChildOfClass(inst, "UIListLayout")
        if not l then
            l = helpers.createInstance("UIListLayout", {})
            l.Parent = inst
        end
        if props.FillDirection then l.FillDirection = props.FillDirection end
        if props.HorizontalAlignment then l.HorizontalAlignment = props.HorizontalAlignment end
        if props.VerticalAlignment then l.VerticalAlignment = props.VerticalAlignment end
        if props.SortOrder then l.SortOrder = props.SortOrder end
        if props.Padding then l.Padding = props.Padding end
        return l
    end

    -- Control registry to collect stateful components for config save/load
    window._controls = {}
    function window:_registerControl(name, control)
        if type(name) ~= "string" or name == "" then return end
        self._controls[name] = control
    end

    -- Value serialization helpers
    local function colorToHex(c)
        local r = math.floor(c.R * 255 + 0.5)
        local g = math.floor(c.G * 255 + 0.5)
        local b = math.floor(c.B * 255 + 0.5)
        return string.format("#%02X%02X%02X", r, g, b)
    end
    local function hexToColor(hex)
        if type(hex) ~= "string" then return nil end
        local r,g,b = hex:match("#?(%x%x)(%x%x)(%x%x)")
        if not r then return nil end
        return Color3.fromRGB(tonumber(r,16), tonumber(g,16), tonumber(b,16))
    end
    local function encodeValue(v)
        local tv = typeof(v)
        if tv == "Color3" then return {t="c3", v=colorToHex(v)} end
        if tv == "EnumItem" then return {t="key", v=v.Name} end
        if type(v) == "table" then return {t="tbl", v=v} end
        return v
    end
    local function decodeValue(v)
        if type(v) ~= "table" or v.t == nil then return v end
        if v.t == "c3" then return hexToColor(v.v) end
        if v.t == "key" then return Enum.KeyCode[v.v] end
        if v.t == "tbl" then return v.v end
        return v
    end

    function window:saveConfig(name, opts)
        opts = opts or {}
        local overwrite = opts.overwrite == true
        local values = {}
        for key, ctrl in pairs(self._controls) do
            local getter = ctrl.get or ctrl.Get or ctrl.value -- try common patterns
            local val
            if type(getter) == "function" then
                local ok, res = pcall(function() return ctrl:get() end)
                if ok then val = res end
            elseif getter ~= nil then
                val = getter
            end
            if val ~= nil then
                values[key] = encodeValue(val)
            end
        end
        local payload = { _meta = { version = 1 }, values = values }
        local ok, err = FS.save(name, payload, overwrite)
        return ok == true, err
    end

    function window:_applyConfig(payload)
        if not payload or type(payload.values) ~= "table" then return false end
        for key, enc in pairs(payload.values) do
            local ctrl = self._controls[key]
            if ctrl and type(ctrl.set) == "function" then
                local val = decodeValue(enc)
                -- pcall to protect against type mismatches
                pcall(function() ctrl:set(val) end)
            end
        end
        return true
    end

    function window:loadConfig(name)
        local payload = FS.load(name)
        if not payload then return false, "not found" end
        local ok = self:_applyConfig(payload)
        return ok, ok and nil or "apply failed"
    end

    function window:renameConfig(oldName, newName, opts)
        opts = opts or {}
        local overwrite = opts.overwrite == true
        local ok, err = FS.rename(oldName, newName, overwrite)
        if ok then
            local auto = FS.getAutoload()
            if auto.enabled and auto.name == oldName then FS.setAutoload(newName) end
        end
        return ok, err
    end

    function window:deleteConfig(name)
        local ok = FS.delete(name)
        if ok then
            local auto = FS.getAutoload()
            if auto.enabled and auto.name == name then FS.setAutoload("") end
        end
        return ok
    end

    function window:listConfigs()
        return FS.list()
    end

    function window:setAutoloadConfig(name)
        return FS.setAutoload(name)
    end

    function window:getAutoloadConfig()
        return FS.getAutoload()
    end

    function window:tryAutoloadConfig()
        local auto = FS.getAutoload()
        if auto.enabled and auto.name and auto.name ~= "" then
            self:loadConfig(auto.name)
            return true
        end
        return false
    end

    -- Apply the current theme to core window parts and tabs
    function window:_applyTheme()
        local theme = window.theme or redwine.styles.default
        -- small helper for concise tweens
        local function tween(obj, props, dur, style, dir)
            if not obj or not props then return end
            helpers.tweenObject(obj, props, dur or 0.2, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out)
        end

        -- main frame
        if window.main_frame then
            window.main_frame.AnchorPoint = theme.main_frame.anchorPoint
            window.main_frame.Size = theme.main_frame.size
            window.main_frame.BackgroundColor3 = theme.main_frame.background
            window.main_frame.BackgroundTransparency = theme.main_frame.backgroundtransparency
            setUICorner(window.main_frame, theme.main_frame.cornerRadius)
            setUIStroke(window.main_frame, theme.main_frame.stroke.color, theme.main_frame.stroke.thickness, theme.main_frame.stroke.strokeMode, theme.main_frame.stroke.lineJoinMode)
            setUIGradient(window.main_frame, theme.main_frame.gradient.ColorSequence, theme.main_frame.gradient.Rotation)
        end

        -- topbar
        if window.topbar then
            window.topbar.AnchorPoint = theme.topbar.anchorPoint
            window.topbar.Size = theme.topbar.size
            window.topbar.Position = theme.topbar.position
            window.topbar.BackgroundColor3 = theme.topbar.background
            window.topbar.BackgroundTransparency = theme.topbar.backgroundtransparency
            setUICorner(window.topbar, theme.topbar.cornerRadius)
            setUIGradient(window.topbar, theme.topbar.gradient.ColorSequence, theme.topbar.gradient.Rotation)
        end

        -- title
        if window.windowtitle then
            window.windowtitle.AnchorPoint = theme.windowtitle.anchorPoint
            window.windowtitle.Size = theme.windowtitle.size
            window.windowtitle.Position = theme.windowtitle.position
            window.windowtitle.Font = theme.windowtitle.textFont
            window.windowtitle.TextColor3 = theme.windowtitle.textColor
            window.windowtitle.TextSize = theme.windowtitle.textSize
            window.windowtitle.TextXAlignment = theme.windowtitle.textalignment
            setUIGradient(window.windowtitle, theme.windowtitle.gradient.ColorSequence, theme.windowtitle.gradient.Rotation)
            setUIPadding(window.windowtitle, theme.windowtitle.padding)
        end

        -- tab buttons scroller
        if window.tab_buttons then
            window.tab_buttons.AnchorPoint = theme.tab_buttons.anchorPoint
            window.tab_buttons.Size = theme.tab_buttons.size
            window.tab_buttons.Position = theme.tab_buttons.position
            window.tab_buttons.BackgroundColor3 = theme.tab_buttons.background
            setUIListLayout(window.tab_buttons, {
                FillDirection = theme.tab_buttons.listlayout.fillDirection,
                HorizontalAlignment = theme.tab_buttons.listlayout.horizontalAlignment,
                VerticalAlignment = theme.tab_buttons.listlayout.verticalAlignment,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = theme.tab_buttons.listlayout.padding,
            })
        end

        -- helper to apply theme to a card frame structure
        local function applyCardTheme(cardFrame)
            if not cardFrame or cardFrame.ClassName ~= "Frame" then return end
            local theme = window.theme
            -- card frame background, gradient, stroke
            tween(cardFrame, {
                BackgroundColor3 = theme.card.background,
                BackgroundTransparency = theme.card.backgroundtransparency,
            })
            setUIGradient(cardFrame, theme.card.gradient.ColorSequence, theme.card.gradient.Rotation)
            setUIStroke(cardFrame, theme.card.stroke.color, theme.card.stroke.thickness, theme.card.stroke.strokeMode, theme.card.stroke.lineJoinMode)

            -- title label
            local title = cardFrame:FindFirstChild("card_title")
            if title and title.ClassName == "TextLabel" then
                title.AnchorPoint = theme.cardtitle.anchorPoint
                title.Font = theme.cardtitle.textFont
                title.TextXAlignment = theme.cardtitle.textalignment
                tween(title, {
                    Size = theme.cardtitle.size,
                    Position = theme.cardtitle.position,
                    TextColor3 = theme.cardtitle.textColor,
                    TextSize = theme.cardtitle.textSize,
                })
                setUIGradient(title, theme.cardtitle.gradient.ColorSequence, theme.cardtitle.gradient.Rotation)
                setUIPadding(title, theme.cardtitle.padding)
            end

            -- content frame
            local content = cardFrame:FindFirstChild("card_content")
            if content and content.ClassName == "Frame" then
                tween(content, { Size = theme.cardcontent.size })
                content.AnchorPoint = theme.cardcontent.anchorPoint
                content.AutomaticSize = theme.cardcontent.automaticSize
                setUIListLayout(content, {
                    FillDirection = theme.cardcontent.listlayout.fillDirection,
                    HorizontalAlignment = theme.cardcontent.listlayout.horizontalAlignment,
                    VerticalAlignment = theme.cardcontent.listlayout.verticalAlignment,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = theme.cardcontent.listlayout.padding,
                })
                setUIPadding(content, theme.cardcontent.padding)

                -- Update each control hosted inside this card's content according to the active theme
                local function updateRichTextLabel(lbl)
                    if not lbl or lbl.ClassName ~= "TextLabel" then return end
                    lbl.Font = theme.richTextLabel.textFont
                    lbl.TextXAlignment = theme.richTextLabel.textalignment
                    lbl.RichText = theme.richTextLabel.richText
                    lbl.AutomaticSize = theme.richTextLabel.automaticSize
                    lbl.AnchorPoint = theme.richTextLabel.anchorPoint
                    tween(lbl, {
                        TextColor3 = theme.richTextLabel.textColor,
                        TextSize = theme.richTextLabel.textSize,
                        Size = theme.richTextLabel.size,
                    })
                    setUIPadding(lbl, theme.richTextLabel.padding)
                end

                local function updateSingleButton(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    tween(container, { Size = theme.button.singlewide.frame.size })
                    container.AnchorPoint = theme.button.singlewide.frame.anchorPoint
                    local tb = container:FindFirstChildOfClass("TextButton")
                    if tb then
                        tween(tb, {
                            BackgroundColor3 = theme.button.singlewide.background,
                            BackgroundTransparency = theme.button.singlewide.backgroundTransparency,
                            Position = theme.button.singlewide.position,
                            Size = theme.button.singlewide.size,
                            TextColor3 = theme.button.singlewide.textColor,
                            TextSize = theme.button.singlewide.textSize,
                        })
                        tb.AnchorPoint = theme.button.singlewide.anchorPoint
                        tb.AutomaticSize = theme.button.singlewide.automaticSize
                        tb.Font = theme.button.singlewide.textFont
                        tb.TextXAlignment = theme.button.singlewide.textAlignment
                        setUICorner(tb, theme.button.singlewide.cornerRadius)
                        setUIStroke(tb, theme.button.singlewide.stroke.color, theme.button.singlewide.stroke.thickness, theme.button.singlewide.stroke.strokeMode, theme.button.singlewide.stroke.lineJoinMode)
                    end
                end

                local function updateSubtextButton(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    tween(container, { Size = theme.button.subtext.frame.size })
                    container.AnchorPoint = theme.button.subtext.frame.anchorPoint
                    local lbl = container:FindFirstChild("subtext_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = theme.button.subtext.richTextLabel.textFont
                        lbl.TextXAlignment = theme.button.subtext.richTextLabel.textalignment
                        lbl.RichText = theme.button.subtext.richTextLabel.richText
                        tween(lbl, {
                            TextColor3 = theme.button.subtext.richTextLabel.textColor,
                            TextSize = theme.button.subtext.richTextLabel.textSize,
                            Size = theme.button.subtext.richTextLabel.size,
                            Position = theme.button.subtext.richTextLabel.position,
                        })
                        lbl.AnchorPoint = theme.button.subtext.richTextLabel.anchorPoint
                        setUIPadding(lbl, theme.button.subtext.richTextLabel.padding)
                    end
                    local tb = container:FindFirstChildOfClass("TextButton")
                    if tb then
                        tween(tb, {
                            BackgroundColor3 = theme.button.subtext.background,
                            BackgroundTransparency = theme.button.subtext.backgroundTransparency,
                            Position = theme.button.subtext.position,
                            Size = theme.button.subtext.size,
                            TextColor3 = theme.button.subtext.textColor,
                            TextSize = theme.button.subtext.textSize,
                        })
                        tb.AnchorPoint = theme.button.subtext.anchorPoint
                        tb.AutomaticSize = theme.button.subtext.automaticSize
                        tb.Font = theme.button.subtext.textFont
                        tb.TextXAlignment = theme.button.subtext.textAlignment
                        setUICorner(tb, theme.button.subtext.cornerRadius)
                        setUIStroke(tb, theme.button.subtext.stroke.color, theme.button.subtext.stroke.thickness, theme.button.subtext.stroke.strokeMode, theme.button.subtext.stroke.lineJoinMode)
                    end
                end

                local function updateToggle(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    tween(container, {
                        Size = theme.toggle.frame.size,
                        BackgroundColor3 = theme.toggle.frame.background,
                        BackgroundTransparency = theme.toggle.frame.backgroundTransparency,
                    })
                    container.AnchorPoint = theme.toggle.frame.anchorPoint
                    local lbl = container:FindFirstChild("checkbox_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = theme.toggle.richTextLabel.textFont
                        lbl.TextXAlignment = theme.toggle.richTextLabel.textalignment
                        lbl.AutomaticSize = theme.toggle.richTextLabel.automaticSize
                        lbl.AnchorPoint = theme.toggle.richTextLabel.anchorPoint
                        tween(lbl, {
                            TextColor3 = theme.toggle.richTextLabel.textColor,
                            TextSize = theme.toggle.richTextLabel.textSize,
                            Size = theme.toggle.richTextLabel.size,
                            Position = theme.toggle.richTextLabel.position,
                        })
                        setUIPadding(lbl, theme.toggle.richTextLabel.padding)
                    end
                    local ib = container:FindFirstChildOfClass("ImageButton")
                    if ib then
                        tween(ib, {
                            BackgroundColor3 = theme.toggle.button.background,
                            BackgroundTransparency = theme.toggle.button.backgroundTransparency,
                            Size = theme.toggle.button.size,
                            Position = theme.toggle.button.position,
                        })
                        ib.AnchorPoint = theme.toggle.button.anchorPoint
                        ib.Image = theme.toggle.button.image
                        setUICorner(ib, theme.toggle.button.cornerRadius)
                        setUIStroke(ib, theme.toggle.button.stroke.color, theme.toggle.button.stroke.thickness, theme.toggle.button.stroke.strokeMode, theme.toggle.button.stroke.lineJoinMode)
                    end
                end

                local function updateTextboxSingle(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    tween(container, { Size = theme.textbox.singlewide.frame.size })
                    container.AnchorPoint = theme.textbox.singlewide.frame.anchorPoint
                    local tb = container:FindFirstChildOfClass("TextBox")
                    if tb then
                        tween(tb, {
                            BackgroundColor3 = theme.textbox.singlewide.background,
                            BackgroundTransparency = theme.textbox.singlewide.backgroundTransparency,
                            Position = theme.textbox.singlewide.position,
                            Size = theme.textbox.singlewide.size,
                            TextColor3 = theme.textbox.singlewide.textColor,
                            TextSize = theme.textbox.singlewide.textSize,
                        })
                        tb.AnchorPoint = theme.textbox.singlewide.anchorPoint
                        tb.AutomaticSize = theme.textbox.singlewide.automaticSize
                        tb.Font = theme.textbox.singlewide.textFont
                        tb.TextXAlignment = theme.textbox.singlewide.textAlignment
                        tb.PlaceholderColor3 = theme.textbox.subtext.placeholderColor -- reuse consistent placeholder
                        setUICorner(tb, theme.textbox.singlewide.cornerRadius)
                        setUIStroke(tb, theme.textbox.singlewide.stroke.color, theme.textbox.singlewide.stroke.thickness, theme.textbox.singlewide.stroke.strokeMode, theme.textbox.singlewide.stroke.lineJoinMode)
                        local ind = tb:FindFirstChild("indicator")
                        if ind and ind.ClassName == "Frame" then
                            tween(ind, {
                                Position = theme.textbox.singlewide.indicator.position,
                                BackgroundColor3 = theme.textbox.singlewide.indicator.background,
                            })
                            setUIGradient(ind, theme.textbox.singlewide.indicator.gradient.ColorSequence, theme.textbox.singlewide.indicator.gradient.Rotation)
                        end
                    end
                end

                local function updateTextboxSubtext(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    tween(container, { Size = theme.textbox.subtext.frame.size })
                    container.AnchorPoint = theme.textbox.subtext.frame.anchorPoint
                    local lbl = container:FindFirstChild("subtext_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = theme.textbox.subtext.richTextLabel.textFont
                        lbl.TextXAlignment = theme.textbox.subtext.richTextLabel.textalignment
                        lbl.RichText = theme.textbox.subtext.richTextLabel.richText
                        tween(lbl, {
                            TextColor3 = theme.textbox.subtext.richTextLabel.textColor,
                            TextSize = theme.textbox.subtext.richTextLabel.textSize,
                            Size = theme.textbox.subtext.richTextLabel.size,
                            Position = theme.textbox.subtext.richTextLabel.position,
                        })
                        lbl.AnchorPoint = theme.textbox.subtext.richTextLabel.anchorPoint
                        setUIPadding(lbl, theme.textbox.subtext.richTextLabel.padding)
                    end
                    local tb = container:FindFirstChildOfClass("TextBox")
                    if tb then
                        tween(tb, {
                            BackgroundColor3 = theme.textbox.subtext.background,
                            BackgroundTransparency = theme.textbox.subtext.backgroundTransparency,
                            Position = theme.textbox.subtext.position,
                            Size = theme.textbox.subtext.size,
                            TextColor3 = theme.textbox.subtext.textColor,
                            TextSize = theme.textbox.subtext.textSize,
                        })
                        tb.AnchorPoint = theme.textbox.subtext.anchorPoint
                        tb.AutomaticSize = theme.textbox.subtext.automaticSize
                        tb.Font = theme.textbox.subtext.textFont
                        tb.TextXAlignment = theme.textbox.subtext.textAlignment
                        tb.PlaceholderColor3 = theme.textbox.subtext.placeholderColor
                        setUICorner(tb, theme.textbox.subtext.cornerRadius)
                        setUIStroke(tb, theme.textbox.subtext.stroke.color, theme.textbox.subtext.stroke.thickness, theme.textbox.subtext.stroke.strokeMode, theme.textbox.subtext.stroke.lineJoinMode)
                        local ind = tb:FindFirstChild("indicator")
                        if ind and ind.ClassName == "Frame" then
                            tween(ind, {
                                Position = theme.textbox.singlewide.indicator.position,
                                BackgroundColor3 = theme.textbox.singlewide.indicator.background,
                            })
                            setUIGradient(ind, theme.textbox.singlewide.indicator.gradient.ColorSequence, theme.textbox.singlewide.indicator.gradient.Rotation)
                        end
                    end
                end

                local function updateTextboxInline(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    tween(container, { Size = theme.textbox.inline.frame.size })
                    container.AnchorPoint = theme.textbox.inline.frame.anchorPoint
                    local lbl = container:FindFirstChild("inline_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = theme.textbox.inline.richTextLabel.textFont
                        lbl.TextXAlignment = theme.textbox.inline.richTextLabel.textalignment
                        lbl.RichText = theme.textbox.inline.richTextLabel.richText
                        lbl.AutomaticSize = theme.textbox.inline.richTextLabel.automaticSize
                        tween(lbl, {
                            TextColor3 = theme.textbox.inline.richTextLabel.textColor,
                            TextSize = theme.textbox.inline.richTextLabel.textSize,
                            Size = theme.textbox.inline.richTextLabel.size,
                            Position = theme.textbox.inline.richTextLabel.position,
                        })
                        lbl.AnchorPoint = theme.textbox.inline.richTextLabel.anchorPoint
                        setUIPadding(lbl, theme.textbox.inline.richTextLabel.padding)
                    end
                    local tb = container:FindFirstChildOfClass("TextBox")
                    if tb then
                        tween(tb, {
                            BackgroundColor3 = theme.textbox.inline.background,
                            BackgroundTransparency = theme.textbox.inline.backgroundTransparency,
                            Position = theme.textbox.inline.position,
                            Size = theme.textbox.inline.size,
                            TextColor3 = theme.textbox.inline.textColor,
                            TextSize = theme.textbox.inline.textSize,
                        })
                        tb.AnchorPoint = theme.textbox.inline.anchorPoint
                        tb.Font = theme.textbox.inline.textFont
                        tb.TextXAlignment = theme.textbox.inline.textAlignment
                        setUICorner(tb, theme.textbox.inline.cornerRadius)
                        setUIStroke(tb, theme.textbox.inline.stroke.color, theme.textbox.inline.stroke.thickness, theme.textbox.inline.stroke.strokeMode, theme.textbox.inline.stroke.lineJoinMode)
                    end
                end

                local function updateKeybind(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    -- mirrors subtext button style
                    tween(container, { Size = theme.button.subtext.frame.size })
                    container.AnchorPoint = theme.button.subtext.frame.anchorPoint
                    local lbl = container:FindFirstChild("keybind_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = theme.button.subtext.richTextLabel.textFont
                        lbl.TextXAlignment = theme.button.subtext.richTextLabel.textalignment
                        lbl.RichText = theme.button.subtext.richTextLabel.richText
                        tween(lbl, {
                            TextColor3 = theme.button.subtext.richTextLabel.textColor,
                            TextSize = theme.button.subtext.richTextLabel.textSize,
                            Size = theme.button.subtext.richTextLabel.size,
                            Position = theme.button.subtext.richTextLabel.position,
                        })
                        lbl.AnchorPoint = theme.button.subtext.richTextLabel.anchorPoint
                        setUIPadding(lbl, theme.button.subtext.richTextLabel.padding)
                    end
                    local tb = container:FindFirstChildOfClass("TextButton")
                    if tb then
                        tween(tb, {
                            BackgroundColor3 = theme.button.subtext.background,
                            BackgroundTransparency = theme.button.subtext.backgroundTransparency,
                            Position = theme.button.subtext.position,
                            Size = theme.button.subtext.size,
                            TextColor3 = theme.button.subtext.textColor,
                            TextSize = theme.button.subtext.textSize,
                        })
                        tb.AnchorPoint = theme.button.subtext.anchorPoint
                        tb.AutomaticSize = theme.button.subtext.automaticSize
                        tb.Font = theme.button.subtext.textFont
                        tb.TextXAlignment = theme.button.subtext.textAlignment
                        setUICorner(tb, theme.button.subtext.cornerRadius)
                        setUIStroke(tb, theme.button.subtext.stroke.color, theme.button.subtext.stroke.thickness, theme.button.subtext.stroke.strokeMode, theme.button.subtext.stroke.lineJoinMode)
                    end
                end

                local function updateDropdown(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    -- infer variant by frame height
                    local var = (container.Size.Y.Offset and container.Size.Y.Offset >= 60) and "subtext" or "inline"
                    local dtheme = theme.dropdown[var]
                    if not dtheme then return end
                    tween(container, { Size = dtheme.frame.size })
                    container.AnchorPoint = dtheme.frame.anchorPoint
                    local lbl = container:FindFirstChild("dropdown_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = dtheme.richTextLabel.textFont
                        lbl.TextXAlignment = dtheme.richTextLabel.textalignment
                        lbl.RichText = dtheme.richTextLabel.richText
                        lbl.AutomaticSize = dtheme.richTextLabel.automaticSize
                        tween(lbl, {
                            TextColor3 = dtheme.richTextLabel.textColor,
                            TextSize = dtheme.richTextLabel.textSize,
                            Size = dtheme.richTextLabel.size,
                            Position = dtheme.richTextLabel.position,
                        })
                        lbl.AnchorPoint = dtheme.richTextLabel.anchorPoint
                        setUIPadding(lbl, dtheme.richTextLabel.padding)
                    end
                    local btn = container:FindFirstChildOfClass("TextButton")
                    if btn then
                        tween(btn, {
                            BackgroundColor3 = dtheme.button.background,
                            BackgroundTransparency = dtheme.button.backgroundTransparency,
                            Position = dtheme.button.position,
                            Size = dtheme.button.size,
                            TextColor3 = dtheme.button.textColor,
                            TextSize = dtheme.button.textSize,
                        })
                        btn.AnchorPoint = dtheme.button.anchorPoint
                        btn.Font = dtheme.button.textFont
                        btn.TextXAlignment = dtheme.button.textAlignment
                        setUICorner(btn, dtheme.button.cornerRadius)
                        setUIStroke(btn, dtheme.button.stroke.color, dtheme.button.stroke.thickness, dtheme.button.stroke.strokeMode, dtheme.button.stroke.lineJoinMode)
                        if dtheme.button.paddingLeft then
                            setUIPadding(btn, {left = dtheme.button.paddingLeft})
                        end
                    end
                    local items = container:FindFirstChild("items")
                    if items and items.ClassName == "ScrollingFrame" then
                        tween(items, {
                            BackgroundColor3 = dtheme.items.background,
                            BackgroundTransparency = dtheme.items.backgroundTransparency,
                            Position = dtheme.items.position,
                            Size = dtheme.items.size,
                        })
                        items.AnchorPoint = dtheme.items.anchorPoint
                        items.ScrollBarThickness = dtheme.items.scrollBarThickness
                        items.ScrollBarImageColor3 = dtheme.items.scrollBarColor
                        setUICorner(items, dtheme.items.cornerRadius)
                        setUIStroke(items, dtheme.items.stroke.color, dtheme.items.stroke.thickness, dtheme.items.stroke.strokeMode, dtheme.items.stroke.lineJoinMode)
                        setUIListLayout(items, {
                            HorizontalAlignment = dtheme.items.listlayout.horizontalAlignment,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = dtheme.items.listlayout.padding,
                        })
                        for _, ib in ipairs(items:GetChildren()) do
                            if ib.ClassName == "TextButton" then
                                tween(ib, {
                                    BackgroundColor3 = dtheme.items.itemButton.background,
                                    BackgroundTransparency = dtheme.items.itemButton.backgroundTransparency,
                                    Size = dtheme.items.itemButton.size,
                                    TextColor3 = dtheme.items.itemButton.textColor,
                                    TextSize = dtheme.items.itemButton.textSize,
                                })
                                ib.Font = dtheme.items.itemButton.textFont
                                ib.TextXAlignment = dtheme.items.itemButton.textAlignment
                                setUICorner(ib, dtheme.items.itemButton.cornerRadius)
                                setUIStroke(ib, dtheme.items.itemButton.stroke.color, dtheme.items.itemButton.stroke.thickness, dtheme.items.itemButton.stroke.strokeMode, dtheme.items.itemButton.stroke.lineJoinMode)
                            end
                        end
                    end
                end

                local function updateColorpicker(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    -- infer variant by frame height
                    local var = (container.Size.Y.Offset and container.Size.Y.Offset >= 60) and "subtext" or "inline"
                    local ctheme = theme.colorpicker[var]
                    if not ctheme then return end
                    tween(container, { Size = ctheme.frame.size })
                    container.AnchorPoint = ctheme.frame.anchorPoint
                    local lbl = container:FindFirstChild("colorpicker_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = ctheme.richTextLabel.textFont
                        lbl.TextXAlignment = ctheme.richTextLabel.textalignment
                        lbl.RichText = ctheme.richTextLabel.richText
                        lbl.AutomaticSize = ctheme.richTextLabel.automaticSize
                        tween(lbl, {
                            TextColor3 = ctheme.richTextLabel.textColor,
                            TextSize = ctheme.richTextLabel.textSize,
                            Size = ctheme.richTextLabel.size,
                            Position = ctheme.richTextLabel.position,
                        })
                        lbl.AnchorPoint = ctheme.richTextLabel.anchorPoint
                        setUIPadding(lbl, ctheme.richTextLabel.padding)
                    end
                    local btn = container:FindFirstChildOfClass("TextButton")
                    if btn then
                        tween(btn, {
                            BackgroundColor3 = ctheme.button.background,
                            BackgroundTransparency = ctheme.button.backgroundTransparency,
                            Position = ctheme.button.position,
                            Size = ctheme.button.size,
                            TextColor3 = ctheme.button.textColor,
                            TextSize = ctheme.button.textSize,
                        })
                        btn.AnchorPoint = ctheme.button.anchorPoint
                        btn.Font = ctheme.button.textFont
                        btn.TextXAlignment = ctheme.button.textAlignment
                        setUICorner(btn, ctheme.button.cornerRadius)
                        setUIStroke(btn, ctheme.button.stroke.color, ctheme.button.stroke.thickness, ctheme.button.stroke.strokeMode, ctheme.button.stroke.lineJoinMode)
                        if ctheme.button.paddingLeft then
                            setUIPadding(btn, {left = ctheme.button.paddingLeft})
                        end
                    end
                    local sw = container:FindFirstChild("swatch", true) -- search descendants (inside button)
                    if sw and sw.ClassName == "Frame" then
                        -- keep color; update border style and corner radius if theme has a swatch table (optional)
                        setUICorner(sw, 2)
                        local bstroke = btn and btn:FindFirstChildOfClass("UIStroke")
                        if bstroke then
                            setUIStroke(sw, ctheme.button.stroke.color, 1, ctheme.button.stroke.strokeMode, ctheme.button.stroke.lineJoinMode)
                        end
                    end
                    local panel = container:FindFirstChild("panel")
                    if panel and panel.ClassName == "Frame" then
                        tween(panel, {
                            BackgroundColor3 = ctheme.panel.background,
                            BackgroundTransparency = ctheme.panel.backgroundTransparency,
                            Position = ctheme.panel.position,
                            Size = ctheme.panel.size,
                        })
                        panel.AnchorPoint = ctheme.panel.anchorPoint
                        setUICorner(panel, ctheme.panel.cornerRadius)
                        setUIStroke(panel, ctheme.panel.stroke.color, ctheme.panel.stroke.thickness, ctheme.panel.stroke.strokeMode, ctheme.panel.stroke.lineJoinMode)
                    end
                    local sv = container:FindFirstChild("sv", true)
                    if sv and sv.ClassName == "Frame" then
                        tween(sv, { Size = ctheme.sv.size, Position = ctheme.sv.position })
                        setUICorner(sv, ctheme.sv.cornerRadius)
                        setUIStroke(sv, ctheme.sv.stroke.color, ctheme.sv.stroke.thickness, ctheme.sv.stroke.strokeMode, ctheme.sv.stroke.lineJoinMode)
                    end
                    local hue = container:FindFirstChild("hue", true)
                    if hue and hue.ClassName == "Frame" then
                        tween(hue, { Size = ctheme.hue.size, Position = ctheme.hue.position })
                        setUICorner(hue, ctheme.hue.cornerRadius)
                        setUIStroke(hue, ctheme.hue.stroke.color, ctheme.hue.stroke.thickness, ctheme.hue.stroke.strokeMode, ctheme.hue.stroke.lineJoinMode)
                    end
                    local svMarker = container:FindFirstChild("sv_marker", true)
                    if svMarker and svMarker.ClassName == "Frame" then
                        tween(svMarker, { Size = ctheme.markers.sv.size })
                    end
                    local hueMarker = container:FindFirstChild("hue_marker", true)
                    if hueMarker and hueMarker.ClassName == "Frame" then
                        tween(hueMarker, { Size = ctheme.markers.hue.size })
                    end
                end

                local function updateSlider(container)
                    if not container or container.ClassName ~= "Frame" then return end
                    local var = (container.Size.Y.Offset and container.Size.Y.Offset >= 60) and "subtext" or "inline"
                    local stheme = theme.slider[var]
                    if not stheme then return end
                    tween(container, { Size = stheme.frame.size })
                    container.AnchorPoint = stheme.frame.anchorPoint
                    local lbl = container:FindFirstChild("slider_label")
                    if lbl and lbl.ClassName == "TextLabel" then
                        lbl.Font = stheme.richTextLabel.textFont
                        lbl.TextXAlignment = stheme.richTextLabel.textalignment
                        lbl.RichText = stheme.richTextLabel.richText
                        lbl.AutomaticSize = stheme.richTextLabel.automaticSize
                        tween(lbl, {
                            TextColor3 = stheme.richTextLabel.textColor,
                            TextSize = stheme.richTextLabel.textSize,
                            Size = stheme.richTextLabel.size,
                            Position = stheme.richTextLabel.position,
                        })
                        lbl.AnchorPoint = stheme.richTextLabel.anchorPoint
                        setUIPadding(lbl, stheme.richTextLabel.padding)
                    end
                    local track = container:FindFirstChild("track")
                    if track and track.ClassName == "Frame" then
                        tween(track, {
                            BackgroundColor3 = stheme.track.background,
                            BackgroundTransparency = stheme.track.backgroundTransparency,
                            Position = stheme.track.position,
                            Size = stheme.track.size,
                        })
                        track.AnchorPoint = stheme.track.anchorPoint
                        setUICorner(track, stheme.track.cornerRadius)
                        setUIStroke(track, stheme.track.stroke.color, stheme.track.stroke.thickness, stheme.track.stroke.strokeMode, stheme.track.stroke.lineJoinMode)
                        local fill = track:FindFirstChild("fill")
                        if fill and fill.ClassName == "Frame" then
                            tween(fill, {
                                BackgroundColor3 = stheme.fill.background,
                                BackgroundTransparency = stheme.fill.backgroundTransparency,
                            })
                            setUICorner(fill, stheme.fill.cornerRadius)
                            setUIGradient(fill, stheme.fill.gradient.ColorSequence, stheme.fill.gradient.Rotation)
                        end
                        local thumb = track:FindFirstChild("thumb")
                        if thumb and thumb.ClassName == "Frame" then
                            tween(thumb, {
                                BackgroundColor3 = stheme.thumb.background,
                                BackgroundTransparency = stheme.thumb.backgroundTransparency,
                                Size = stheme.thumb.size,
                            })
                            setUICorner(thumb, stheme.thumb.cornerRadius)
                            setUIStroke(thumb, stheme.thumb.stroke.color, stheme.thumb.stroke.thickness, stheme.thumb.stroke.strokeMode, stheme.thumb.stroke.lineJoinMode)
                        end
                    end
                    local num = container:FindFirstChild("number")
                    if num and num.ClassName == "TextBox" then
                        tween(num, {
                            BackgroundColor3 = stheme.number.background,
                            BackgroundTransparency = stheme.number.backgroundTransparency,
                            Position = stheme.number.position,
                            Size = stheme.number.size,
                            TextColor3 = stheme.number.textColor,
                            TextSize = stheme.number.textSize,
                        })
                        num.AnchorPoint = stheme.number.anchorPoint
                        num.Font = stheme.number.textFont
                        num.TextXAlignment = stheme.number.textAlignment
                        setUICorner(num, stheme.number.cornerRadius)
                        setUIStroke(num, stheme.number.stroke.color, stheme.number.stroke.thickness, stheme.number.stroke.strokeMode, stheme.number.stroke.lineJoinMode)
                    end
                end

                for _, ctrl in ipairs(content:GetChildren()) do
                    if ctrl.ClassName == "TextLabel" and ctrl.Name == "rich_text_label" then
                        updateRichTextLabel(ctrl)
                    elseif ctrl.ClassName == "Frame" then
                        local n = ctrl.Name
                        if n == "button_frame" then
                            updateSingleButton(ctrl)
                        elseif n == "subtext_button_frame" then
                            updateSubtextButton(ctrl)
                        elseif n == "keybind_frame" then
                            updateKeybind(ctrl)
                        elseif n == "checkbox_toggle_frame" then
                            updateToggle(ctrl)
                        elseif n == "input_textbox_frame" then
                            updateTextboxSingle(ctrl)
                        elseif n == "subtext_textbox_frame" then
                            updateTextboxSubtext(ctrl)
                        elseif n == "inline_textbox_frame" then
                            updateTextboxInline(ctrl)
                        else
                            -- pattern-based controls
                            if ctrl:FindFirstChild("dropdown_label") then
                                updateDropdown(ctrl)
                            elseif ctrl:FindFirstChild("colorpicker_label") then
                                updateColorpicker(ctrl)
                            elseif ctrl:FindFirstChild("slider_label") then
                                updateSlider(ctrl)
                            end
                        end
                    end
                end
            end
        end

        -- tab containers and buttons
        for _, t in ipairs(tabs) do
            -- indicator
            if t.indicator then
                t.indicator.AnchorPoint = theme.indicator.anchorPoint
                t.indicator.Position = theme.indicator.position
                t.indicator.BackgroundColor3 = theme.indicator.background
                setUIGradient(t.indicator, theme.indicator.gradient.ColorSequence, theme.indicator.gradient.Rotation)
                if t.visible then
                    tween(t.indicator, { Size = theme.indicator.size })
                else
                    tween(t.indicator, { Size = UDim2.new(0, 0, 0, 2) })
                end
            end
            -- tab button text + gradient state-aware
            if t.button then
                t.button.AnchorPoint = theme.tab_button.anchorPoint
                tween(t.button, { Size = theme.tab_button.size })
                t.button.Font = theme.tab_button.textFont
                tween(t.button, { TextSize = theme.tab_button.textSize })
                t.button.TextXAlignment = theme.tab_button.textXAlignment or Enum.TextXAlignment.Center
                t.button.TextYAlignment = theme.tab_button.textYAlignment or Enum.TextYAlignment.Center
                -- compute target state: on, hover(off+hover), or off
                local isOn = (t.visible == true)
                local isHover = (not isOn) and (t._hover == true)
                if isOn then
                    tween(t.button, { TextColor3 = theme.tab_button.on.textColor })
                    local g = setUIGradient(t.button, theme.tab_button.on.gradient.ColorSequence, theme.tab_button.on.gradient.Rotation)
                    if g then t.buttonGradient = g end
                elseif isHover then
                    tween(t.button, { TextColor3 = theme.tab_button.hover.textColor })
                    local g = setUIGradient(t.button, theme.tab_button.hover.gradient.ColorSequence, theme.tab_button.hover.gradient.Rotation)
                    if g then t.buttonGradient = g end
                else
                    tween(t.button, { TextColor3 = theme.tab_button.off.textColor })
                    local g = setUIGradient(t.button, theme.tab_button.off.gradient.ColorSequence, theme.tab_button.off.gradient.Rotation)
                    if g then t.buttonGradient = g end
                end
                if t.padding then
                    t.padding.PaddingLeft = theme.tab_button.off.padding.left
                    t.padding.PaddingRight = theme.tab_button.off.padding.right
                    t.padding.PaddingTop = theme.tab_button.off.padding.top
                    if isOn and theme.tab_button.hover then
                        tween(t.padding, { PaddingBottom = theme.tab_button.hover.padding.bottom })
                    elseif isHover then
                        tween(t.padding, { PaddingBottom = theme.tab_button.hover.padding.bottom })
                    else
                        tween(t.padding, { PaddingBottom = theme.tab_button.off.padding.bottom })
                    end
                else
                    local p = setUIPadding(t.button, theme.tab_button.off.padding)
                    t.padding = p
                end
            end
            -- container
            if t.container then
                tween(t.container, {
                    BackgroundColor3 = theme.tabcontainer.background,
                    BackgroundTransparency = theme.tabcontainer.backgroundtransparency,
                    Size = theme.tabcontainer.size,
                    Position = theme.tabcontainer.position,
                })
                t.container.AnchorPoint = theme.tabcontainer.anchorPoint
                setUIPadding(t.container, theme.tabcontainer.padding)

                -- update cards in both sections if present
                local left = t.container:FindFirstChild("left_section")
                local right = t.container:FindFirstChild("right_section")
                for _, sec in ipairs({left, right}) do
                    if sec and sec.ClassName == "Frame" then
                        setUIListLayout(sec, {
                            FillDirection = theme.tabsection.listlayout.fillDirection,
                            HorizontalAlignment = theme.tabsection.listlayout.horizontalAlignment,
                            VerticalAlignment = theme.tabsection.listlayout.verticalAlignment,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = theme.tabsection.listlayout.padding,
                        })
                        -- padding is section-specific (left/right). Apply both if this matches one.
                        if sec.Name == "left_section" then
                            setUIPadding(sec, theme.tabsection.left.padding)
                        elseif sec.Name == "right_section" then
                            setUIPadding(sec, theme.tabsection.right.padding)
                        end
                        for _, child in ipairs(sec:GetChildren()) do
                            if child:IsA("Frame") and child:FindFirstChild("card_content") then
                                applyCardTheme(child)
                            end
                        end
                    end
                end
            end
        end
    end

    function window:setTheme(newTheme)
        window.theme = newTheme or redwine.styles.default
        self:_applyTheme()
    end

    function window:autoApplyTheme(intervalSeconds)
        local RunService = game:GetService("RunService")
        if self._themeAutoConn then self._themeAutoConn:Disconnect() end
        intervalSeconds = tonumber(intervalSeconds) or 0.5
        local acc = 0
        self._themeAutoConn = RunService.Heartbeat:Connect(function(dt)
            acc = acc + dt
            if acc >= intervalSeconds then
                acc = 0
                self:_applyTheme()
            end
        end)
    end

    function window:disableAutoTheme()
        if self._themeAutoConn then
            self._themeAutoConn:Disconnect()
            self._themeAutoConn = nil
        end
    end

    -- Create a "Theme" tab with controls to edit the current theme at runtime
    function window:initializeThemeTab(options)
        options = options or {}
        local presets = options.presets or { Default = redwine.styles.default }

        local function setAndApply(fn)
            fn()
            self:_applyTheme()
        end

        local function getTopbarHeight()
            local sz = self.theme.topbar.size
            return (typeof(sz) == "UDim2" and sz.Y.Offset) or 35
        end

        local function setTopbarHeight(h)
            local sz = self.theme.topbar.size
            local x = (typeof(sz) == "UDim2") and sz.X or UDim.new(1, 0)
            self.theme.topbar.size = UDim2.new(x.Scale, x.Offset, 0, math.floor(h))
        end

        local function getPresetNames()
            local names = {}
            for k, _ in pairs(presets) do table.insert(names, k) end
            table.sort(names)
            return names
        end

        local tab = self:createTab({ name = "Theme" })

        -- Presets selector (optional)
        if presets and next(presets) ~= nil then
            local cardPresets = tab:createCard({ title = "Presets", section = "left" })
            cardPresets:dropdown({
                name = "theme_presets",
                variant = "inline",
                label = "Preset",
                items = getPresetNames(),
                onChanged = function(selected)
                    local first = (type(selected) == "table" and selected[1]) or selected
                    local preset = (type(first) == "string") and presets[first]
                    if preset then
                        self:setTheme(preset)
                    end
                end
            })
        end

        -- Window card
        local cardWindow = tab:createCard({ title = "Window", section = "left" })
        cardWindow:colorpicker({
            name = "main_bg",
            variant = "inline",
            label = "Main bg",
            default = self.theme.main_frame.background,
            onChanged = function(c)
                setAndApply(function() self.theme.main_frame.background = c end)
            end
        })
        cardWindow:slider({
            name = "main_alpha",
            variant = "inline",
            label = "Main alpha",
            min = 0,
            max = 1,
            step = 0.05,
            default = self.theme.main_frame.backgroundtransparency or 0,
            onChanged = function(v)
                setAndApply(function() self.theme.main_frame.backgroundtransparency = v end)
            end
        })

        -- Topbar card
        local cardTop = tab:createCard({ title = "Topbar", section = "left" })
        cardTop:colorpicker({
            name = "topbar_bg",
            variant = "inline",
            label = "Topbar bg",
            default = self.theme.topbar.background,
            onChanged = function(c)
                setAndApply(function() self.theme.topbar.background = c end)
            end
        })
        cardTop:slider({
            name = "topbar_h",
            variant = "inline",
            label = "Height",
            min = 24,
            max = 60,
            step = 1,
            default = getTopbarHeight(),
            onChanged = function(v)
                setAndApply(function() setTopbarHeight(v) end)
            end
        })

        -- Cards card
        local cardCards = tab:createCard({ title = "Cards", section = "right" })
        cardCards:colorpicker({
            name = "card_bg",
            variant = "inline",
            label = "Card bg",
            default = self.theme.card.background,
            onChanged = function(c)
                setAndApply(function() self.theme.card.background = c end)
            end
        })
        cardCards:slider({
            name = "card_alpha",
            variant = "inline",
            label = "Card alpha",
            min = 0,
            max = 1,
            step = 0.05,
            default = self.theme.card.backgroundtransparency or 0.5,
            onChanged = function(v)
                setAndApply(function() self.theme.card.backgroundtransparency = v end)
            end
        })

        -- Tabs card
        local cardTabs = tab:createCard({ title = "Tabs", section = "right" })
        cardTabs:slider({
            name = "tab_text_size",
            variant = "inline",
            label = "Text size",
            min = 10,
            max = 20,
            step = 1,
            default = self.theme.tab_button.textSize or 14,
            onChanged = function(v)
                setAndApply(function() self.theme.tab_button.textSize = math.floor(v) end)
            end
        })

        return tab
    end

    -- Create a "Configs" tab to manage saving/loading user settings
    function window:initializeConfigTab()
        local tab = self:createTab({ name = "Configs" })

        -- State
        local currentName = ""
        local overwrite = false
        local autoload = FS.getAutoload()

        -- Controls
        local cardManage = tab:createCard({ title = "Manage", section = "left" })
        local cardFiles = tab:createCard({ title = "Files", section = "right" })

        -- Input for config name
        local nameBox = cardManage:inlinetextbox({
            name = "config_name",
            subtext = "Name",
            text = "",
            placeholder = "my-config"
        })

        -- Overwrite toggle
        local overwriteToggle = cardManage:checkboxtoggle({
            name = "overwrite_toggle",
            text = "Overwrite existing on Save",
            default = false,
            callback = function(v) overwrite = v end
        })

        -- Autoload toggle and selection
        local autoToggle = cardManage:checkboxtoggle({
            name = "autoload_toggle",
            text = "Autoload at startup",
            default = autoload.enabled,
            callback = function(v)
                local name = currentName ~= "" and currentName or (FS.getAutoload().name or "")
                FS.setAutoload(v and name or "")
            end
        })

        local configsDropdown = cardFiles:dropdown({
            name = "configs_list",
            variant = "inline",
            label = "Configs",
            items = self:listConfigs(),
            multi = false,
            onChanged = function(sel)
                local picked = type(sel) == "table" and sel[1] or sel
                if picked and picked ~= "" then
                    currentName = picked
                    if nameBox and nameBox.textbox then nameBox.textbox.Text = picked end
                    -- update autoload toggle to reflect selection
                    local auto = FS.getAutoload()
                    local should = auto.enabled and auto.name == picked
                    if overwriteToggle and type(overwriteToggle.set) == "function" then end -- no-op, just to silence unused
                    if autoToggle and type(autoToggle) == "table" then
                        -- reflect value visually
                        if autoToggle.value ~= should then
                            autoToggle.value = should
                            helpers.tweenObject(autoToggle.button, {ImageTransparency = should and 0 or 1}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        end
                    end
                end
            end
        })
                

        local function refreshList()
            local items = self:listConfigs()
            configsDropdown:set(items)
        end

        -- Save/Load/Refresh buttons
        local saveBtn = cardManage:button({ name = "save_config", text = "Save" , callback = function()
            currentName = nameBox and nameBox.textbox and nameBox.textbox.Text or currentName
            if not currentName or currentName == "" then return end
            local ok, err = self:saveConfig(currentName, { overwrite = overwrite })
            refreshList()
            if autoToggle and autoToggle.value then FS.setAutoload(currentName) end
        end })

        local loadBtn = cardManage:button({ name = "load_config", text = "Load" , callback = function()
            currentName = nameBox and nameBox.textbox and nameBox.textbox.Text or currentName
            if not currentName or currentName == "" then return end
            self:loadConfig(currentName)
        end })

        local deleteBtn = cardManage:button({ name = "delete_config", text = "Delete" , callback = function()
            local nm = nameBox and nameBox.textbox and nameBox.textbox.Text or ""
            if nm == "" then return end
            self:deleteConfig(nm)
            if currentName == nm then currentName = "" end
            refreshList()
        end })

        local renameBox = cardManage:inlinetextbox({
            name = "rename_to",
            subtext = "Rename to",
            text = "",
            placeholder = "new-name"
        })

        local renameBtn = cardManage:button({ name = "rename_config", text = "Rename", callback = function()
            local from = nameBox and nameBox.textbox and nameBox.textbox.Text or ""
            local to = renameBox and renameBox.textbox and renameBox.textbox.Text or ""
            if from == "" or to == "" then return end
            local ok = self:renameConfig(from, to, { overwrite = overwrite })
            if ok then
                currentName = to
                nameBox.textbox.Text = to
            end
            refreshList()
        end })

        -- Config files list and selection
        

        return tab
    end

    function window:createTab(tabSettings)
        local tab = {}

        tab.settings =
            tabSettings or
            {
                name = "tab",
                default = false
            }

        tab.visible = tab.settings.default or false

        tab.button =
            helpers.createInstance(
            "TextButton",
            {
                Name = tab.settings.name or "tab",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                AnchorPoint = window.theme.tab_button.anchorPoint,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = window.theme.tab_button.size,
                ZIndex = Z.COMPONENT,
                Parent = window.tab_buttons,
                Font = window.theme.tab_button.textFont,
                Text = tab.settings.name or "tab",
                TextSize = window.theme.tab_button.textSize,
                TextColor3 = window.theme.tab_button.off.textColor
            }
        )

        tab.buttonGradient =
            helpers.applyUIGradient(
            tab.button,
            window.theme.tab_button.off.gradient.ColorSequence,
            window.theme.tab_button.off.gradient.Rotation
        )

        tab.padding =
            helpers.applyPadding(
            tab.button,
            {
                PaddingLeft = window.theme.tab_button.off.padding.left,
                PaddingRight = window.theme.tab_button.off.padding.right,
                PaddingTop = window.theme.tab_button.off.padding.top,
                PaddingBottom = window.theme.tab_button.off.padding.bottom
            }
        )

        tab.indicator =
            helpers.createInstance(
            "Frame",
            {
                Name = "indicator",
                AnchorPoint = window.theme.indicator.anchorPoint,
                Size = UDim2.new(0, 0, 0, 2),
                Position = window.theme.indicator.position,
                BackgroundColor3 = window.theme.indicator.background,
                ZIndex = Z.COMPONENT + 1,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 0,
                BorderSizePixel = 0,
                Parent = tab.button
            }
        )

        helpers.applyUIGradient(
            tab.indicator,
            window.theme.indicator.gradient.ColorSequence,
            window.theme.indicator.gradient.Rotation
        )

        tab.container =
            helpers.createInstance(
            "ScrollingFrame",
            {
                Name = tab.settings.name .. "_container" or "tab_container",
                BackgroundColor3 = window.theme.tabcontainer.background,
                BackgroundTransparency = window.theme.tabcontainer.backgroundtransparency,
                BorderSizePixel = 0,
                AnchorPoint = window.theme.tabcontainer.anchorPoint,
                Size = window.theme.tabcontainer.size,
                Position = window.theme.tabcontainer.position,
                ZIndex = Z.CONTAINER,
                ScrollBarThickness = 0,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                Visible = tab.visible,
                Parent = window.main_frame
            }
        )

        helpers.applyPadding(
            tab.container,
            {
                PaddingLeft = window.theme.tabcontainer.padding.left,
                PaddingRight = window.theme.tabcontainer.padding.right,
                PaddingTop = window.theme.tabcontainer.padding.top,
                PaddingBottom = window.theme.tabcontainer.padding.bottom
            }
        )

        tab.left_section =
            helpers.createInstance(
            "Frame",
            {
                Name = "left_section",
                BackgroundColor3 = window.theme.tabsection.background,
                BackgroundTransparency = window.theme.tabsection.backgroundtransparency,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0),
                AutomaticSize = window.theme.tabsection.automaticSize,
                Size = window.theme.tabsection.size,
                Position = window.theme.tabsection.left.position,
                ZIndex = Z.CONTAINER,
                Parent = tab.container
            }
        )

        tab.right_section =
            helpers.createInstance(
            "Frame",
            {
                Name = "right_section",
                BackgroundColor3 = window.theme.tabsection.background,
                BackgroundTransparency = window.theme.tabsection.backgroundtransparency,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0),
                AutomaticSize = window.theme.tabsection.automaticSize,
                Size = window.theme.tabsection.size,
                Position = window.theme.tabsection.right.position,
                ZIndex = Z.CONTAINER,
                Parent = tab.container
            }
        )

        helpers.applyListLayout(
            tab.left_section,
            {
                FillDirection = window.theme.tabsection.listlayout.fillDirection,
                HorizontalAlignment = window.theme.tabsection.listlayout.horizontalAlignment,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = window.theme.tabsection.listlayout.verticalAlignment,
                Padding = window.theme.tabsection.listlayout.padding
            }
        )

        helpers.applyListLayout(
            tab.right_section,
            {
                FillDirection = window.theme.tabsection.listlayout.fillDirection,
                HorizontalAlignment = window.theme.tabsection.listlayout.horizontalAlignment,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = window.theme.tabsection.listlayout.verticalAlignment,
                Padding = window.theme.tabsection.listlayout.padding
            }
        )

        helpers.applyPadding(
            tab.left_section,
            {
                PaddingLeft = window.theme.tabsection.left.padding.left,
                PaddingRight = window.theme.tabsection.left.padding.right,
                PaddingTop = window.theme.tabsection.left.padding.top,
                PaddingBottom = window.theme.tabsection.left.padding.bottom
            }
        )

        helpers.applyPadding(
            tab.right_section,
            {
                PaddingLeft = window.theme.tabsection.right.padding.left,
                PaddingRight = window.theme.tabsection.right.padding.right,
                PaddingTop = window.theme.tabsection.right.padding.top,
                PaddingBottom = window.theme.tabsection.right.padding.bottom
            }
        )

        -- insert tab entry into tabs table and keep a back-reference for state syncing
        local _entry = {
            button = tab.button,
            padding = tab.padding,
            indicator = tab.indicator,
            container = tab.container,
            visible = tab.visible or false,
        }
        table.insert(tabs, _entry)
        tab._tabsEntry = _entry

        -- hover feedback for tab button (only when not selected)
        tab.button.MouseEnter:Connect(
            function()
                if tab._tabsEntry then tab._tabsEntry._hover = true end
                if tab.visible == true then return end
                helpers.tweenObject(
                    tab.button,
                    {TextColor3 = window.theme.tab_button.hover.textColor},
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                )
                helpers.tweenObject(
                    tab.padding,
                    {
                        PaddingBottom = window.theme.tab_button.hover.padding.bottom
                    },
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                )
                if tab.buttonGradient then
                    tab.buttonGradient.Color = window.theme.tab_button.hover.gradient.ColorSequence
                    tab.buttonGradient.Rotation = window.theme.tab_button.hover.gradient.Rotation
                end
            end
        )
        tab.button.MouseLeave:Connect(
            function()
                if tab._tabsEntry then tab._tabsEntry._hover = false end
                if tab.visible == true then return end
                helpers.tweenObject(
                    tab.button,
                    {TextColor3 = window.theme.tab_button.off.textColor},
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                )
                helpers.tweenObject(
                    tab.padding,
                    {
                        PaddingBottom = window.theme.tab_button.off.padding.bottom
                    },
                    0.15,
                    Enum.EasingStyle.Quad,
                    Enum.EasingDirection.Out
                )
                if tab.buttonGradient then
                    tab.buttonGradient.Color = window.theme.tab_button.off.gradient.ColorSequence
                    tab.buttonGradient.Rotation = window.theme.tab_button.off.gradient.Rotation
                end
            end
        )

        -- auto-update CanvasSize based on left/right sections' heights
        local function updateCanvasSize()
            local leftY = tab.left_section.AbsoluteSize.Y
            local rightY = tab.right_section.AbsoluteSize.Y
            local contentY = math.max(leftY, rightY)
            tab.container.CanvasSize = UDim2.new(0, 0, 0, contentY)
        end
        tab.left_section:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvasSize)
        tab.right_section:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateCanvasSize)
        -- initial sync
        task.delay(0, updateCanvasSize)

        function tab:setVisible()
            for _, v in pairs(tabs) do
                helpers.tweenObject(
                    v.indicator,
                    {Size = UDim2.new(0, 0, 0, 2)},
                    0.2,
                    Enum.EasingStyle.Quint,
                    Enum.EasingDirection.Out
                )
                helpers.tweenObject(
                    v.button,
                    {TextColor3 = window.theme.tab_button.off.textColor},
                    0.2,
                    Enum.EasingStyle.Quint,
                    Enum.EasingDirection.Out
                )
                helpers.tweenObject(
                    v.padding,
                    {
                        PaddingBottom = window.theme.tab_button.off.padding.bottom
                    },
                    0.2,
                    Enum.EasingStyle.Quint,
                    Enum.EasingDirection.Out
                )
                v.container.Visible = false
                v.visible = false
            end

            helpers.tweenObject(
                tab.indicator,
                {Size = window.theme.indicator.size},
                0.2,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            )
            helpers.tweenObject(
                tab.button,
                {TextColor3 = window.theme.tab_button.on.textColor},
                0.2,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            )
            -- update gradient for selected state
            if tab.buttonGradient then
                tab.buttonGradient.Color = window.theme.tab_button.on.gradient.ColorSequence
                tab.buttonGradient.Rotation = window.theme.tab_button.on.gradient.Rotation
            end
            -- tween textcolor to on color
            tab.container.Visible = true
            tab.visible = true
            if tab._tabsEntry then
                tab._tabsEntry.visible = true
                tab._tabsEntry._hover = false
            end
        end

        tab.button.MouseButton1Click:Connect(
            function()
                tab:setVisible()
            end
        )

        task.delay(
            0.2,
            function()
                if tab.settings.default == true and tab.visible == true then
                    tab:setVisible()
                end
            end
        )

        function tab:createCard(cardSettings)
            local card = {}

            card.settings =
                cardSettings or
                {
                    title = "card",
                    section = "left"
                }

            card.frame =
                helpers.createInstance(
                "Frame",
                {
                    Name = card.settings.title or "card",
                    BackgroundColor3 = window.theme.card.background,
                    BackgroundTransparency = window.theme.card.backgroundtransparency,
                    BorderSizePixel = 0,
                    AnchorPoint = window.theme.card.anchorPoint,
                    Size = window.theme.card.size,
                    AutomaticSize = window.theme.card.automaticSize,
                    ZIndex = Z.CARD,
                    Parent = tab.container[card.settings.section .. "_section"] or tab.container.left_section
                }
            )

            helpers.applyUIGradient(
                card.frame,
                window.theme.card.gradient.ColorSequence,
                window.theme.card.gradient.Rotation
            )
            helpers.appendUIStroke(
                card.frame,
                window.theme.card.stroke.color,
                window.theme.card.stroke.thickness,
                window.theme.card.stroke.strokeMode,
                window.theme.card.stroke.lineJoinMode
            )
            helpers.applyListLayout(
                card.frame,
                {
                    FillDirection = window.theme.card.listlayout.fillDirection,
                    HorizontalAlignment = window.theme.card.listlayout.horizontalAlignment,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = window.theme.card.listlayout.verticalAlignment,
                    Padding = window.theme.card.listlayout.padding
                }
            )

            card.title =
                helpers.createInstance(
                "TextLabel",
                {
                    Name = "card_title",
                    Text = card.settings.title or "card",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = window.theme.cardtitle.anchorPoint,
                    Size = window.theme.cardtitle.size,
                    Position = window.theme.cardtitle.position,
                    ZIndex = Z.CARD + 1,
                    Font = window.theme.cardtitle.textFont,
                    TextColor3 = window.theme.cardtitle.textColor,
                    TextSize = window.theme.cardtitle.textSize,
                    TextXAlignment = window.theme.cardtitle.textalignment,
                    Parent = card.frame
                }
            )

            helpers.applyUIGradient(
                card.title,
                window.theme.cardtitle.gradient.ColorSequence,
                window.theme.cardtitle.gradient.Rotation
            )
            helpers.applyPadding(
                card.title,
                {
                    PaddingLeft = window.theme.cardtitle.padding.left,
                    PaddingRight = window.theme.cardtitle.padding.right,
                    PaddingTop = window.theme.cardtitle.padding.top,
                    PaddingBottom = window.theme.cardtitle.padding.bottom
                }
            )

            card.content =
                helpers.createInstance(
                "Frame",
                {
                    Name = "card_content",
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = window.theme.cardcontent.size,
                    AnchorPoint = window.theme.cardcontent.anchorPoint,
                    AutomaticSize = window.theme.cardcontent.automaticSize,
                    ZIndex = Z.CARD + 1,
                    Parent = card.frame
                }
            )

            helpers.applyListLayout(
                card.content,
                {
                    FillDirection = window.theme.cardcontent.listlayout.fillDirection,
                    HorizontalAlignment = window.theme.cardcontent.listlayout.horizontalAlignment,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = window.theme.cardcontent.listlayout.verticalAlignment,
                    Padding = window.theme.cardcontent.listlayout.padding
                }
            )

            helpers.applyPadding(
                card.content,
                {
                    PaddingLeft = window.theme.cardcontent.padding.left,
                    PaddingRight = window.theme.cardcontent.padding.right,
                    PaddingTop = window.theme.cardcontent.padding.top,
                    PaddingBottom = window.theme.cardcontent.padding.bottom
                }
            )

            function card:richTextLabel(rTLSettings)
                local richTextLabel = {}

                richTextLabel.label =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = rTLSettings.name or "rich_text_label",
                        Text = rTLSettings.text or "rich text label",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.richTextLabel.textFont,
                        TextColor3 = window.theme.richTextLabel.textColor,
                        TextSize = window.theme.richTextLabel.textSize,
                        TextXAlignment = window.theme.richTextLabel.textalignment,
                        RichText = window.theme.richTextLabel.richText,
                        AutomaticSize = window.theme.richTextLabel.automaticSize,
                        Size = window.theme.richTextLabel.size,
                        AnchorPoint = window.theme.richTextLabel.anchorPoint,
                        Parent = card.content
                    }
                )

                helpers.applyPadding(
                    richTextLabel.label,
                    {
                        PaddingLeft = window.theme.richTextLabel.padding.left,
                        PaddingRight = window.theme.richTextLabel.padding.right,
                        PaddingTop = window.theme.richTextLabel.padding.top,
                        PaddingBottom = window.theme.richTextLabel.padding.bottom
                    }
                )

                richTextLabel.setText = function(newText)
                    richTextLabel.label.Text = newText
                end

                return richTextLabel
            end

            function card:button(buttonSettings)
                local button = {}

                button.settings =
                    buttonSettings or
                    {
                        name = "button",
                        text = "button",
                        callback = function()
                        end
                    }
                button.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "button_frame",
                        Size = window.theme.button.singlewide.frame.size,
                        AnchorPoint = window.theme.button.singlewide.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                button.textbutton =
                    helpers.createInstance(
                    "TextButton",
                    {
                        Name = button.settings.name or "button",
                        Text = button.settings.text or "button",
                        BackgroundColor3 = window.theme.button.singlewide.background,
                        BackgroundTransparency = window.theme.button.singlewide.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.button.singlewide.anchorPoint,
                        Position = window.theme.button.singlewide.position,
                        AutomaticSize = window.theme.button.singlewide.automaticSize,
                        Size = window.theme.button.singlewide.size,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.button.singlewide.textFont,
                        TextColor3 = window.theme.button.singlewide.textColor,
                        TextSize = window.theme.button.singlewide.textSize,
                        TextXAlignment = window.theme.button.singlewide.textAlignment,
                        Parent = button.frame
                    }
                )

                helpers.appendUICorner(button.textbutton, window.theme.button.subtext.cornerRadius)
                helpers.appendUIStroke(
                    button.textbutton,
                    window.theme.button.subtext.stroke.color,
                    window.theme.button.subtext.stroke.thickness,
                    window.theme.button.subtext.stroke.strokeMode,
                    window.theme.button.subtext.stroke.lineJoinMode
                )
                button.textbutton.MouseButton1Click:Connect(
                    function()
                        if button.settings.callback then
                            button.settings.callback()
                        end
                    end
                )

                -- register (stateless, but allow trigger via boolean if needed)
                local key = button.settings.name or "button"
                window:_registerControl(key, {
                    get = function() return true end,
                    set = function(_) -- buttons have no persistent value
                    end
                })

                return button
            end

            function card:subtextbutton(subtextbuttonSettings)
                local button = {}

                button.settings =
                    subtextbuttonSettings or
                    {
                        name = "subtext_button",
                        text = "button",
                        subtext = "subtext",
                        callback = function()
                        end
                    }

                button.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "subtext_button_frame",
                        Size = window.theme.button.subtext.frame.size,
                        AnchorPoint = window.theme.button.subtext.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                button.subtextlabel =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "subtext_label",
                        Text = button.settings.subtext or "subtext",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.button.subtext.richTextLabel.textFont,
                        TextColor3 = window.theme.button.subtext.richTextLabel.textColor,
                        TextSize = window.theme.button.subtext.richTextLabel.textSize,
                        TextXAlignment = window.theme.button.subtext.richTextLabel.textalignment,
                        RichText = window.theme.button.subtext.richTextLabel.richText,
                        Size = window.theme.button.subtext.richTextLabel.size,
                        Position = window.theme.button.subtext.richTextLabel.position,
                        AnchorPoint = window.theme.button.subtext.richTextLabel.anchorPoint,
                        Parent = button.frame
                    }
                )

                helpers.applyPadding(
                    button.subtextlabel,
                    {
                        PaddingLeft = window.theme.button.subtext.richTextLabel.padding.left,
                        PaddingRight = window.theme.button.subtext.richTextLabel.padding.right,
                        PaddingTop = window.theme.button.subtext.richTextLabel.padding.top,
                        PaddingBottom = window.theme.button.subtext.richTextLabel.padding.bottom
                    }
                )

                button.textbutton =
                    helpers.createInstance(
                    "TextButton",
                    {
                        Name = button.settings.name or "subtext_button",
                        Text = button.settings.text or "button",
                        BackgroundColor3 = window.theme.button.subtext.background,
                        BackgroundTransparency = window.theme.button.subtext.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.button.subtext.anchorPoint,
                        Position = window.theme.button.subtext.position,
                        AutomaticSize = window.theme.button.subtext.automaticSize,
                        Size = window.theme.button.subtext.size,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.button.subtext.textFont,
                        TextColor3 = window.theme.button.subtext.textColor,
                        TextSize = window.theme.button.subtext.textSize,
                        TextXAlignment = window.theme.button.subtext.textAlignment,
                        Parent = button.frame
                    }
                )
                helpers.appendUICorner(button.textbutton, window.theme.button.subtext.cornerRadius)
                helpers.appendUIStroke(
                    button.textbutton,
                    window.theme.button.subtext.stroke.color,
                    window.theme.button.subtext.stroke.thickness,
                    window.theme.button.subtext.stroke.strokeMode,
                    window.theme.button.subtext.stroke.lineJoinMode
                )
                button.textbutton.MouseButton1Click:Connect(
                    function()
                        if button.settings.callback then
                            button.settings.callback()
                        end
                    end
                )

                return button
            end

            function card:checkboxtoggle(checkboxtoggleSettings)
                local toggle = {}

                toggle.settings =
                    checkboxtoggleSettings or
                    {
                        name = "checkbox_toggle",
                        text = "checkbox",
                        callback = function()
                        end,
                        default = false
                    }

                toggle.value = toggle.settings.default or false

                toggle.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "checkbox_toggle_frame",
                        Size = window.theme.toggle.frame.size,
                        AnchorPoint = window.theme.toggle.frame.anchorPoint,
                        BackgroundColor3 = window.theme.toggle.frame.background,
                        BackgroundTransparency = window.theme.toggle.frame.backgroundTransparency,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                toggle.label =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "checkbox_label",
                        Text = toggle.settings.text or "checkbox",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.toggle.richTextLabel.textFont,
                        TextColor3 = window.theme.toggle.richTextLabel.textColor,
                        TextSize = window.theme.toggle.richTextLabel.textSize,
                        TextXAlignment = window.theme.toggle.richTextLabel.textalignment,
                        AutomaticSize = window.theme.toggle.richTextLabel.automaticSize,
                        Size = window.theme.toggle.richTextLabel.size,
                        AnchorPoint = window.theme.toggle.richTextLabel.anchorPoint,
                        Position = window.theme.toggle.richTextLabel.position,
                        Parent = toggle.frame
                    }
                )

                helpers.applyPadding(
                    toggle.label,
                    {
                        PaddingLeft = window.theme.toggle.richTextLabel.padding.left,
                        PaddingRight = window.theme.toggle.richTextLabel.padding.right,
                        PaddingTop = window.theme.toggle.richTextLabel.padding.top,
                        PaddingBottom = window.theme.toggle.richTextLabel.padding.bottom
                    }
                )

                toggle.button =
                    helpers.createInstance(
                    "ImageButton",
                    {
                        Name = toggle.settings.name or "checkbox_toggle",
                        BackgroundColor3 = window.theme.toggle.button.background,
                        BackgroundTransparency = window.theme.toggle.button.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.toggle.button.anchorPoint,
                        Size = window.theme.toggle.button.size,
                        Position = window.theme.toggle.button.position,
                        ZIndex = Z.COMPONENT + 1,
                        Parent = toggle.frame,
                        Image = window.theme.toggle.button.image,
                        ImageTransparency = (toggle.value and 0 or 1)
                    }
                )

                helpers.appendUICorner(toggle.button, window.theme.toggle.button.cornerRadius)

                helpers.appendUIStroke(
                    toggle.button,
                    window.theme.toggle.button.stroke.color,
                    window.theme.toggle.button.stroke.thickness,
                    window.theme.toggle.button.stroke.strokeMode,
                    window.theme.toggle.button.stroke.lineJoinMode
                )

                toggle.button.MouseButton1Click:Connect(
                    function()
                        toggle.value = not toggle.value
                        if toggle.value then
                            helpers.tweenObject(
                                toggle.button,
                                {ImageTransparency = 0},
                                0.15,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        else
                            helpers.tweenObject(
                                toggle.button,
                                {ImageTransparency = 1},
                                0.15,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                        if toggle.settings.callback then
                            toggle.settings.callback(toggle.value)
                        end
                    end
                )

                -- register
                window:_registerControl(toggle.settings.name or "checkbox_toggle", {
                    get = function() return toggle.value end,
                    set = function(v)
                        local nv = not not v
                        if nv ~= toggle.value then
                            toggle.value = nv
                            helpers.tweenObject(toggle.button, {ImageTransparency = nv and 0 or 1}, 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                            if toggle.settings.callback then toggle.settings.callback(toggle.value) end
                        end
                    end
                })

                return toggle
            end

            function card:inputtextbox(textboxSettings)
                local textbox = {}

                textbox.settings =
                    textboxSettings or
                    {
                        name = "input_textbox",
                        text = "textbox",
                        placeholder = "enter text...",
                        post = "focusLost",
                        callback = function()
                        end
                    }

                -- singlewide
                textbox.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "input_textbox_frame",
                        Size = window.theme.textbox.singlewide.frame.size,
                        AnchorPoint = window.theme.textbox.singlewide.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                textbox.textbox =
                    helpers.createInstance(
                    "TextBox",
                    {
                        Name = textbox.settings.name or "input_textbox",
                        Text = textbox.settings.text or "textbox",
                        PlaceholderText = textbox.settings.placeholder or "enter text...",
                        BackgroundColor3 = window.theme.textbox.singlewide.background,
                        BackgroundTransparency = window.theme.textbox.singlewide.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.textbox.singlewide.anchorPoint,
                        Position = window.theme.textbox.singlewide.position,
                        AutomaticSize = window.theme.textbox.singlewide.automaticSize,
                        Size = window.theme.textbox.singlewide.size,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.textbox.singlewide.textFont,
                        TextColor3 = window.theme.textbox.singlewide.textColor,
                        TextSize = window.theme.textbox.singlewide.textSize,
                        TextXAlignment = window.theme.textbox.singlewide.textAlignment,
                        ClearTextOnFocus = false,
                        Parent = textbox.frame
                    }
                )

                helpers.appendUICorner(textbox.textbox, window.theme.textbox.singlewide.cornerRadius)

                helpers.appendUIStroke(
                    textbox.textbox,
                    window.theme.textbox.singlewide.stroke.color,
                    window.theme.textbox.singlewide.stroke.thickness,
                    window.theme.textbox.singlewide.stroke.strokeMode,
                    window.theme.textbox.singlewide.stroke.lineJoinMode
                )

                -- indicator for focus state
                textbox.indicator =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "indicator",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.new(0, 0, 0, 2),
                        Position = window.theme.textbox.singlewide.indicator.position,
                        BackgroundColor3 = window.theme.textbox.singlewide.indicator.background,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT + 1,
                        Parent = textbox.textbox
                    }
                )

                helpers.applyUIGradient(
                    textbox.indicator,
                    window.theme.textbox.singlewide.indicator.gradient.ColorSequence,
                    window.theme.textbox.singlewide.indicator.gradient.Rotation
                )

                textbox.textbox.Focused:Connect(
                    function()
                        helpers.tweenObject(
                            textbox.indicator,
                            {Size = window.theme.textbox.singlewide.indicator.size},
                            0.2,
                            Enum.EasingStyle.Quint,
                            Enum.EasingDirection.Out
                        )
                    end
                )
                -- tween back to 0 size when focus is lost
                textbox.textbox.FocusLost:Connect(
                    function()
                        helpers.tweenObject(
                            textbox.indicator,
                            {Size = UDim2.new(0, 0, 0, 2)},
                            0.2,
                            Enum.EasingStyle.Quint,
                            Enum.EasingDirection.Out
                        )
                    end
                )

                local post = textbox.settings.post

                local function fireCallback()
                    if textbox.settings.callback then
                        textbox.settings.callback(textbox.textbox.Text)
                    end
                end

                if type(post) == "string" then
                    if post:lower() == "focuslost" then
                        textbox.textbox.FocusLost:Connect(
                            function()
                                fireCallback()
                            end
                        )
                    else
                        local ok, sig =
                            pcall(
                            function()
                                return textbox.textbox:GetPropertyChangedSignal(post)
                            end
                        )
                        if ok and sig then
                            sig:Connect(fireCallback)
                        else
                            -- Fallback to Text changes if invalid property
                            textbox.textbox:GetPropertyChangedSignal("Text"):Connect(fireCallback)
                        end
                    end
                elseif type(post) == "table" then
                    -- Support a list of properties
                    for _, prop in ipairs(post) do
                        if type(prop) == "string" then
                            local ok, sig =
                                pcall(
                                function()
                                    return textbox.textbox:GetPropertyChangedSignal(prop)
                                end
                            )
                            if ok and sig then
                                sig:Connect(fireCallback)
                            end
                        end
                    end
                else
                    -- Default behavior
                    textbox.textbox.FocusLost:Connect(
                        function()
                            fireCallback()
                        end
                    )
                end
                -- register
                window:_registerControl(textbox.settings.name or "input_textbox", {
                    get = function() return textbox.textbox.Text end,
                    set = function(v)
                        if type(v) ~= "string" then v = tostring(v) end
                        textbox.textbox.Text = v
                        if textbox.settings.callback then textbox.settings.callback(v) end
                    end
                })

                return textbox
            end

            function card:subtexttextbox(subtexttextboxSettings)
                local textbox = {}

                textbox.settings =
                    subtexttextboxSettings or
                    {
                        name = "subtext_textbox",
                        text = "",
                        subtext = "subtext",
                        placeholder = "default text",
                        post = "focusLost",
                        callback = function()
                        end
                    }

                -- container frame (matches subtext style frame)
                textbox.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "subtext_textbox_frame",
                        Size = window.theme.textbox.subtext.frame.size,
                        AnchorPoint = window.theme.textbox.subtext.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                -- subtext label above the textbox
                textbox.subtextlabel =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "subtext_label",
                        Text = textbox.settings.subtext or "subtext",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.textbox.subtext.richTextLabel.textFont,
                        TextColor3 = window.theme.textbox.subtext.richTextLabel.textColor,
                        TextSize = window.theme.textbox.subtext.richTextLabel.textSize,
                        TextXAlignment = window.theme.textbox.subtext.richTextLabel.textalignment,
                        RichText = window.theme.textbox.subtext.richTextLabel.richText,
                        AutomaticSize = window.theme.textbox.subtext.richTextLabel.automaticSize,
                        Size = window.theme.textbox.subtext.richTextLabel.size,
                        Position = window.theme.textbox.subtext.richTextLabel.position,
                        AnchorPoint = window.theme.textbox.subtext.richTextLabel.anchorPoint,
                        Parent = textbox.frame
                    }
                )

                helpers.applyPadding(
                    textbox.subtextlabel,
                    {
                        PaddingLeft = window.theme.textbox.subtext.richTextLabel.padding.left,
                        PaddingRight = window.theme.textbox.subtext.richTextLabel.padding.right,
                        PaddingTop = window.theme.textbox.subtext.richTextLabel.padding.top,
                        PaddingBottom = window.theme.textbox.subtext.richTextLabel.padding.bottom
                    }
                )

                -- textbox input below the label
                textbox.textbox =
                    helpers.createInstance(
                    "TextBox",
                    {
                        Name = textbox.settings.name or "subtext_textbox",
                        Text = textbox.settings.text or "",
                        PlaceholderText = textbox.settings.placeholder or "default text",
                        PlaceholderColor3 = window.theme.textbox.subtext.placeholderColor,
                        BackgroundColor3 = window.theme.textbox.subtext.background,
                        BackgroundTransparency = window.theme.textbox.subtext.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.textbox.subtext.anchorPoint,
                        Position = window.theme.textbox.subtext.position,
                        AutomaticSize = window.theme.textbox.subtext.automaticSize,
                        Size = window.theme.textbox.subtext.size,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.textbox.subtext.textFont,
                        TextColor3 = window.theme.textbox.subtext.textColor,
                        TextSize = window.theme.textbox.subtext.textSize,
                        TextXAlignment = window.theme.textbox.subtext.textAlignment,
                        ClearTextOnFocus = false,
                        Parent = textbox.frame
                    }
                )

                helpers.appendUICorner(textbox.textbox, window.theme.textbox.subtext.cornerRadius)
                helpers.appendUIStroke(
                    textbox.textbox,
                    window.theme.textbox.subtext.stroke.color,
                    window.theme.textbox.subtext.stroke.thickness,
                    window.theme.textbox.subtext.stroke.strokeMode,
                    window.theme.textbox.subtext.stroke.lineJoinMode
                )

                -- underline indicator (same as inputtextbox)
                textbox.indicator =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "indicator",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.new(0, 0, 0, 2),
                        Position = window.theme.textbox.singlewide.indicator.position,
                        BackgroundColor3 = window.theme.textbox.singlewide.indicator.background,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT + 1,
                        Parent = textbox.textbox
                    }
                )

                helpers.applyUIGradient(
                    textbox.indicator,
                    window.theme.textbox.singlewide.indicator.gradient.ColorSequence,
                    window.theme.textbox.singlewide.indicator.gradient.Rotation
                )

                textbox.textbox.Focused:Connect(
                    function()
                        helpers.tweenObject(
                            textbox.indicator,
                            {Size = window.theme.textbox.singlewide.indicator.size},
                            0.2,
                            Enum.EasingStyle.Quint,
                            Enum.EasingDirection.Out
                        )
                    end
                )

                textbox.textbox.FocusLost:Connect(
                    function()
                        helpers.tweenObject(
                            textbox.indicator,
                            {Size = UDim2.new(0, 0, 0, 2)},
                            0.2,
                            Enum.EasingStyle.Quint,
                            Enum.EasingDirection.Out
                        )
                    end
                )

                -- callback wiring (same pattern as inputtextbox)
                local post = textbox.settings.post

                local function fireCallback()
                    if textbox.settings.callback then
                        textbox.settings.callback(textbox.textbox.Text)
                    end
                end

                if type(post) == "string" then
                    if post:lower() == "focuslost" then
                        textbox.textbox.FocusLost:Connect(
                            function()
                                fireCallback()
                            end
                        )
                    else
                        local ok, sig =
                            pcall(
                            function()
                                return textbox.textbox:GetPropertyChangedSignal(post)
                            end
                        )
                        if ok and sig then
                            sig:Connect(fireCallback)
                        else
                            textbox.textbox:GetPropertyChangedSignal("Text"):Connect(fireCallback)
                        end
                    end
                elseif type(post) == "table" then
                    for _, prop in ipairs(post) do
                        if type(prop) == "string" then
                            local ok, sig =
                                pcall(
                                function()
                                    return textbox.textbox:GetPropertyChangedSignal(prop)
                                end
                            )
                            if ok and sig then
                                sig:Connect(fireCallback)
                            end
                        end
                    end
                else
                    textbox.textbox.FocusLost:Connect(
                        function()
                            fireCallback()
                        end
                    )
                end

                -- register
                window:_registerControl(textbox.settings.name or "subtext_textbox", {
                    get = function() return textbox.textbox.Text end,
                    set = function(v)
                        if type(v) ~= "string" then v = tostring(v) end
                        textbox.textbox.Text = v
                        if textbox.settings.callback then textbox.settings.callback(v) end
                    end
                })

                return textbox
            end

            function card:inlinetextbox(inlinetextboxSettings)
                local textbox = {}

                textbox.settings =
                    inlinetextboxSettings or
                    {
                        name = "inline_textbox",
                        text = "",
                        subtext = "subtext",
                        placeholder = "default text",
                        post = "focusLost",
                        callback = function()
                        end
                    }

                -- container frame for inline layout
                textbox.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "inline_textbox_frame",
                        Size = window.theme.textbox.inline.frame.size,
                        AnchorPoint = window.theme.textbox.inline.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                -- left label
                textbox.subtextlabel =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "inline_label",
                        Text = textbox.settings.subtext or "subtext",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.textbox.inline.richTextLabel.textFont,
                        TextColor3 = window.theme.textbox.inline.richTextLabel.textColor,
                        TextSize = window.theme.textbox.inline.richTextLabel.textSize,
                        TextXAlignment = window.theme.textbox.inline.richTextLabel.textalignment,
                        RichText = window.theme.textbox.inline.richTextLabel.richText,
                        AutomaticSize = window.theme.textbox.inline.richTextLabel.automaticSize,
                        Size = window.theme.textbox.inline.richTextLabel.size,
                        Position = window.theme.textbox.inline.richTextLabel.position,
                        AnchorPoint = window.theme.textbox.inline.richTextLabel.anchorPoint,
                        Parent = textbox.frame
                    }
                )

                helpers.applyPadding(
                    textbox.subtextlabel,
                    {
                        PaddingLeft = window.theme.textbox.inline.richTextLabel.padding.left,
                        PaddingRight = window.theme.textbox.inline.richTextLabel.padding.right,
                        PaddingTop = window.theme.textbox.inline.richTextLabel.padding.top,
                        PaddingBottom = window.theme.textbox.inline.richTextLabel.padding.bottom
                    }
                )

                -- right input box
                textbox.textbox =
                    helpers.createInstance(
                    "TextBox",
                    {
                        Name = textbox.settings.name or "inline_textbox",
                        Text = textbox.settings.text or "",
                        PlaceholderText = textbox.settings.placeholder or "default text",
                        PlaceholderColor3 = window.theme.textbox.inline.placeholderColor,
                        BackgroundColor3 = window.theme.textbox.inline.background,
                        BackgroundTransparency = window.theme.textbox.inline.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.textbox.inline.anchorPoint,
                        Position = window.theme.textbox.inline.position,
                        Size = window.theme.textbox.inline.size,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.textbox.inline.textFont,
                        TextColor3 = window.theme.textbox.inline.textColor,
                        TextSize = window.theme.textbox.inline.textSize,
                        TextXAlignment = window.theme.textbox.inline.textAlignment,
                        ClearTextOnFocus = false,
                        Parent = textbox.frame
                    }
                )

                helpers.appendUICorner(textbox.textbox, window.theme.textbox.inline.cornerRadius)
                helpers.appendUIStroke(
                    textbox.textbox,
                    window.theme.textbox.inline.stroke.color,
                    window.theme.textbox.inline.stroke.thickness,
                    window.theme.textbox.inline.stroke.strokeMode,
                    window.theme.textbox.inline.stroke.lineJoinMode
                )

                -- callback wiring (same as other textbox variants)
                local post = textbox.settings.post

                local function fireCallback()
                    if textbox.settings.callback then
                        textbox.settings.callback(textbox.textbox.Text)
                    end
                end

                if type(post) == "string" then
                    if post:lower() == "focuslost" then
                        textbox.textbox.FocusLost:Connect(
                            function()
                                fireCallback()
                            end
                        )
                    else
                        local ok, sig =
                            pcall(
                            function()
                                return textbox.textbox:GetPropertyChangedSignal(post)
                            end
                        )
                        if ok and sig then
                            sig:Connect(fireCallback)
                        else
                            textbox.textbox:GetPropertyChangedSignal("Text"):Connect(fireCallback)
                        end
                    end
                elseif type(post) == "table" then
                    for _, prop in ipairs(post) do
                        if type(prop) == "string" then
                            local ok, sig =
                                pcall(
                                function()
                                    return textbox.textbox:GetPropertyChangedSignal(prop)
                                end
                            )
                            if ok and sig then
                                sig:Connect(fireCallback)
                            end
                        end
                    end
                else
                    textbox.textbox.FocusLost:Connect(
                        function()
                            fireCallback()
                        end
                    )
                end

                -- underline indicator (match other textbox variants)
                textbox.indicator =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "indicator",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.new(0, 0, 0, 2),
                        Position = window.theme.textbox.singlewide.indicator.position,
                        BackgroundColor3 = window.theme.textbox.singlewide.indicator.background,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT + 1,
                        Parent = textbox.textbox
                    }
                )

                helpers.applyUIGradient(
                    textbox.indicator,
                    window.theme.textbox.singlewide.indicator.gradient.ColorSequence,
                    window.theme.textbox.singlewide.indicator.gradient.Rotation
                )

                textbox.textbox.Focused:Connect(
                    function()
                        helpers.tweenObject(
                            textbox.indicator,
                            {Size = window.theme.textbox.singlewide.indicator.size},
                            0.2,
                            Enum.EasingStyle.Quint,
                            Enum.EasingDirection.Out
                        )
                    end
                )
                textbox.textbox.FocusLost:Connect(
                    function()
                        helpers.tweenObject(
                            textbox.indicator,
                            {Size = UDim2.new(0, 0, 0, 2)},
                            0.2,
                            Enum.EasingStyle.Quint,
                            Enum.EasingDirection.Out
                        )
                    end
                )

                -- register
                window:_registerControl(textbox.settings.name or "inline_textbox", {
                    get = function() return textbox.textbox.Text end,
                    set = function(v)
                        if type(v) ~= "string" then v = tostring(v) end
                        textbox.textbox.Text = v
                        if textbox.settings.callback then textbox.settings.callback(v) end
                    end
                })

                return textbox
            end

            function card:keybind(keybindSettings)
                local keybind = {}

                keybind.settings =
                    keybindSettings or
                    {
                        name = "keybind",
                        subtext = "keybind",
                        default = nil, -- Enum.KeyCode or string name, or nil for unbound
                        callback = function(_keyCode)
                        end, -- when binding changes
                        onActivated = function()
                        end -- when bound key is pressed
                    }

                local UIS = game:GetService("UserInputService")
                local listening = false
                local inputConn  -- connection for capture while listening
                local activateConn  -- global activation connection

                -- normalize default key
                if typeof(keybind.settings.default) == "string" then
                    local upper = string.upper(keybind.settings.default)
                    keybind.currentKey = Enum.KeyCode[upper]
                elseif typeof(keybind.settings.default) == "EnumItem" then
                    keybind.currentKey = keybind.settings.default
                else
                    keybind.currentKey = nil
                end

                -- container frame (reuse subtext button frame style)
                keybind.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "keybind_frame",
                        Size = window.theme.button.subtext.frame.size,
                        AnchorPoint = window.theme.button.subtext.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                -- subtext label on top
                keybind.subtextlabel =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "keybind_label",
                        Text = keybind.settings.subtext or "keybind",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.button.subtext.richTextLabel.textFont,
                        TextColor3 = window.theme.button.subtext.richTextLabel.textColor,
                        TextSize = window.theme.button.subtext.richTextLabel.textSize,
                        TextXAlignment = window.theme.button.subtext.richTextLabel.textalignment,
                        RichText = window.theme.button.subtext.richTextLabel.richText,
                        Size = window.theme.button.subtext.richTextLabel.size,
                        Position = window.theme.button.subtext.richTextLabel.position,
                        AnchorPoint = window.theme.button.subtext.richTextLabel.anchorPoint,
                        Parent = keybind.frame
                    }
                )

                helpers.applyPadding(
                    keybind.subtextlabel,
                    {
                        PaddingLeft = window.theme.button.subtext.richTextLabel.padding.left,
                        PaddingRight = window.theme.button.subtext.richTextLabel.padding.right,
                        PaddingTop = window.theme.button.subtext.richTextLabel.padding.top,
                        PaddingBottom = window.theme.button.subtext.richTextLabel.padding.bottom
                    }
                )

                -- button showing current binding
                keybind.button =
                    helpers.createInstance(
                    "TextButton",
                    {
                        Name = keybind.settings.name or "keybind",
                        Text = "",
                        BackgroundColor3 = window.theme.button.subtext.background,
                        BackgroundTransparency = window.theme.button.subtext.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = window.theme.button.subtext.anchorPoint,
                        Position = window.theme.button.subtext.position,
                        AutomaticSize = window.theme.button.subtext.automaticSize,
                        Size = window.theme.button.subtext.size,
                        ZIndex = Z.COMPONENT,
                        Font = window.theme.button.subtext.textFont,
                        TextColor3 = window.theme.button.subtext.textColor,
                        TextSize = window.theme.button.subtext.textSize,
                        TextXAlignment = window.theme.button.subtext.textAlignment,
                        Parent = keybind.frame
                    }
                )

                helpers.appendUICorner(keybind.button, window.theme.button.subtext.cornerRadius)
                helpers.appendUIStroke(
                    keybind.button,
                    window.theme.button.subtext.stroke.color,
                    window.theme.button.subtext.stroke.thickness,
                    window.theme.button.subtext.stroke.strokeMode,
                    window.theme.button.subtext.stroke.lineJoinMode
                )

                local function keyToString(kc)
                    if not kc then
                        return "Unbound"
                    end
                    -- Prefer localized names if needed; simple mapping here
                    return kc.Name or tostring(kc)
                end

                local function updateButtonText()
                    if listening then
                        keybind.button.Text = "Press a key..."
                    else
                        keybind.button.Text = keyToString(keybind.currentKey)
                    end
                end

                local function disconnectActivate()
                    if activateConn then
                        activateConn:Disconnect()
                        activateConn = nil
                    end
                end

                local function setupActivate()
                    disconnectActivate()
                    if not keybind.currentKey then
                        return
                    end
                    activateConn =
                        UIS.InputBegan:Connect(
                        function(input, gp)
                            if gp then
                                return
                            end
                            if UIS:GetFocusedTextBox() then
                                return
                            end
                            if listening then
                                return
                            end
                            if input.KeyCode == keybind.currentKey then
                                if keybind.settings.onActivated then
                                    keybind.settings.onActivated()
                                end
                            end
                        end
                    )
                end

                local function finishListening(newKey)
                    listening = false
                    if inputConn then
                        inputConn:Disconnect()
                        inputConn = nil
                    end
                    keybind.currentKey = newKey
                    updateButtonText()
                    if keybind.settings.callback then
                        keybind.settings.callback(keybind.currentKey)
                    end
                    setupActivate()
                end

                keybind.button.MouseButton1Click:Connect(
                    function()
                        if listening then
                            return
                        end
                        listening = true
                        updateButtonText()
                        inputConn =
                            UIS.InputBegan:Connect(
                            function(input, gp)
                                if gp then
                                    return
                                end
                                -- Allow cancel/unbind
                                if input.KeyCode == Enum.KeyCode.Escape then
                                    finishListening(keybind.currentKey) -- cancel, keep existing
                                    return
                                end
                                if input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Delete then
                                    finishListening(nil) -- unbind
                                    return
                                end
                                if
                                    input.UserInputType == Enum.UserInputType.Keyboard and
                                        input.KeyCode ~= Enum.KeyCode.Unknown
                                 then
                                    finishListening(input.KeyCode)
                                end
                            end
                        )
                    end
                )

                -- initialize
                updateButtonText()
                setupActivate()

                -- expose a tiny API
                function keybind:get()
                    return self.currentKey
                end
                function keybind:set(kc)
                    if typeof(kc) == "string" then
                        local upper = string.upper(kc)
                        kc = Enum.KeyCode[upper]
                    end
                    if typeof(kc) == "EnumItem" or kc == nil then
                        finishListening(kc)
                    end
                end
                function keybind:destroy()
                    disconnectActivate()
                    if inputConn then
                        inputConn:Disconnect()
                    end
                    if keybind.frame then
                        keybind.frame:Destroy()
                    end
                end

                -- register
                window:_registerControl(keybind.settings.name or "keybind", {
                    get = function() return keybind:get() end,
                    set = function(v)
                        keybind:set(v)
                    end
                })

                return keybind
            end

            function card:dropdown(dropdownSettings)
                local dd = {}

                dd.settings =
                    dropdownSettings or
                    {
                        name = "dropdown",
                        variant = "inline", -- "inline" | "subtext"
                        label = "dropdown",
                        items = {"item 1", "item 2"},
                        multi = false,
                        placeholder = "selection",
                        onChanged = function(selected)
                        end
                    }

                local variant = (dd.settings.variant == "subtext") and "subtext" or "inline"
                local theme = window.theme.dropdown[variant]

                dd.selected = {}

                local function formatButtonText()
                    if not dd.selected or #dd.selected == 0 then
                        return dd.settings.placeholder or "selection"
                    end
                    return table.concat(dd.selected, ", ")
                end

                -- container
                dd.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = (dd.settings.name or "dropdown") .. "_frame",
                        Size = theme.frame.size,
                        AnchorPoint = theme.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                -- label (inline = left, subtext = top)
                dd.label =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "dropdown_label",
                        Text = dd.settings.label or "dropdown",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = theme.richTextLabel.textFont,
                        TextColor3 = theme.richTextLabel.textColor,
                        TextSize = theme.richTextLabel.textSize,
                        TextXAlignment = theme.richTextLabel.textalignment,
                        RichText = theme.richTextLabel.richText,
                        AutomaticSize = theme.richTextLabel.automaticSize,
                        Size = theme.richTextLabel.size,
                        Position = theme.richTextLabel.position,
                        AnchorPoint = theme.richTextLabel.anchorPoint,
                        Parent = dd.frame
                    }
                )
                helpers.applyPadding(
                    dd.label,
                    {
                        PaddingLeft = theme.richTextLabel.padding.left,
                        PaddingRight = theme.richTextLabel.padding.right,
                        PaddingTop = theme.richTextLabel.padding.top,
                        PaddingBottom = theme.richTextLabel.padding.bottom
                    }
                )

                -- main button
                dd.button =
                    helpers.createInstance(
                    "TextButton",
                    {
                        Name = dd.settings.name or "dropdown",
                        Text = dd.settings.placeholder or "selection",
                        BackgroundColor3 = theme.button.background,
                        BackgroundTransparency = theme.button.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = theme.button.anchorPoint,
                        Position = theme.button.position,
                        Size = theme.button.size,
                        ZIndex = Z.COMPONENT,
                        Font = theme.button.textFont,
                        TextColor3 = theme.button.textColor,
                        TextSize = theme.button.textSize,
                        TextXAlignment = theme.button.textAlignment,
                        Parent = dd.frame
                    }
                )
                helpers.appendUICorner(dd.button, theme.button.cornerRadius)
                helpers.appendUIStroke(
                    dd.button,
                    theme.button.stroke.color,
                    theme.button.stroke.thickness,
                    theme.button.stroke.strokeMode,
                    theme.button.stroke.lineJoinMode
                )
                if variant == "subtext" and theme.button.paddingLeft then
                    helpers.applyPadding(dd.button, {PaddingLeft = theme.button.paddingLeft})
                end

                -- hover/pressed feedback for main button
                do
                    local baseText = theme.button.textColor
                    local baseBgT = theme.button.backgroundTransparency
                    dd.button.MouseEnter:Connect(
                        function()
                            helpers.tweenObject(
                                dd.button,
                                {
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    BackgroundTransparency = math.max(0, baseBgT - 0.1)
                                },
                                0.12,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                    dd.button.MouseLeave:Connect(
                        function()
                            helpers.tweenObject(
                                dd.button,
                                {
                                    TextColor3 = baseText,
                                    BackgroundTransparency = baseBgT
                                },
                                0.12,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                    dd.button.MouseButton1Down:Connect(
                        function()
                            helpers.tweenObject(
                                dd.button,
                                {
                                    BackgroundTransparency = math.max(0, baseBgT - 0.2)
                                },
                                0.08,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                    dd.button.MouseButton1Up:Connect(
                        function()
                            helpers.tweenObject(
                                dd.button,
                                {
                                    BackgroundTransparency = math.max(0, baseBgT - 0.1)
                                },
                                0.08,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                end

                -- items panel
                dd.items =
                    helpers.createInstance(
                    "ScrollingFrame",
                    {
                        Name = "items",
                        BackgroundColor3 = theme.items.background,
                        BackgroundTransparency = theme.items.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = theme.items.anchorPoint,
                        Position = theme.items.position,
                        Size = theme.items.size,
                        ZIndex = Z.POPOUT,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollBarThickness = theme.items.scrollBarThickness,
                        ScrollBarImageColor3 = theme.items.scrollBarColor,
                        Visible = false,
                        Parent = dd.frame,
                        ScrollingDirection = Enum.ScrollingDirection.Y,
                        Selectable = false
                    }
                )
                helpers.appendUICorner(dd.items, theme.items.cornerRadius)
                helpers.appendUIStroke(
                    dd.items,
                    theme.items.stroke.color,
                    theme.items.stroke.thickness,
                    theme.items.stroke.strokeMode,
                    theme.items.stroke.lineJoinMode
                )
                helpers.applyListLayout(
                    dd.items,
                    {
                        HorizontalAlignment = theme.items.listlayout.horizontalAlignment,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = theme.items.listlayout.padding
                    }
                )

                -- populate items
                local function toggleValue(val)
                    if dd.settings.multi then
                        -- multi-select: toggle presence
                        local idx
                        for i, v in ipairs(dd.selected) do
                            if v == val then
                                idx = i
                                break
                            end
                        end
                        if idx then
                            table.remove(dd.selected, idx)
                        else
                            table.insert(dd.selected, val)
                        end
                    else
                        dd.selected = {val}
                        dd.items.Visible = false
                    end
                    dd.button.Text = formatButtonText()
                    if dd.settings.onChanged then
                        dd.settings.onChanged(dd.selected)
                    end
                end

                dd.itemButtons = {}
                for _, val in ipairs(dd.settings.items or {}) do
                    local b =
                        helpers.createInstance(
                        "TextButton",
                        {
                            Name = tostring(val),
                            Text = tostring(val),
                            BackgroundColor3 = theme.items.itemButton.background,
                            BackgroundTransparency = theme.items.itemButton.backgroundTransparency,
                            BorderSizePixel = 0,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Size = theme.items.itemButton.size,
                            ZIndex = Z.POPOUT + 1,
                            Font = theme.items.itemButton.textFont,
                            TextColor3 = theme.items.itemButton.textColor,
                            TextSize = theme.items.itemButton.textSize,
                            TextXAlignment = theme.items.itemButton.textAlignment,
                            Parent = dd.items
                        }
                    )
                    helpers.appendUICorner(b, theme.items.itemButton.cornerRadius)
                    helpers.appendUIStroke(
                        b,
                        theme.items.itemButton.stroke.color,
                        theme.items.itemButton.stroke.thickness,
                        theme.items.itemButton.stroke.strokeMode,
                        theme.items.itemButton.stroke.lineJoinMode
                    )
                    -- hover feedback for item buttons
                    do
                        local baseText = theme.items.itemButton.textColor
                        local baseBgT = theme.items.itemButton.backgroundTransparency
                        b.MouseEnter:Connect(
                            function()
                                helpers.tweenObject(
                                    b,
                                    {
                                        TextColor3 = Color3.fromRGB(255, 255, 255),
                                        BackgroundTransparency = math.max(0, baseBgT - 0.1)
                                    },
                                    0.1,
                                    Enum.EasingStyle.Quad,
                                    Enum.EasingDirection.Out
                                )
                            end
                        )
                        b.MouseLeave:Connect(
                            function()
                                helpers.tweenObject(
                                    b,
                                    {
                                        TextColor3 = baseText,
                                        BackgroundTransparency = baseBgT
                                    },
                                    0.1,
                                    Enum.EasingStyle.Quad,
                                    Enum.EasingDirection.Out
                                )
                            end
                        )
                        b.MouseButton1Down:Connect(
                            function()
                                helpers.tweenObject(
                                    b,
                                    {
                                        BackgroundTransparency = math.max(0, baseBgT - 0.2)
                                    },
                                    0.08,
                                    Enum.EasingStyle.Quad,
                                    Enum.EasingDirection.Out
                                )
                            end
                        )
                        b.MouseButton1Up:Connect(
                            function()
                                helpers.tweenObject(
                                    b,
                                    {
                                        BackgroundTransparency = math.max(0, baseBgT - 0.1)
                                    },
                                    0.08,
                                    Enum.EasingStyle.Quad,
                                    Enum.EasingDirection.Out
                                )
                            end
                        )
                    end
                    b.MouseButton1Click:Connect(
                        function()
                            toggleValue(val)
                        end
                    )
                    table.insert(dd.itemButtons, b)
                end

                -- toggle panel visibility
                dd.button.MouseButton1Click:Connect(
                    function()
                        dd.items.Visible = not dd.items.Visible
                    end
                )

                --[[ robust close when clicking outside items/button
                do
                    local UIS = game:GetService("UserInputService")
                    local function pointInFrame(fr, x, y)
                        if not fr or not fr.AbsoluteSize then
                            return false
                        end
                        local p = fr.AbsolutePosition
                        local s = fr.AbsoluteSize
                        return x >= p.X and x <= p.X + s.X and y >= p.Y and y <= p.Y + s.Y
                    end
                    dd._outsideConn =
                        UIS.InputBegan:Connect(
                        function(input)
                            if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                return
                            end
                            if not dd.items.Visible then
                                return
                            end
                            local pos = UIS:GetMouseLocation()
                            local x, y = pos.X, pos.Y
                            if not pointInFrame(dd.button, x, y) and not pointInFrame(dd.items, x, y) then
                                dd.items.Visible = false
                            end
                        end
                    )
                end
                ]]
                -- API
                function dd:get()
                    return table.clone(self.selected)
                end
                function dd:set(values)
                    if type(values) ~= "table" then
                        values = {values}
                    end
                    self.selected = {}
                    for _, v in ipairs(values) do
                        table.insert(self.selected, v)
                    end
                    dd.button.Text = formatButtonText()
                    if dd.settings.onChanged then
                        dd.settings.onChanged(self.selected)
                    end
                end
                function dd:destroy()
                    if self._outsideConn then
                        self._outsideConn:Disconnect()
                    end
                    if self.frame then
                        self.frame:Destroy()
                    end
                end

                -- initialize
                dd.button.Text = formatButtonText()

                -- register
                window:_registerControl(dd.settings.name or "dropdown", {
                    get = function()
                        return table.clone(dd.selected)
                    end,
                    set = function(values)
                        if type(values) ~= "table" then values = {values} end
                        dd:set(values)
                    end
                })

                return dd
            end

            function card:colorpicker(cpSettings)
                local cp = {}

                cp.settings =
                    cpSettings or
                    {
                        name = "colorpicker",
                        variant = "inline", -- "inline" | "subtext"
                        label = "color",
                        default = Color3.fromRGB(255, 0, 0),
                        onChanged = function(color)
                        end
                    }

                local variant = (cp.settings.variant == "subtext") and "subtext" or "inline"
                local theme = window.theme.colorpicker[variant]

                -- state in HSV for intuitive manipulation
                local hue, sat, val = Color3.toHSV(cp.settings.default or Color3.fromRGB(255, 0, 0))
                cp.color = Color3.fromHSV(hue, sat, val)

                local function colorToHex(c)
                    local r = math.floor(c.R * 255 + 0.5)
                    local g = math.floor(c.G * 255 + 0.5)
                    local b = math.floor(c.B * 255 + 0.5)
                    return string.format("#%02X%02X%02X", r, g, b)
                end

                local function updateButtonText()
                    cp.button.Text = colorToHex(cp.color)
                end

                -- container
                cp.frame =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = (cp.settings.name or "colorpicker") .. "_frame",
                        Size = theme.frame.size,
                        AnchorPoint = theme.frame.anchorPoint,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Parent = card.content
                    }
                )

                -- label
                cp.label =
                    helpers.createInstance(
                    "TextLabel",
                    {
                        Name = "colorpicker_label",
                        Text = cp.settings.label or "color",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ZIndex = Z.COMPONENT,
                        Font = theme.richTextLabel.textFont,
                        TextColor3 = theme.richTextLabel.textColor,
                        TextSize = theme.richTextLabel.textSize,
                        TextXAlignment = theme.richTextLabel.textalignment,
                        RichText = theme.richTextLabel.richText,
                        AutomaticSize = theme.richTextLabel.automaticSize,
                        Size = theme.richTextLabel.size,
                        Position = theme.richTextLabel.position,
                        AnchorPoint = theme.richTextLabel.anchorPoint,
                        Parent = cp.frame
                    }
                )
                helpers.applyPadding(
                    cp.label,
                    {
                        PaddingLeft = theme.richTextLabel.padding.left,
                        PaddingRight = theme.richTextLabel.padding.right,
                        PaddingTop = theme.richTextLabel.padding.top,
                        PaddingBottom = theme.richTextLabel.padding.bottom
                    }
                )

                -- main button
                cp.button =
                    helpers.createInstance(
                    "TextButton",
                    {
                        Name = cp.settings.name or "colorpicker",
                        Text = "",
                        BackgroundColor3 = theme.button.background,
                        BackgroundTransparency = theme.button.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = theme.button.anchorPoint,
                        Position = theme.button.position,
                        Size = theme.button.size,
                        ZIndex = Z.COMPONENT,
                        Font = theme.button.textFont,
                        TextColor3 = theme.button.textColor,
                        TextSize = theme.button.textSize,
                        TextXAlignment = theme.button.textAlignment,
                        Parent = cp.frame
                    }
                )
                helpers.appendUICorner(cp.button, theme.button.cornerRadius)
                helpers.appendUIStroke(
                    cp.button,
                    theme.button.stroke.color,
                    theme.button.stroke.thickness,
                    theme.button.stroke.strokeMode,
                    theme.button.stroke.lineJoinMode
                )
                if theme.button.paddingLeft then
                    helpers.applyPadding(cp.button, {PaddingLeft = theme.button.paddingLeft})
                end

                -- hover/pressed feedback for main button
                do
                    local baseText = theme.button.textColor
                    local baseBgT = theme.button.backgroundTransparency
                    cp.button.MouseEnter:Connect(
                        function()
                            helpers.tweenObject(
                                cp.button,
                                {
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    BackgroundTransparency = math.max(0, baseBgT - 0.1)
                                },
                                0.12,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                    cp.button.MouseLeave:Connect(
                        function()
                            helpers.tweenObject(
                                cp.button,
                                {
                                    TextColor3 = baseText,
                                    BackgroundTransparency = baseBgT
                                },
                                0.12,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                    cp.button.MouseButton1Down:Connect(
                        function()
                            helpers.tweenObject(
                                cp.button,
                                {
                                    BackgroundTransparency = math.max(0, baseBgT - 0.2)
                                },
                                0.08,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                    cp.button.MouseButton1Up:Connect(
                        function()
                            helpers.tweenObject(
                                cp.button,
                                {
                                    BackgroundTransparency = math.max(0, baseBgT - 0.1)
                                },
                                0.08,
                                Enum.EasingStyle.Quad,
                                Enum.EasingDirection.Out
                            )
                        end
                    )
                end

                -- swatch preview inside button (left side)
                local swatchTheme =
                    theme.swatch or
                    {
                        size = UDim2.new(0, 16, 0, 16),
                        position = UDim2.new(0, -20, 0.5, 0),
                        anchorPoint = Vector2.new(0.5, 0.5),
                        cornerRadius = 2
                    }
                cp.swatch =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "swatch",
                        BackgroundColor3 = cp.color,
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        AnchorPoint = swatchTheme.anchorPoint or Vector2.new(0, 0.5),
                        Size = swatchTheme.size or UDim2.new(0, 16, 0, 16),
                        Position = swatchTheme.position or UDim2.new(0, -20, 0.5, 0),
                        ZIndex = Z.COMPONENT + 1,
                        Parent = cp.button
                    }
                )
                helpers.appendUICorner(cp.swatch, swatchTheme.cornerRadius or 2)
                helpers.appendUIStroke(
                    cp.swatch,
                    theme.button.stroke.color,
                    1,
                    theme.button.stroke.strokeMode,
                    theme.button.stroke.lineJoinMode
                )

                updateButtonText()

                -- panel for picking
                cp.panel =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "panel",
                        BackgroundColor3 = theme.panel.background,
                        BackgroundTransparency = theme.panel.backgroundTransparency,
                        BorderSizePixel = 0,
                        AnchorPoint = theme.panel.anchorPoint,
                        Position = theme.panel.position,
                        Size = theme.panel.size,
                        ZIndex = 50,
                        Visible = false,
                        Parent = cp.frame
                    }
                )
                helpers.appendUICorner(cp.panel, theme.panel.cornerRadius)
                helpers.appendUIStroke(
                    cp.panel,
                    theme.panel.stroke.color,
                    theme.panel.stroke.thickness,
                    theme.panel.stroke.strokeMode,
                    theme.panel.stroke.lineJoinMode
                )

                -- SV square: base = hue color, plus white and black gradients
                cp.sv =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "sv",
                        BackgroundColor3 = Color3.fromHSV(hue, 1, 1),
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0),
                        Size = theme.sv.size,
                        Position = theme.sv.position,
                        ZIndex = 51,
                        Parent = cp.panel,
                        ClipsDescendants = true
                    }
                )
                helpers.appendUICorner(cp.sv, theme.sv.cornerRadius)
                helpers.appendUIStroke(
                    cp.sv,
                    theme.sv.stroke.color,
                    theme.sv.stroke.thickness,
                    theme.sv.stroke.strokeMode,
                    theme.sv.stroke.lineJoinMode
                )

                -- overlay gradients for SV
                local svWhite =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "sv_white",
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 52,
                        Parent = cp.sv
                    }
                )
                local svWhiteGrad =
                    helpers.applyUIGradient(svWhite, ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1)), 0)
                svWhiteGrad.Transparency =
                    NumberSequence.new(
                    {
                        NumberSequenceKeypoint.new(0, 0),
                        NumberSequenceKeypoint.new(1, 1)
                    }
                )

                local svBlack =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "sv_black",
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 1, 0),
                        ZIndex = 52,
                        Parent = cp.sv
                    }
                )
                local svBlackGrad =
                    helpers.applyUIGradient(svBlack, ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0)), 90)
                svBlackGrad.Transparency =
                    NumberSequence.new(
                    {
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(1, 0)
                    }
                )

                -- SV marker
                cp.svMarker =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "sv_marker",
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        Size = theme.markers.sv.size,
                        ZIndex = 53,
                        Parent = cp.sv
                    }
                )
                helpers.appendUICorner(cp.svMarker, 999)
                helpers.appendUIStroke(
                    cp.svMarker,
                    Color3.fromRGB(0, 0, 0),
                    1,
                    Enum.ApplyStrokeMode.Border,
                    Enum.LineJoinMode.Round
                )

                -- Hue bar: vertical gradient from red through spectrum
                cp.hue =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "hue",
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0),
                        Size = theme.hue.size,
                        Position = theme.hue.position,
                        ZIndex = 51,
                        Parent = cp.panel
                    }
                )
                helpers.appendUICorner(cp.hue, theme.hue.cornerRadius)
                helpers.appendUIStroke(
                    cp.hue,
                    theme.hue.stroke.color,
                    theme.hue.stroke.thickness,
                    theme.hue.stroke.strokeMode,
                    theme.hue.stroke.lineJoinMode
                )
                helpers.applyUIGradient(
                    cp.hue,
                    ColorSequence.new(
                        {
                            ColorSequenceKeypoint.new(0.00, Color3.fromHSV(0 / 6, 1, 1)),
                            ColorSequenceKeypoint.new(0.17, Color3.fromHSV(1 / 6, 1, 1)),
                            ColorSequenceKeypoint.new(0.33, Color3.fromHSV(2 / 6, 1, 1)),
                            ColorSequenceKeypoint.new(0.50, Color3.fromHSV(3 / 6, 1, 1)),
                            ColorSequenceKeypoint.new(0.67, Color3.fromHSV(4 / 6, 1, 1)),
                            ColorSequenceKeypoint.new(0.83, Color3.fromHSV(5 / 6, 1, 1)),
                            ColorSequenceKeypoint.new(1.00, Color3.fromHSV(1, 1, 1))
                        }
                    ),
                    90
                )

                -- Hue marker
                cp.hueMarker =
                    helpers.createInstance(
                    "Frame",
                    {
                        Name = "hue_marker",
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(0, 0),
                        Size = theme.markers.hue.size,
                        ZIndex = 53,
                        Parent = cp.hue
                    }
                )
                helpers.appendUICorner(cp.hueMarker, 0)

                -- helpers
                local function clamp01(x)
                    if x < 0 then
                        return 0
                    elseif x > 1 then
                        return 1
                    else
                        return x
                    end
                end

                local function updateVisuals()
                    cp.color = Color3.fromHSV(hue, sat, val)
                    cp.swatch.BackgroundColor3 = cp.color
                    updateButtonText()
                    cp.sv.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)

                    -- position markers
                    cp.svMarker.Position = UDim2.new(sat, 0, 1 - val, 0)

                    cp.hueMarker.Position = UDim2.new(0, 0, hue, 0)

                    if cp.settings.onChanged then
                        cp.settings.onChanged(cp.color)
                    end
                end

                -- input handling
                local UIS = game:GetService("UserInputService")
                local draggingSV = false
                local draggingHue = false

                local function svFromPoint(px, py)
                    local absPos = cp.sv.AbsolutePosition
                    local absSize = cp.sv.AbsoluteSize
                    local x = clamp01((px - absPos.X) / math.max(1, absSize.X))
                    local y = clamp01((py - absPos.Y) / math.max(1, absSize.Y))
                    sat = x
                    val = 1 - y
                    updateVisuals()
                end

                local function hueFromPoint(py)
                    local absPos = cp.hue.AbsolutePosition
                    local absSize = cp.hue.AbsoluteSize
                    local y = clamp01((py - absPos.Y) / math.max(1, absSize.Y))
                    hue = y
                    updateVisuals()
                end

                cp.sv.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            draggingSV = true
                            svFromPoint(input.Position.X, input.Position.Y)
                        end
                    end
                )
                cp.sv.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            draggingSV = false
                        end
                    end
                )

                cp.hue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            draggingHue = true
                            hueFromPoint(input.Position.Y)
                        end
                    end
                )
                cp.hue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            draggingHue = false
                        end
                    end
                )

                cp._moveConn =
                    UIS.InputChanged:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement then
                            if draggingSV then
                                svFromPoint(input.Position.X, input.Position.Y)
                            elseif draggingHue then
                                hueFromPoint(input.Position.Y)
                            end
                        end
                    end
                )

                -- toggle panel visibility
                cp.button.MouseButton1Click:Connect(
                    function()
                        cp.panel.Visible = not cp.panel.Visible
                    end
                )

                -- close on outside click with bounds check
                do
                    local function pointInFrame(fr, x, y)
                        if not fr or not fr.AbsoluteSize then
                            return false
                        end
                        local p = fr.AbsolutePosition
                        local s = fr.AbsoluteSize
                        return x >= p.X and x <= p.X + s.X and y >= p.Y and y <= p.Y + s.Y
                    end
                    cp._outsideConn =
                        UIS.InputBegan:Connect(
                        function(input)
                            if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                return
                            end
                            if not cp.panel.Visible then
                                return
                            end
                            local pos = UIS:GetMouseLocation()
                            local x, y = pos.X, pos.Y
                            if not pointInFrame(cp.button, x, y) and not pointInFrame(cp.panel, x, y) then
                                cp.panel.Visible = false
                            end
                        end
                    )
                end

                -- API
                function cp:get()
                    return self.color
                end
                function cp:set(newColor)
                    if typeof(newColor) == "Color3" then
                        local h, s, v = Color3.toHSV(newColor)
                        hue, sat, val = h, s, v
                        updateVisuals()
                    end
                end
                function cp:destroy()
                    if self._outsideConn then
                        self._outsideConn:Disconnect()
                    end
                    if self._moveConn then
                        self._moveConn:Disconnect()
                    end
                    if self.frame then
                        self.frame:Destroy()
                    end
                end

                -- init visuals
                task.defer(updateVisuals)

                -- register
                window:_registerControl(cp.settings.name or "colorpicker", {
                    get = function() return cp:get() end,
                    set = function(v)
                        local c = v
                        if typeof(v) ~= "Color3" and type(v) == "string" then
                            local r,g,b = v:match("#?(%x%x)(%x%x)(%x%x)")
                            if r then c = Color3.fromRGB(tonumber(r,16), tonumber(g,16), tonumber(b,16)) end
                        end
                        if typeof(c) == "Color3" then cp:set(c) end
                    end
                })

                return cp
            end

            function card:slider(sliderSettings)
                local s = {}

                s.settings = sliderSettings or {
                    name = "slider",
                    label = "value",
                    variant = "subtext", -- "inline" | "subtext"
                    min = 0,
                    max = 100,
                    default = 50,
                    step = 1, -- can be 1, 0.5, 0.1, etc.
                    onChanged = function(value) end,
                }

                local variant = (s.settings.variant == "inline") and "inline" or "subtext"
                local theme = window.theme.slider[variant]
                local min = tonumber(s.settings.min) or 0
                local max = tonumber(s.settings.max) or 100
                if max == min then max = min + 1 end
                local step = tonumber(s.settings.step) or 1
                local value = math.clamp(tonumber(s.settings.default) or min, min, max)

                -- container frame
                s.frame = helpers.createInstance("Frame", {
                    Name = (s.settings.name or "slider") .. "_frame",
                    Size = theme.frame.size,
                    AnchorPoint = theme.frame.anchorPoint,
                    BackgroundColor3 = Color3.fromRGB(255,255,255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Parent = card.content,
                })

                -- label
                s.label = helpers.createInstance("TextLabel", {
                    Name = "slider_label",
                    Text = s.settings.label or "value",
                    BackgroundColor3 = Color3.fromRGB(255,255,255),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ZIndex = Z.COMPONENT,
                    Font = theme.richTextLabel.textFont,
                    TextColor3 = theme.richTextLabel.textColor,
                    TextSize = theme.richTextLabel.textSize,
                    TextXAlignment = theme.richTextLabel.textalignment,
                    RichText = theme.richTextLabel.richText,
                    AutomaticSize = theme.richTextLabel.automaticSize,
                    Size = theme.richTextLabel.size,
                    Position = theme.richTextLabel.position,
                    AnchorPoint = theme.richTextLabel.anchorPoint,
                    Parent = s.frame,
                })
                helpers.applyPadding(s.label, {
                    PaddingLeft = theme.richTextLabel.padding.left,
                    PaddingRight = theme.richTextLabel.padding.right,
                    PaddingTop = theme.richTextLabel.padding.top,
                    PaddingBottom = theme.richTextLabel.padding.bottom,
                })

                -- track
                s.track = helpers.createInstance("Frame", {
                    Name = "track",
                    BackgroundColor3 = theme.track.background,
                    BackgroundTransparency = theme.track.backgroundTransparency,
                    BorderSizePixel = 0,
                    AnchorPoint = theme.track.anchorPoint,
                    Position = theme.track.position,
                    Size = theme.track.size,
                    ZIndex = Z.COMPONENT,
                    Parent = s.frame,
                })
                helpers.appendUICorner(s.track, theme.track.cornerRadius)
                helpers.appendUIStroke(s.track, theme.track.stroke.color, theme.track.stroke.thickness, theme.track.stroke.strokeMode, theme.track.stroke.lineJoinMode)

                -- fill
                s.fill = helpers.createInstance("Frame", {
                    Name = "fill",
                    BackgroundColor3 = theme.fill.background,
                    BackgroundTransparency = theme.fill.backgroundTransparency,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.new(0, 0, 0.5, 0),
                    Size = UDim2.new(0, 0, 1, 0),
                    ZIndex = Z.COMPONENT + 1,
                    Parent = s.track,
                })
                helpers.appendUICorner(s.fill, theme.fill.cornerRadius)
                helpers.applyUIGradient(s.fill, theme.fill.gradient.ColorSequence, theme.fill.gradient.Rotation)

                -- thumb
                s.thumb = helpers.createInstance("Frame", {
                    Name = "thumb",
                    BackgroundColor3 = theme.thumb.background,
                    BackgroundTransparency = theme.thumb.backgroundTransparency,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = theme.thumb.size,
                    Position = UDim2.new(0, 0, 0.5, 0),
                    ZIndex = Z.COMPONENT + 2,
                    Parent = s.track,
                })
                helpers.appendUICorner(s.thumb, theme.thumb.cornerRadius)
                helpers.appendUIStroke(s.thumb, theme.thumb.stroke.color, theme.thumb.stroke.thickness, theme.thumb.stroke.strokeMode, theme.thumb.stroke.lineJoinMode)

                -- number input
                s.number = helpers.createInstance("TextBox", {
                    Name = "number",
                    Text = tostring(value),
                    PlaceholderText = tostring(value),
                    BackgroundColor3 = theme.number.background,
                    BackgroundTransparency = theme.number.backgroundTransparency,
                    BorderSizePixel = 0,
                    AnchorPoint = theme.number.anchorPoint,
                    Position = theme.number.position,
                    Size = theme.number.size,
                    ZIndex = Z.COMPONENT,
                    Font = theme.number.textFont,
                    TextColor3 = theme.number.textColor,
                    TextSize = theme.number.textSize,
                    TextXAlignment = theme.number.textAlignment,
                    ClearTextOnFocus = false,
                    Parent = s.frame,
                })
                helpers.appendUICorner(s.number, theme.number.cornerRadius)
                helpers.appendUIStroke(s.number, theme.number.stroke.color, theme.number.stroke.thickness, theme.number.stroke.strokeMode, theme.number.stroke.lineJoinMode)

                -- math helpers
                local function roundTo(v, inc)
                    inc = inc or 1
                    return math.floor((v/inc) + 0.5) * inc
                end
                local function valueToAlpha(v)
                    return (v - min) / (max - min)
                end
                local function alphaToValue(a)
                    return min + a * (max - min)
                end
                local function clamp01(x)
                    if x < 0 then return 0 elseif x > 1 then return 1 else return x end
                end

                -- layout update
                local function updateVisuals(fromValue)
                    local v = fromValue or value
                    local a = clamp01(valueToAlpha(v))
                    s.fill.Size = UDim2.new(a, 0, 1, 0)
                    s.thumb.Position = UDim2.new(a, 0, 0.5, 0)
                    s.number.Text = tostring(v)
                end

                -- drag handling
                local UIS = game:GetService("UserInputService")
                local dragging = false
                s.track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                        local x = input.Position.X
                        local pos = s.track.AbsolutePosition
                        local width = math.max(1, s.track.AbsoluteSize.X)
                        local a = clamp01((x - pos.X)/width)
                        value = roundTo(alphaToValue(a), step)
                        updateVisuals(value)
                        if s.settings.onChanged then s.settings.onChanged(value) end
                    end
                end)
                s.track.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
                end)
                s._moveConn = UIS.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                        local x = input.Position.X
                        local pos = s.track.AbsolutePosition
                        local width = math.max(1, s.track.AbsoluteSize.X)
                        local a = clamp01((x - pos.X)/width)
                        local nv = roundTo(alphaToValue(a), step)
                        if nv ~= value then
                            value = nv
                            updateVisuals(value)
                            if s.settings.onChanged then s.settings.onChanged(value) end
                        end
                    end
                end)

                -- number input handling
                local function parseNumber(txt)
                    local num = tonumber(txt)
                    if not num then return nil end
                    return math.clamp(roundTo(num, step), min, max)
                end
                s.number.FocusLost:Connect(function()
                    local nv = parseNumber(s.number.Text)
                    if nv then
                        value = nv
                        updateVisuals(value)
                        if s.settings.onChanged then s.settings.onChanged(value) end
                    else
                        s.number.Text = tostring(value)
                    end
                end)

                -- API
                function s:get() return value end
                function s:set(nv)
                    local v = tonumber(nv)
                    if not v then return end
                    v = math.clamp(roundTo(v, step), min, max)
                    if v ~= value then
                        value = v
                        updateVisuals(value)
                        if s.settings.onChanged then s.settings.onChanged(value) end
                    end
                end
                function s:destroy()
                    if self._moveConn then self._moveConn:Disconnect() end
                    if self.frame then self.frame:Destroy() end
                end

                -- init visuals
                task.defer(function() updateVisuals(value) end)

                -- register
                window:_registerControl(s.settings.name or "slider", {
                    get = function() return s:get() end,
                    set = function(v) s:set(v) end
                })

                return s
            end

            return card
        end

        return tab
    end

    return window
end

return redwine
