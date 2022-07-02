--u can't use team chat with this, it's made to bypass roblox chat filter
--don't expect all the bypasses to work, because roblox loves patching these
repeat task.wait() until game:IsLoaded()
task.wait(1)

local Chat = lplr.PlayerGui.Chat
local Box = Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
Box.Focused:connect(function()
    Box.Text = ""
end)

for i,v in next, getconnections(Box.FocusLost) do
	v:Disable()
end

local bypasses = {
    ["trollage"] = "troll\240\144\140\145age",
    --["discord.gg/"] = "Discord .ɡɡ/",
    --["discord."] = "Discord .",
    ["discord"] = "Discord",
    ["discord."] = "D\240\144\140\145\240\144\140\145\240\144\140\145i\240\144\140\145\240\144\140\145\240\144\140\145s\240\144\140\145\240\144\140\145\240\144\140\145c\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145ord .",
    --["discord."] = "d\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145і\240\144\140\145s\240\144\140\145\240\144\140\145\240\144\140\145c\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145o\240\144\140\145r\240\144\140\145d.",
    ["lmao"] = "lm \240\144\140\145 \205\156 \205\163ao",
    ["lmfao"] = "lm \240\144\140\145\205\156\205\163fɑo",
    ["LMFAO"] = "lm \240\144\140\145 \205\156 \205\163fao",
    --["discord"] = "dd\240\144\140\145\240\144\140\145\240\144\140\145i\240\144\140\145\240\144\140\145\240\144\140\145s\240\144\140\145\240\144\140\145\240\144\140\145c\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145ord",
    ["vape"] = "va\240\144\140\145 \205\156 \205\163pe",
    ["LMAO"] = "LM \240\144\140\145 \205\156 \205\163AO",
    ["fuck"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145",
    ["fucked"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145 ed",
    ["shit"] = "Sh\240\144\140\145 \205\156 \205\163 it",
    ["fuckyou"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145уou",
    ["kys"] = "ky\240\144\140\145 \205\156 \205\163s",
    ["wtf"] = "ѡ\240\144\140\145 \205\156 \205\163t\240\144\140\145 \205\156 \205\163f",
    ["WTF"] = "ѡ\240\144\140\145 \205\156 \205\163T\240\144\140\145 \205\156 \205\163F",
    ["fucker"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145er",
    ["fucking"] = "ff\240\144\140\145\240\144\140\145\240\144\140\145u\240\144\140\145\240\144\140\145\240\144\140\145ϲ\240\144\140\145\240\144\140\145\240\144\140\145k\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145\240\144\140\145ing",
}

Box.FocusLost:connect(function(enter)
    if enter then
        if Box.Text == "swastika" then
            spawn(function()
                task.wait(0.5)
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\226\154\170\226\154\170\226\154\170\240\159\148\180\240\159\148\180\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\240\159\148\180\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\240\159\148\180\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\240\159\148\180", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\240\159\148\180", "All")
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\226\154\170\226\154\170\226\154\170", "All")
            end)
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
        if Box.Text == "5$" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[\204\178\204\133$\204\178\204\133(\204\178\204\1335\204\178\204\133)\204\178\204\133$\204\178\204\133]", "All")
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
        if Box.Text:lower():find("fuck you") then
            newtext = Box.Text:gsub("fuck you", bypasses["fuckyou"])
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
        for i,v in pairs(bypasses) do
            if Box.Text:find(i) then
                found = true
                newtext = Box.Text:gsub(i, v)
            elseif not found then
                newtext = Box.Text
            end
        end
        if newtext ~= "" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
        end
        Box.Text = 'To Chat click here or press "/" key'
    else
        Box.Text = 'To Chat click here or press "/" key'
    end
end)
