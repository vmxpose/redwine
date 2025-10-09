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
                ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75,75,75))
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
                ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150,150,150))
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
                ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255,255,255))
            },
            Rotation = 0
        },
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 15),
            right = UDim.new(0, 0),
            top = UDim.new(0, 0)
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
    },
    tab_button = {
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(0, 75, 0, 30),
        textFont = Enum.Font.RobotoMono,
        textSize = 14,
        textXAlignment = Enum.TextXAlignment.Center,
        textYAlignment = Enum.TextYAlignment.Center,
        off = {
            textColor = Color3.fromRGB(150,150,150),
            gradient = {
                ColorSequence = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150,150,150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255,255,255))
                },
                Rotation = 45
            },
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 10),
                right = UDim.new(0, 10),
                top = UDim.new(0, 0)
            }
        },
        on = {
            textColor = Color3.fromRGB(255,255,255),
            gradient = {
                ColorSequence = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150,150,150))
                },
                Rotation = 90
            },
        },
        hover = {
            textColor = Color3.fromRGB(255,255,255),
            gradient = {
                ColorSequence = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(200,200,200)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255,255,255))
                },
                Rotation = 90
            },
            padding = {
                bottom = UDim.new(0, 5),
                left = UDim.new(0, 10),
                right = UDim.new(0, 10),
                top = UDim.new(0, 0)
            }
        }
    },
    indicator = {
        background = Color3.fromRGB(150,0,0),
        anchorPoint = Vector2.new(0.5,0.5),
        size = UDim2.new(1, 0, 0, 2),
        position = UDim2.new(0.5, 0, 1, 0),
        automaticSize = Enum.AutomaticSize.X,
        gradient = {
            ColorSequence = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(75,75,75)),
                ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150,150,150)),
                ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150,150,150)),
                ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75,75,75))
            },
            Rotation = 0
        },
    }
}

return styles
