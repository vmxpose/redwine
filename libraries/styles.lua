local styles = {}

styles.default = {
    tabcontainer = {
        background = Color3.fromRGB(255, 255, 255),
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, -40, 1, -75),
        position = UDim2.new(0.5, 0, 0, 65),
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Border,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        gradient = {
            ColorSequence = ColorSequence.new(
                    size = UDim2.new(1, 0, 0, 30),
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
        size = UDim2.new(0.5, -12, 0, 100),
            Rotation = 90
                size = UDim2.new(1, -20, 0, 25),
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(0, 500, 0, 500)
    },
    topbar = {
        background = Color3.fromRGB(75, 0, 0),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        gradient = {
                left = UDim.new(0, 6),
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150, 150, 150))
                }
            ),
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, 0, 0, 35),
                right = UDim.new(0, 6),
    },
    windowtitle = {
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 16,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
                    size = UDim2.new(1, -20, 0, 30),
            ColorSequence = ColorSequence.new(
        size = UDim2.new(1, -12, 0, 50),
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                    size = UDim2.new(1, 0, 0, 60),
            ),
            Rotation = 0
        },
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 15),
            right = UDim.new(0, 0),
                size = UDim2.new(1, -20, 0, 25),
        },
        anchorPoint = Vector2.new(0, 0.5),
        size = UDim2.new(1, 0, 0, 35),
        position = UDim2.new(0, 0, 0.5, 0)
    },
    tab_buttons = {
        background = Color3.fromRGB(255, 255, 255),
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
            textColor = Color3.fromRGB(150, 150, 150),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                    }
                ),
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
            textColor = Color3.fromRGB(255, 255, 255),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150, 150, 150))
                    }
                ),
                Rotation = 90
            }
        },
        hover = {
            textColor = Color3.fromRGB(255, 255, 255),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                    }
                ),
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
        background = Color3.fromRGB(150, 0, 0),
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(1, 0, 0, 2),
        position = UDim2.new(0.5, 0, 1, 0),
        automaticSize = Enum.AutomaticSize.X,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 0
        }
    },
    tabcontainer = {
        background = Color3.fromRGB(255, 255, 255),
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, -40, 1, -75),
        position = UDim2.new(0.5, 0, 0, 65),
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
            top = UDim.new(0, 10)
        }
    },
    tabsection = {
        background = Color3.fromRGB(255, 255, 255),
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        automaticSize = Enum.AutomaticSize.Y,
        size = UDim2.new(0.5, -12, 0, 100),
        listlayout = {
            padding = UDim.new(0, 8),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        },
        left = {
            position = UDim2.new(0.25, 0, 0, 0),
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 6),
                right = UDim.new(0, 0),
                        size = UDim2.new(1, -20, 0, 30),
            }
        },
        right = {
            position = UDim2.new(0.75, 0, 0, 0),
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 0),
                right = UDim.new(0, 6),
                top = UDim.new(0, 0)
            }
                        size = UDim2.new(1, 0, 0, 60),
    },
    card = {
        background = Color3.fromRGB(50, 0, 0),
        backgroundtransparency = 0.5,
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(1, -12, 0, 50),
        automaticSize = Enum.AutomaticSize.Y,
        gradient = {
                    size = UDim2.new(1, -20, 0, 25),
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 90
        },
        stroke = {
            color = Color3.fromRGB(25, 0, 0),
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Contextual,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        listlayout = {
            padding = UDim.new(0, 4),
                        size = UDim2.new(1, 0, 0, 30),
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        }
    },
    cardtitle = {
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 14,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
                        size = UDim2.new(1, -130, 0, 30),
                        position = UDim2.new(0, 0, 0.5, 0),
                        anchorPoint = Vector2.new(0, 0.5),
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                }
            ),
            Rotation = 0
        },
        padding = {
            bottom = UDim.new(0, 10),
            left = UDim.new(0, 10),
            right = UDim.new(0, 10),
                    anchorPoint = Vector2.new(1, 0.5),
                    position = UDim2.new(1, -10, 0.5, 0),
        anchorPoint = Vector2.new(0, 0.5),
        size = UDim2.new(1, 0, 0, 25),
        position = UDim2.new(0, 0, 0.5, 0)
    },
    cardcontent = {
        size = UDim2.new(1, 0, 0, 30),
        anchorPoint = Vector2.new(0.5, 0.5),
        automaticSize = Enum.AutomaticSize.Y,
        listlayout = {
            padding = UDim.new(0, 4),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        },
        padding = {
            bottom = UDim.new(0, 4),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
            top = UDim.new(0, 0)
        }
    },
    richTextLabel = {
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 14,
                        size = UDim2.new(1, 0, 0, 30),
        textalignment = Enum.TextXAlignment.Left,
        richText = true,
        automaticSize = Enum.AutomaticSize.Y,
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 10),
            right = UDim.new(0, 10),
            top = UDim.new(0, 0)
                    size = UDim2.new(1, -20, 0, 25),
        size = UDim2.new(1, 0, 0, 30),
        anchorPoint = Vector2.new(0.5, 0.5)
    },
    button = {
        singlewide = {
            frame = {
                size = UDim2.new(1, 0, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(25, 0, 0),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.5, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(25, 0, 0),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        subtext = {
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 12,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                padding = {
                    bottom = UDim.new(0, 0),
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 10),
                    top = UDim.new(0, 0)
                },
                size = UDim2.new(1, -20, 0, 30),
                position = UDim2.new(0.5, 0, 0.25, 0),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            frame = {
                size = UDim2.new(1, 0, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(25, 0, 0),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.75, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(25, 0, 0),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        }
    },
    toggle = {
        frame = {
            -- Container frame
            size = UDim2.new(1, 0, 0, 30),
            anchorPoint = Vector2.new(0.5, 0.5),
            background = Color3.fromRGB(255, 255, 255),
            backgroundTransparency = 1
        },
        richTextLabel = {
            -- Left-aligned rich text label
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textalignment = Enum.TextXAlignment.Left,
            richText = true,
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -60, 0, 30),
            anchorPoint = Vector2.new(0, 0.5),
            position = UDim2.new(0, 0, 0.5, 0),
            padding = {
                left = UDim.new(0, 10),
                right = UDim.new(0, 0),
                top = UDim.new(0, 0),
                bottom = UDim.new(0, 0)
            }
        },
        button = {
            -- Right-side ImageButton (the checkbox)
            background = Color3.fromRGB(26, 0, 0),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(1, 0.5),
            position = UDim2.new(1, -10, 0.5, 0),
            size = UDim2.new(0, 25, 0, 25),
            image = "rbxassetid://11604833061",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 0, 0),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        }
    },
    textbox = {
        -- Label on top, input below (matches alt2inputbox)
        subtext = {
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 240, 0, 30),
                position = UDim2.new(0.5, 0, 0.25, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            -- TextBox
            background = Color3.fromRGB(26, 0, 0),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.75, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(0, 220, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 0, 0),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        -- Label left, input right (matches alttextbox)
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            -- TextBox
            background = Color3.fromRGB(26, 0, 0),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.72413, 0, 0.5, 0),
            size = UDim2.new(0, 110, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            swatch = {
                size = UDim2.new(0, 16, 0, 16),
                position = UDim2.new(0, -20, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                cornerRadius = 2
            },
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 0, 0),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        -- Input only, centered (matches textboxfr)
        singlewide = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            -- TextBox
            background = Color3.fromRGB(26, 0, 0),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.5, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(0, 220, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 0, 0),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            },
            indicator = {
                background = Color3.fromRGB(151, 0, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                size = UDim2.new(0, 220, 0, 2),
                position = UDim2.new(0.5, 0, 1, 0),
                gradient = {
                    ColorSequence = ColorSequence.new(
                        {
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                            ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76))
                        }
                    ),
                    Rotation = 0
                }
            }
        }
    },
    dropdown = {
        -- Compact inline variant: label left, button right, small items box under button
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.72413, 0, 0.5, 0),
                size = UDim2.new(0, 110, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            items = {
                background = Color3.fromRGB(16, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.72413, 0, 1, 0),
                size = UDim2.new(0, 110, 0, 48),
                scrollBarThickness = 2,
                scrollBarColor = Color3.fromRGB(76, 0, 0),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                },
                listlayout = {
                    padding = UDim.new(0, 4),
                    horizontalAlignment = Enum.HorizontalAlignment.Center
                },
                itemButton = {
                    background = Color3.fromRGB(26, 0, 0),
                    backgroundTransparency = 0.75,
                    size = UDim2.new(0, 110, 0, 36),
                    textColor = Color3.fromRGB(255, 255, 255),
                    textSize = 14,
                    textFont = Enum.Font.RobotoMono,
                    textAlignment = Enum.TextXAlignment.Center,
                    cornerRadius = 2,
                    stroke = {
                        color = Color3.fromRGB(26, 0, 0),
                        thickness = 2,
                        strokeMode = Enum.ApplyStrokeMode.Border,
                        lineJoinMode = Enum.LineJoinMode.Round
                    }
                }
            }
        },
        -- Wide variant: label on top, wide button below, larger items box
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.5, 0, 0.75, 0),
                size = UDim2.new(0, 220, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                swatch = {
                    size = UDim2.new(0, 16, 0, 16),
                    position = UDim2.new(0, -20, 0.5, 0),
                    anchorPoint = Vector2.new(0.5, 0.5),
                    cornerRadius = 2
                },
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            items = {
                background = Color3.fromRGB(16, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.5, 0, 0.98333, 0),
                size = UDim2.new(0, 220, 0, 150),
                scrollBarThickness = 2,
                scrollBarColor = Color3.fromRGB(76, 0, 0),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                },
                listlayout = {
                    padding = UDim.new(0, 4),
                    horizontalAlignment = Enum.HorizontalAlignment.Center
                },
                itemButton = {
                    background = Color3.fromRGB(26, 0, 0),
                    backgroundTransparency = 0.75,
                    size = UDim2.new(0, 220, 0, 36),
                    textColor = Color3.fromRGB(255, 255, 255),
                    textSize = 14,
                    textFont = Enum.Font.RobotoMono,
                    textAlignment = Enum.TextXAlignment.Center,
                    cornerRadius = 2,
                    stroke = {
                        color = Color3.fromRGB(26, 0, 0),
                        thickness = 2,
                        strokeMode = Enum.ApplyStrokeMode.Border,
                        lineJoinMode = Enum.LineJoinMode.Round
                    }
                }
            }
        }
    },
    colorpicker = {
        -- Compact inline variant: label left, preview button right, panel under button
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.72413, 0, 0.5, 0),
                size = UDim2.new(0, 110, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 32),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            panel = {
                background = Color3.fromRGB(16, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.724, 0, 1, 0),
                size = UDim2.new(0, 180, 0, 130),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            sv = {
                -- saturation/value square
                size = UDim2.new(0, 120, 0, 90),
                position = UDim2.new(0, 8, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            hue = {
                -- vertical hue bar
                size = UDim2.new(0, 16, 0, 90),
                position = UDim2.new(0, 136, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            markers = {
                sv = {size = UDim2.new(0, 6, 0, 6)},
                hue = {size = UDim2.new(0, 16, 0, 2)}
            }
        },
        -- Wide variant: label on top, preview button below, bigger panel
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.5, 0, 0.75, 0),
                size = UDim2.new(0, 220, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 32),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            panel = {
                background = Color3.fromRGB(16, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.5, 0, 0.98333, 0),
                size = UDim2.new(0, 220, 0, 160),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            sv = {
                -- saturation/value square
                size = UDim2.new(0, 150, 0, 110),
                position = UDim2.new(0, 10, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            hue = {
                -- vertical hue bar
                size = UDim2.new(0, 16, 0, 110),
                position = UDim2.new(0, 170, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            markers = {
                sv = {size = UDim2.new(0, 6, 0, 6)},
                hue = {size = UDim2.new(0, 16, 0, 2)}
            }
        }
    },
    slider = {
        -- Subtext variant: label on top, slider + numeric input below
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5),
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0),
                },
            },
            track = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.new(0, 10, 0.75, 0),
                size = UDim2.new(0, 160, 0, 6),
                cornerRadius = 3,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            fill = {
                background = Color3.fromRGB(151, 0, 0),
                backgroundTransparency = 0,
                gradient = {
                    ColorSequence = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76)),
                    }),
                    Rotation = 0,
                },
                cornerRadius = 3,
            },
            thumb = {
                size = UDim2.new(0, 12, 0, 12),
                background = Color3.fromRGB(255, 255, 255),
                backgroundTransparency = 0,
                cornerRadius = 6,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 1,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            number = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.new(1, -10, 0.75, 0),
                size = UDim2.new(0, 56, 0, 22),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                placeholderColor = Color3.fromRGB(201, 201, 201),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
        },
        -- Inline variant: label left, track center, number input right
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5),
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0),
                },
            },
            track = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0, 0.5),
                -- Start just to the right of the label, leave space for the number box on the right
                position = UDim2.new(0, 126, 0.5, 0),
                size = UDim2.new(0, 60, 0, 6),
                cornerRadius = 3,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            fill = {
                background = Color3.fromRGB(151, 0, 0),
                backgroundTransparency = 0,
                gradient = {
                    ColorSequence = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76)),
                    }),
                    Rotation = 0,
                },
                cornerRadius = 3,
            },
            thumb = {
                size = UDim2.new(0, 12, 0, 12),
                background = Color3.fromRGB(255, 255, 255),
                backgroundTransparency = 0,
                cornerRadius = 6,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 1,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            number = {
                background = Color3.fromRGB(26, 0, 0),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.new(1, -10, 0.5, 0),
                size = UDim2.new(0, 44, 0, 22),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                placeholderColor = Color3.fromRGB(201, 201, 201),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 0, 0),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
        },
    }
}

styles.dark = { 
    main_frame = {
        background = Color3.fromRGB(75, 75, 75),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        stroke = {
            color = Color3.fromRGB(0, 0, 0),
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Border,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(0, 500, 0, 500),
    },
    topbar = {
        background = Color3.fromRGB(75, 75, 75),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150, 150, 150))
                }
            ),
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, 0, 0, 35),
        position = UDim2.new(0.5, 0, 0, 0)
    },
    windowtitle = {
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 16,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                }
            ),
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
        background = Color3.fromRGB(255, 255, 255),
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
            textColor = Color3.fromRGB(150, 150, 150),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                    }
                ),
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
            textColor = Color3.fromRGB(255, 255, 255),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150, 150, 150))
                    }
                ),
                Rotation = 90
            }
        },
        hover = {
            textColor = Color3.fromRGB(255, 255, 255),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                    }
                ),
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
        background = Color3.fromRGB(150, 150, 150),
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(1, 0, 0, 2),
        position = UDim2.new(0.5, 0, 1, 0),
        automaticSize = Enum.AutomaticSize.X,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 0
        }
    },
    tabcontainer = {
        background = Color3.fromRGB(255, 255, 255),
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, -40, 1, -75),
        position = UDim2.new(0.5, 0, 0, 65),
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
            top = UDim.new(0, 10)
        }
    },
    tabsection = {
        background = Color3.fromRGB(255, 255, 255),
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        automaticSize = Enum.AutomaticSize.Y,
        size = UDim2.new(0.5, -12, 0, 100),
        listlayout = {
            padding = UDim.new(0, 8),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        },
        left = {
            position = UDim2.new(0.25, 0, 0, 0),
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 6),
                right = UDim.new(0, 0),
                top = UDim.new(0, 0)
            }
        },
        right = {
            position = UDim2.new(0.75, 0, 0, 0),
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 0),
                right = UDim.new(0, 6),
                top = UDim.new(0, 0)
            }
        }
    },
    card = {
        background = Color3.fromRGB(50, 50, 50),
        backgroundtransparency = 0.5,
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(1, -12, 0, 50),
        automaticSize = Enum.AutomaticSize.Y,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 90
        },
        stroke = {
            color = Color3.fromRGB(25, 25, 25),
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Contextual,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        listlayout = {
            padding = UDim.new(0, 4),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        }
    },
    cardtitle = {
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 14,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255))
                }
            ),
            Rotation = 0
        },
        padding = {
            bottom = UDim.new(0, 10),
            left = UDim.new(0, 10),
            right = UDim.new(0, 10),
            top = UDim.new(0, 10)
        },
        anchorPoint = Vector2.new(0, 0.5),
        size = UDim2.new(1, 0, 0, 25),
        position = UDim2.new(0, 0, 0.5, 0)
    },
    cardcontent = {
        size = UDim2.new(1, 0, 0, 30),
        anchorPoint = Vector2.new(0.5, 0.5),
        automaticSize = Enum.AutomaticSize.Y,
        listlayout = {
            padding = UDim.new(0, 4),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        },
        padding = {
            bottom = UDim.new(0, 4),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
            top = UDim.new(0, 0)
        }
    },
    richTextLabel = {
        textColor = Color3.fromRGB(255, 255, 255),
        textSize = 14,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        richText = true,
        automaticSize = Enum.AutomaticSize.Y,
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 10),
            right = UDim.new(0, 10),
            top = UDim.new(0, 0)
        },
        size = UDim2.new(1, 0, 0, 30),
        anchorPoint = Vector2.new(0.5, 0.5)
    },
    button = {
        singlewide = {
            frame = {
                size = UDim2.new(1, 0, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(25, 25, 25),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.5, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(25, 25, 25),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        subtext = {
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 12,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                padding = {
                    bottom = UDim.new(0, 0),
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 10),
                    top = UDim.new(0, 0)
                },
                size = UDim2.new(1, -20, 0, 30),
                position = UDim2.new(0.5, 0, 0.25, 0),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            frame = {
                size = UDim2.new(1, 0, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(25, 25, 25),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.75, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(25, 25, 25),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        }
    },
    toggle = {
        frame = {
            size = UDim2.new(1, 0, 0, 30),
            anchorPoint = Vector2.new(0.5, 0.5),
            background = Color3.fromRGB(255, 255, 255),
            backgroundTransparency = 1
        },
        richTextLabel = {
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textalignment = Enum.TextXAlignment.Left,
            richText = true,
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -60, 0, 30),
            anchorPoint = Vector2.new(0, 0.5),
            position = UDim2.new(0, 0, 0.5, 0),
            padding = {
                left = UDim.new(0, 10),
                right = UDim.new(0, 0),
                top = UDim.new(0, 0),
                bottom = UDim.new(0, 0)
            }
        },
        button = {
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(1, 0.5),
            position = UDim2.new(1, -10, 0.5, 0),
            size = UDim2.new(0, 25, 0, 25),
            image = "rbxassetid://11604833061",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        }
    },
    textbox = {
        subtext = {
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(1, -20, 0, 30),
                position = UDim2.new(0.5, 0, 0.25, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            frame = {
                size = UDim2.new(1, 0, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.75, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        inline = {
            frame = {
                size = UDim2.new(1, 0, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(1, -130, 0, 30),
                position = UDim2.new(0, 0, 0.5, 0),
                anchorPoint = Vector2.new(0, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(1, 0.5),
            position = UDim2.new(1, -10, 0.5, 0),
            size = UDim2.new(0, 110, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            swatch = {
                size = UDim2.new(0, 16, 0, 16),
                position = UDim2.new(0, -20, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                cornerRadius = 2
            },
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        singlewide = {
            frame = {
                size = UDim2.new(1, 0, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.5, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(255, 255, 255),
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            },
            indicator = {
                background = Color3.fromRGB(151, 151, 151),
                anchorPoint = Vector2.new(0.5, 0.5),
                size = UDim2.new(0, 220, 0, 2),
                position = UDim2.new(0.5, 0, 1, 0),
                gradient = {
                    ColorSequence = ColorSequence.new(
                        {
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                            ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76))
                        }
                    ),
                    Rotation = 0
                }
            }
        }
    },
    dropdown = {
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.72413, 0, 0.5, 0),
                size = UDim2.new(0, 110, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            items = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.72413, 0, 1, 0),
                size = UDim2.new(0, 110, 0, 48),
                scrollBarThickness = 2,
                scrollBarColor = Color3.fromRGB(76, 76, 76),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                },
                listlayout = {
                    padding = UDim.new(0, 4),
                    horizontalAlignment = Enum.HorizontalAlignment.Center
                },
                itemButton = {
                    background = Color3.fromRGB(26, 26, 26),
                    backgroundTransparency = 0.75,
                    size = UDim2.new(0, 110, 0, 36),
                    textColor = Color3.fromRGB(255, 255, 255),
                    textSize = 14,
                    textFont = Enum.Font.RobotoMono,
                    textAlignment = Enum.TextXAlignment.Center,
                    cornerRadius = 2,
                    stroke = {
                        color = Color3.fromRGB(26, 26, 26),
                        thickness = 2,
                        strokeMode = Enum.ApplyStrokeMode.Border,
                        lineJoinMode = Enum.LineJoinMode.Round
                    }
                }
            }
        },
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.5, 0, 0.75, 0),
                size = UDim2.new(0, 220, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                swatch = {
                    size = UDim2.new(0, 16, 0, 16),
                    position = UDim2.new(0, -20, 0.5, 0),
                    anchorPoint = Vector2.new(0.5, 0.5),
                    cornerRadius = 2
                },
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            items = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.5, 0, 0.98333, 0),
                size = UDim2.new(0, 220, 0, 150),
                scrollBarThickness = 2,
                scrollBarColor = Color3.fromRGB(76, 76, 76),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                },
                listlayout = {
                    padding = UDim.new(0, 4),
                    horizontalAlignment = Enum.HorizontalAlignment.Center
                },
                itemButton = {
                    background = Color3.fromRGB(26, 26, 26),
                    backgroundTransparency = 0.75,
                    size = UDim2.new(0, 220, 0, 36),
                    textColor = Color3.fromRGB(255, 255, 255),
                    textSize = 14,
                    textFont = Enum.Font.RobotoMono,
                    textAlignment = Enum.TextXAlignment.Center,
                    cornerRadius = 2,
                    stroke = {
                        color = Color3.fromRGB(26, 26, 26),
                        thickness = 2,
                        strokeMode = Enum.ApplyStrokeMode.Border,
                        lineJoinMode = Enum.LineJoinMode.Round
                    }
                }
            }
        }
    },
    colorpicker = {
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.72413, 0, 0.5, 0),
                size = UDim2.new(0, 110, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 32),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            panel = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.724, 0, 1, 0),
                size = UDim2.new(0, 180, 0, 130),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            sv = {
                size = UDim2.new(0, 120, 0, 90),
                position = UDim2.new(0, 8, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            hue = {
                size = UDim2.new(0, 16, 0, 90),
                position = UDim2.new(0, 136, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            markers = {
                sv = {size = UDim2.new(0, 6, 0, 6)},
                hue = {size = UDim2.new(0, 16, 0, 2)}
            }
        },
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.5, 0, 0.75, 0),
                size = UDim2.new(0, 220, 0, 25),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 32),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            panel = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.5, 0, 0.98333, 0),
                size = UDim2.new(0, 220, 0, 160),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            sv = {
                size = UDim2.new(0, 150, 0, 110),
                position = UDim2.new(0, 10, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            hue = {
                size = UDim2.new(0, 16, 0, 110),
                position = UDim2.new(0, 170, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            markers = {
                sv = {size = UDim2.new(0, 6, 0, 6)},
                hue = {size = UDim2.new(0, 16, 0, 2)}
            }
        }
    },
    slider = {
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5),
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0),
                },
            },
            track = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.new(0, 10, 0.75, 0),
                size = UDim2.new(0, 160, 0, 6),
                cornerRadius = 3,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            fill = {
                background = Color3.fromRGB(151, 151, 151),
                backgroundTransparency = 0,
                gradient = {
                    ColorSequence = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76)),
                    }),
                    Rotation = 0,
                },
                cornerRadius = 3,
            },
            thumb = {
                size = UDim2.new(0, 12, 0, 12),
                background = Color3.fromRGB(255, 255, 255),
                backgroundTransparency = 0,
                cornerRadius = 6,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 1,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            number = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.new(1, -10, 0.75, 0),
                size = UDim2.new(0, 56, 0, 22),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                placeholderColor = Color3.fromRGB(201, 201, 201),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
        },
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5),
            },
            richTextLabel = {
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0),
                },
            },
            track = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.new(0, 126, 0.5, 0),
                size = UDim2.new(0, 60, 0, 6),
                cornerRadius = 3,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            fill = {
                background = Color3.fromRGB(151, 151, 151),
                backgroundTransparency = 0,
                gradient = {
                    ColorSequence = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76)),
                    }),
                    Rotation = 0,
                },
                cornerRadius = 3,
            },
            thumb = {
                size = UDim2.new(0, 12, 0, 12),
                background = Color3.fromRGB(255, 255, 255),
                backgroundTransparency = 0,
                cornerRadius = 6,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 1,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            number = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.new(1, -10, 0.5, 0),
                size = UDim2.new(0, 44, 0, 22),
                textColor = Color3.fromRGB(255, 255, 255),
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                placeholderColor = Color3.fromRGB(201, 201, 201),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
        },
    }
}

styles.light = { 
    main_frame = {
        background = Color3.fromRGB(75, 75, 75),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        stroke = {
            color = Color3.fromRGB(255, 255, 255), -- was 0,0,0
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Border,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(0, 500, 0, 500),
        position = UDim2.new(0.5, 0, 0.5, 0)
    },
    topbar = {
        background = Color3.fromRGB(75, 75, 75),
        backgroundtransparency = 0.05,
        cornerRadius = 2,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),   -- was 255,255,255
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150, 150, 150))
                }
            ),
            Rotation = 90
        },
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, 0, 0, 35),
        position = UDim2.new(0.5, 0, 0, 0)
    },
    windowtitle = {
        textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
        textSize = 16,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 0, 0)) -- was 255,255,255
                }
            ),
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
        background = Color3.fromRGB(0, 0, 0), -- was 255,255,255
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
            textColor = Color3.fromRGB(150, 150, 150),
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 0, 0)) -- was 255,255,255
                    }
                ),
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
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), -- was 255,255,255
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(150, 150, 150))
                    }
                ),
                Rotation = 90
            }
        },
        hover = {
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            gradient = {
                ColorSequence = ColorSequence.new(
                    {
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 0, 0)) -- was 255,255,255
                    }
                ),
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
        background = Color3.fromRGB(150, 150, 150),
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(1, 0, 0, 2),
        position = UDim2.new(0.5, 0, 1, 0),
        automaticSize = Enum.AutomaticSize.X,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 0
        }
    },
    tabcontainer = {
        background = Color3.fromRGB(0, 0, 0), -- was 255,255,255
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        size = UDim2.new(1, -40, 1, -75),
        position = UDim2.new(0.5, 0, 0, 65),
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
            top = UDim.new(0, 10)
        }
    },
    tabsection = {
        background = Color3.fromRGB(0, 0, 0), -- was 255,255,255
        backgroundtransparency = 1,
        anchorPoint = Vector2.new(0.5, 0),
        automaticSize = Enum.AutomaticSize.Y,
        size = UDim2.new(0.5, -12, 0, 100),
        listlayout = {
            padding = UDim.new(0, 8),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        },
        left = {
            position = UDim2.new(0.25, 0, 0, 0),
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 6),
                right = UDim.new(0, 0),
                top = UDim.new(0, 0)
            }
        },
        right = {
            position = UDim2.new(0.75, 0, 0, 0),
            padding = {
                bottom = UDim.new(0, 0),
                left = UDim.new(0, 0),
                right = UDim.new(0, 6),
                top = UDim.new(0, 0)
            }
        }
    },
    card = {
        background = Color3.fromRGB(50, 50, 50),
        backgroundtransparency = 0.5,
        anchorPoint = Vector2.new(0.5, 0.5),
        size = UDim2.new(1, -12, 0, 50),
        automaticSize = Enum.AutomaticSize.Y,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 75)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(75, 75, 75))
                }
            ),
            Rotation = 90
        },
        stroke = {
            color = Color3.fromRGB(25, 25, 25),
            thickness = 2,
            strokeMode = Enum.ApplyStrokeMode.Contextual,
            lineJoinMode = Enum.LineJoinMode.Round
        },
        listlayout = {
            padding = UDim.new(0, 4),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        }
    },
    cardtitle = {
        textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
        textSize = 14,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        gradient = {
            ColorSequence = ColorSequence.new(
                {
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(0, 0, 0)) -- was 255,255,255
                }
            ),
            Rotation = 0
        },
        padding = {
            bottom = UDim.new(0, 10),
            left = UDim.new(0, 10),
            right = UDim.new(0, 10),
            top = UDim.new(0, 10)
        },
        anchorPoint = Vector2.new(0, 0.5),
        size = UDim2.new(1, 0, 0, 25),
        position = UDim2.new(0, 0, 0.5, 0)
    },
    cardcontent = {
        size = UDim2.new(1, 0, 0, 30),
        anchorPoint = Vector2.new(0.5, 0.5),
        automaticSize = Enum.AutomaticSize.Y,
        listlayout = {
            padding = UDim.new(0, 4),
            fillDirection = Enum.FillDirection.Vertical,
            horizontalAlignment = Enum.HorizontalAlignment.Center,
            verticalAlignment = Enum.VerticalAlignment.Top
        },
        padding = {
            bottom = UDim.new(0, 4),
            left = UDim.new(0, 0),
            right = UDim.new(0, 0),
            top = UDim.new(0, 0)
        }
    },
    richTextLabel = {
        textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
        textSize = 14,
        textFont = Enum.Font.RobotoMono,
        textalignment = Enum.TextXAlignment.Left,
        richText = true,
        automaticSize = Enum.AutomaticSize.Y,
        padding = {
            bottom = UDim.new(0, 0),
            left = UDim.new(0, 10),
            right = UDim.new(0, 10),
            top = UDim.new(0, 0)
        },
        size = UDim2.new(1, 0, 0, 30),
        anchorPoint = Vector2.new(0.5, 0.5)
    },
    button = {
        singlewide = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(25, 25, 25),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.5, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(0, 220, 0, 25),
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(25, 25, 25),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        subtext = {
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 12,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                padding = {
                    bottom = UDim.new(0, 0),
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 10),
                    top = UDim.new(0, 0)
                },
                size = UDim2.new(0, 240, 0, 30),
                position = UDim2.new(0.5, 0, 0.25, 0),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(25, 25, 25),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.75, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(0, 220, 0, 25),
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(25, 25, 25),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        }
    },
    toggle = {
        frame = {
            size = UDim2.new(1, 0, 0, 30),
            anchorPoint = Vector2.new(0.5, 0.5),
            background = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            backgroundTransparency = 1
        },
        richTextLabel = {
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textalignment = Enum.TextXAlignment.Left,
            richText = true,
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -60, 0, 30),
            anchorPoint = Vector2.new(0, 0.5),
            position = UDim2.new(0, 0, 0.5, 0),
            padding = {
                left = UDim.new(0, 10),
                right = UDim.new(0, 0),
                top = UDim.new(0, 0),
                bottom = UDim.new(0, 0)
            }
        },
        button = {
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(1, 0.5),
            position = UDim2.new(1, -10, 0.5, 0),
            size = UDim2.new(0, 25, 0, 25),
            image = "rbxassetid://11604833061",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        }
    },
    textbox = {
        subtext = {
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(1, -20, 0, 30),
                position = UDim2.new(0.5, 0, 0.25, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            frame = {
                size = UDim2.new(1, 0, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.75, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        inline = {
            frame = {
                size = UDim2.new(1, 0, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(1, -130, 0, 30),
                position = UDim2.new(0, 0, 0.5, 0),
                anchorPoint = Vector2.new(0, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(1, 0.5),
            position = UDim2.new(1, -10, 0.5, 0),
            size = UDim2.new(0, 110, 0, 25),
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            swatch = {
                size = UDim2.new(0, 16, 0, 16),
                position = UDim2.new(0, -20, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                cornerRadius = 2
            },
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            }
        },
        singlewide = {
            frame = {
                size = UDim2.new(1, 0, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            background = Color3.fromRGB(26, 26, 26),
            backgroundTransparency = 0.75,
            anchorPoint = Vector2.new(0.5, 0.5),
            position = UDim2.new(0.5, 0, 0.5, 0),
            automaticSize = Enum.AutomaticSize.Y,
            size = UDim2.new(1, -20, 0, 25),
            textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
            textSize = 14,
            textFont = Enum.Font.RobotoMono,
            textAlignment = Enum.TextXAlignment.Center,
            placeholderColor = Color3.fromRGB(201, 201, 201),
            placeholderText = "default text",
            cornerRadius = 2,
            stroke = {
                color = Color3.fromRGB(26, 26, 26),
                thickness = 2,
                strokeMode = Enum.ApplyStrokeMode.Border,
                lineJoinMode = Enum.LineJoinMode.Round
            },
            indicator = {
                background = Color3.fromRGB(151, 151, 151),
                anchorPoint = Vector2.new(0.5, 0.5),
                size = UDim2.new(0, 220, 0, 2),
                position = UDim2.new(0.5, 0, 1, 0),
                gradient = {
                    ColorSequence = ColorSequence.new(
                        {
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                            ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76))
                        }
                    ),
                    Rotation = 0
                }
            }
        }
    },
    dropdown = {
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.72413, 0, 0.5, 0),
                size = UDim2.new(0, 110, 0, 25),
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            items = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.72413, 0, 1, 0),
                size = UDim2.new(0, 110, 0, 48),
                scrollBarThickness = 2,
                scrollBarColor = Color3.fromRGB(76, 76, 76),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                },
                listlayout = {
                    padding = UDim.new(0, 4),
                    horizontalAlignment = Enum.HorizontalAlignment.Center
                },
                itemButton = {
                    background = Color3.fromRGB(26, 26, 26),
                    backgroundTransparency = 0.75,
                    size = UDim2.new(0, 110, 0, 36),
                    textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                    textSize = 14,
                    textFont = Enum.Font.RobotoMono,
                    textAlignment = Enum.TextXAlignment.Center,
                    cornerRadius = 2,
                    stroke = {
                        color = Color3.fromRGB(26, 26, 26),
                        thickness = 2,
                        strokeMode = Enum.ApplyStrokeMode.Border,
                        lineJoinMode = Enum.LineJoinMode.Round
                    }
                }
            }
        },
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.5, 0, 0.75, 0),
                size = UDim2.new(0, 220, 0, 25),
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                swatch = {
                    size = UDim2.new(0, 16, 0, 16),
                    position = UDim2.new(0, -20, 0.5, 0),
                    anchorPoint = Vector2.new(0.5, 0.5),
                    cornerRadius = 2
                },
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            items = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.5, 0, 0.98333, 0),
                size = UDim2.new(0, 220, 0, 150),
                scrollBarThickness = 2,
                scrollBarColor = Color3.fromRGB(76, 76, 76),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                },
                listlayout = {
                    padding = UDim.new(0, 4),
                    horizontalAlignment = Enum.HorizontalAlignment.Center
                },
                itemButton = {
                    background = Color3.fromRGB(26, 26, 26),
                    backgroundTransparency = 0.75,
                    size = UDim2.new(0, 220, 0, 36),
                    textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                    textSize = 14,
                    textFont = Enum.Font.RobotoMono,
                    textAlignment = Enum.TextXAlignment.Center,
                    cornerRadius = 2,
                    stroke = {
                        color = Color3.fromRGB(26, 26, 26),
                        thickness = 2,
                        strokeMode = Enum.ApplyStrokeMode.Border,
                        lineJoinMode = Enum.LineJoinMode.Round
                    }
                }
            }
        }
    },
    colorpicker = {
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.72413, 0, 0.5, 0),
                size = UDim2.new(0, 110, 0, 25),
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 32),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            panel = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.724, 0, 1, 0),
                size = UDim2.new(0, 180, 0, 130),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            sv = {
                size = UDim2.new(0, 120, 0, 90),
                position = UDim2.new(0, 8, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            hue = {
                size = UDim2.new(0, 16, 0, 90),
                position = UDim2.new(0, 136, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            markers = {
                sv = {size = UDim2.new(0, 6, 0, 6)},
                hue = {size = UDim2.new(0, 16, 0, 2)}
            }
        },
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5)
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0)
                }
            },
            button = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0.5),
                position = UDim2.new(0.5, 0, 0.75, 0),
                size = UDim2.new(0, 220, 0, 25),
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Left,
                paddingLeft = UDim.new(0, 32),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            panel = {
                background = Color3.fromRGB(16, 16, 16),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0.5, 0),
                position = UDim2.new(0.5, 0, 0.98333, 0),
                size = UDim2.new(0, 220, 0, 160),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            sv = {
                size = UDim2.new(0, 150, 0, 110),
                position = UDim2.new(0, 10, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            hue = {
                size = UDim2.new(0, 16, 0, 110),
                position = UDim2.new(0, 170, 0, 8),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round
                }
            },
            markers = {
                sv = {size = UDim2.new(0, 6, 0, 6)},
                hue = {size = UDim2.new(0, 16, 0, 2)}
            }
        }
    },
    slider = {
        subtext = {
            frame = {
                size = UDim2.new(0, 240, 0, 60),
                anchorPoint = Vector2.new(0.5, 0.5),
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 236, 0, 30),
                position = UDim2.new(0.50729, 0, 0.28333, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0),
                },
            },
            track = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.new(0, 10, 0.75, 0),
                size = UDim2.new(0, 160, 0, 6),
                cornerRadius = 3,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            fill = {
                background = Color3.fromRGB(151, 151, 151),
                backgroundTransparency = 0,
                gradient = {
                    ColorSequence = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76)),
                    }),
                    Rotation = 0,
                },
                cornerRadius = 3,
            },
            thumb = {
                size = UDim2.new(0, 12, 0, 12),
                background = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                backgroundTransparency = 0,
                cornerRadius = 6,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 1,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            number = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.new(1, -10, 0.75, 0),
                size = UDim2.new(0, 56, 0, 22),
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                placeholderColor = Color3.fromRGB(201, 201, 201),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
        },
        inline = {
            frame = {
                size = UDim2.new(0, 240, 0, 30),
                anchorPoint = Vector2.new(0.5, 0.5),
            },
            richTextLabel = {
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textalignment = Enum.TextXAlignment.Left,
                richText = true,
                automaticSize = Enum.AutomaticSize.Y,
                size = UDim2.new(0, 115, 0, 30),
                position = UDim2.new(0.25, 0, 0.5, 0),
                anchorPoint = Vector2.new(0.5, 0.5),
                padding = {
                    left = UDim.new(0, 10),
                    right = UDim.new(0, 0),
                    top = UDim.new(0, 0),
                    bottom = UDim.new(0, 0),
                },
            },
            track = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(0, 0.5),
                position = UDim2.new(0, 126, 0.5, 0),
                size = UDim2.new(0, 60, 0, 6),
                cornerRadius = 3,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            fill = {
                background = Color3.fromRGB(151, 151, 151),
                backgroundTransparency = 0,
                gradient = {
                    ColorSequence = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 76, 76)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(151, 151, 151)),
                        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(76, 76, 76)),
                    }),
                    Rotation = 0,
                },
                cornerRadius = 3,
            },
            thumb = {
                size = UDim2.new(0, 12, 0, 12),
                background = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                backgroundTransparency = 0,
                cornerRadius = 6,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 1,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
            number = {
                background = Color3.fromRGB(26, 26, 26),
                backgroundTransparency = 0.75,
                anchorPoint = Vector2.new(1, 0.5),
                position = UDim2.new(1, -10, 0.5, 0),
                size = UDim2.new(0, 44, 0, 22),
                textColor = Color3.fromRGB(0, 0, 0), -- was 255,255,255
                textSize = 14,
                textFont = Enum.Font.RobotoMono,
                textAlignment = Enum.TextXAlignment.Center,
                placeholderColor = Color3.fromRGB(201, 201, 201),
                cornerRadius = 2,
                stroke = {
                    color = Color3.fromRGB(26, 26, 26),
                    thickness = 2,
                    strokeMode = Enum.ApplyStrokeMode.Border,
                    lineJoinMode = Enum.LineJoinMode.Round,
                },
            },
        },
    }
}


return styles
