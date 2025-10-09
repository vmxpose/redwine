local helpers = loadstring(game:HttpGet("https://raw.githubusercontent.com/vmxpose/redwine/refs/heads/main/libraries/helpers.lua"))()
local styles = loadstring(game:HttpGet("https://raw.githubusercontent.com/vmxpose/redwine/refs/heads/main/libraries/styles.lua"))()


local redwine = {}

redwine.flags = {}

redwine.helpers = assert(helpers, "[redwine] helpers library failed to load")
redwine.styles = assert(styles, "[redwine] styles library failed to load")


function redwine.new(redwineSettings)
    local window = {}
    
    window.settings = redwineSettings or {
        name = "red wine",
        toggleKey = Enum.KeyCode.RightControl,
        theme = redwine.styles.default,
        watermark = true,
        watermarkSettings = {
            text = "red wine for {game} | {fps} | {ping} | {version}",
        }
    }

    window.theme = window.settings.theme or redwine.styles.default

    window.redwinegui = helpers.createInstance("ScreenGui", {
        Name = "redwine",
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Parent = game.CoreGui
    })

    window.main_frame = helpers.createInstance("Frame", {
        Name = "main_ui",
        AnchorPoint = window.theme.main_frame.anchorPoint,
        Size = window.theme.main_frame.size,
        Position = window.theme.main_frame.position,
        BackgroundColor3 = window.theme.main_frame.background,
        BackgroundTransparency = window.theme.main_frame.backgroundtransparency,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Visible = true,
        Parent = window.redwinegui
    })

    helpers.appendUICorner(window.main_frame, window.theme.main_frame.cornerRadius)
    helpers.appendUIStroke(window.main_frame, window.theme.main_frame.stroke.color, window.theme.main_frame.stroke.thickness, window.theme.main_frame.stroke.strokeMode, window.theme.main_frame.stroke.lineJoinMode)
    helpers.applyUIGradient(window.main_frame, redwine.styles.gradients.main_frame.ColorSequence, redwine.styles.gradients.main_frame.Rotation)

    -- make topbar size of main frame's width and 35 pixels in height
    window.topbar = helpers.createInstance("Frame", {
        Name = "topbar",
        AnchorPoint = window.theme.topbar.anchorPoint,
        Size = window.theme.topbar.size,
        Position = window.theme.topbar.position,
        BackgroundColor3 = window.theme.topbar.background,
        BackgroundTransparency = window.theme.topbar.backgroundtransparency,
        BorderSizePixel = 0,
        Visible = true,
        Parent = window.main_frame
    })

    helpers.appendUICorner(window.topbar, window.theme.topbar.cornerRadius)
    helpers.applyUIGradient(window.topbar, redwine.styles.gradients.topbar.ColorSequence, redwine.styles.gradients.topbar.Rotation)
    helpers.applyDrag(window.topbar)

    window.windowtitle = helpers.createInstance("TextLabel", {
        Name = "window_title",
        AnchorPoint = window.theme.windowtitle.anchorPoint,
        Size = window.theme.windowtitle.size,
        Position = window.theme.windowtitle.position,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = window.theme.windowtitle.textFont,
        Text = window.settings.name or "red wine",
        TextColor3 = window.theme.windowtitle.textColor,
        TextSize = window.theme.windowtitle.textSize,
        TextXAlignment = window.theme.windowtitle.textalignment,
        Parent = window.topbar
    })
    helpers.applyUIGradient(window.windowtitle, redwine.styles.gradients.windowtitle.ColorSequence, redwine.styles.gradients.windowtitle.Rotation)
    helpers.applyPadding(window.windowtitle, window.theme.windowtitle.padding.left, window.theme.windowtitle.padding.right, window.theme.windowtitle.padding.top, window.theme.windowtitle.padding.bottom)

    window.tab_buttons = helpers.createInstance("ScrollingFrame", {
        Name = "tab_buttons",
        AnchorPoint = window.theme.tab_buttons.anchorPoint,
        Size = window.theme.tab_buttons.size,
        Position = window.theme.tab_buttons.position,
        BackgroundColor3 = window.theme.tab_buttons.background,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 1,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = window.main_frame
    })

    helpers.applyListLayout(window.tab_buttons, {
        FillDirection = window.theme.tab_buttons.listlayout.fillDirection,
        HorizontalAlignment = window.theme.tab_buttons.listlayout.horizontalAlignment,
        VerticalAlignment = window.theme.tab_buttons.listlayout.verticalAlignment,
        Padding = window.theme.tab_buttons.listlayout.padding
    })


    return window;
end

return redwine
