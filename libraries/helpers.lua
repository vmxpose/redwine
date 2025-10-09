local helpers = {}

-- function to create instance and return it
function helpers.createInstance(class, properties)
    local instance = Instance.new(class)
    if properties then
        for property, value in pairs(properties) do
            instance[property] = value
        end
    end
    return instance
end

-- function to append new uicorner to a ui element with specified radius
function helpers.appendUICorner(uiElement, radius)
    local uiCorner = helpers.createInstance("UICorner", {
        CornerRadius = UDim.new(0, radius)
    })
    uiCorner.Parent = uiElement
end

-- function to append new uistroke to a uielement with specified color, thickness, stroke mode, and line join mode
function helpers.appendUIStroke(uiElement, color, thickness, strokeMode, lineJoinMode)
    local uiStroke = helpers.createInstance("UIStroke", {
        Color = color,
        Thickness = thickness,
        ApplyStrokeMode = strokeMode,
        LineJoinMode = lineJoinMode
    })
    uiStroke.Parent = uiElement
end

-- function to apply uigradient with specified color sequence with keypoints and rotation
function helpers.applyUIGradient(uiElement, colorSequence, rotation)
    local uiGradient = helpers.createInstance("UIGradient", {
        Color = colorSequence,
        Rotation = rotation
    })
    uiGradient.Parent = uiElement
end

-- function to apply drag functionality to a frame that carries the entire ui
function helpers.applyDrag(uiElement)
    local UserInputService = game:GetService("UserInputService")

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        uiElement.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    uiElement.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = uiElement.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    uiElement.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- function to apply padding to a ui object with specified padding values
function helpers.applyPadding(uiElement, paddingValues)
    local uiPadding = helpers.createInstance("UIPadding", paddingValues)
    uiPadding.Parent = uiElement
end

-- function to apply list layout to a frame with specified properties
function helpers.applyListLayout(uiElement, properties)
    local uiListLayout = helpers.createInstance("UIListLayout", properties)
    uiListLayout.Parent = uiElement
end

return helpers
