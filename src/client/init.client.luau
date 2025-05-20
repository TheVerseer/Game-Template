local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.Roact)

local Greeting = Roact.Component:extend("Greeting")

function Greeting:render()
	return Roact.createElement("ScreenGui", {
		Name = "Interface",
	}, {
		[self.props.Name] = Roact.createElement("TextLabel", {
			Text = "Hello, " .. self.props.Name,
			Size = UDim2.new(0, 200, 0, 50),
			Position = UDim2.new(0.5, -100, 0.5, -25),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextColor3 = Color3.fromRGB(0, 0, 0),
		}),
	})
end

Greeting = Roact.mount(
	Roact.createElement(Greeting, { Name = "World" }),
	game.Players.LocalPlayer:WaitForChild("PlayerGui"),
	"GreetingScreen"
)
