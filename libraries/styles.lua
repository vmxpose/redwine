local styles = {}

styles.default = {
    main_frame = {
        background = Color3.fromRGB(75,0,0),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        stroke = {
            color = Color3.fromRGB(0,0,0),
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Border,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        gradient = {
            ColorSequence = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(75,75,75)),
                ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150,150,150)),
                ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150,150,150)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(75,75,75))
            },
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(0, 500, 0, 500),
        position = UDim2.new(0.5, 0, 0.5, 0)
    },
    topbar = {
        background = Color3.fromRGB(75,0,0),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        gradient = {
            ColorSequence = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(150,150,150))
            },
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, 0, 0, 35),
        position = UDim2.new(0.5, 0, 0, 0)
    },
    windowtitle = {
        textColor = Color3.fromRGB(255,255,255),
        textSize = 16,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        gradient = {
            ColorSequence = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(150,150,150)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
            },
            Rotation = 0
        },
        padding = {
            bottom = 0,
            left = 15,
            right = 0,
            top = 0
        },
        anchorPoint = Vector2.new(0, 0.5),
        size = UDim2.new(1, 0, 0, 35),
        position = UDim2.new(0, 0, 0.5, 0)

    },
    tab_buttons = {
        background = Color3.fromRGB(255,255,255),
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, 0, 0, 30),
        position = UDim2.new(0.5, 0, 0.07, 0),
        listlayout = {
            padding = UDim.new(0, 10),
            fillDirection = Enum.FillDirection.Horizontal,
            horizontalAlignment = Enum.HorizontalAlignment.Left,
            verticalAlignment = Enum.VerticalAlignment.Center
        }
    }
}

return styles
