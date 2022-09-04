--you will not be able to use team chat or to private message people with this script, as i modify/replace some connections and i'm too lazy to make it work
--don't expect all the bypasses to work, because roblox loves patching these
repeat task.wait() until game:IsLoaded()
task.wait(1)
if getgenv().chatmod then
    for i,v in next, getgenv().chatmod.connections do
        v:Disconnect()
    end
end
getgenv().chatmod = {
    connections = {},
}
local lplr = game:GetService("Players").LocalPlayer

local Chat = lplr.PlayerGui.Chat
local ChatFrame = Chat.Frame
local Box = Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = Box.Focused:connect(function()
    Box.Text = ""
end)

for i,v in next, getconnections(Box.FocusLost) do
    v:Disable()
end

local bypasschars1 = {
    ["a"] = "🄐",
    ["b"] = "🄑",
    ["c"] = "🄒",
    ["d"] = "🄓",
    ["e"] = "🄔",
    ["f"] = "🄕",
    ["g"] = "🄖",
    ["h"] = "🄗",
    ["i"] = "🄘",
    ["j"] = "🄙",
    ["k"] = "🄚",
    ["l"] = "🄛",
    ["m"] = "🄜",
    ["n"] = "🄝",
    ["o"] = "🄞",
    ["p"] = "🄟",
    ["q"] = "🄠",
    ["r"] = "🄡",
    ["s"] = "🄢",
    ["t"] = "🄣",
    ["u"] = "🄤",
    ["v"] = "🄥",
    ["w"] = "🄦",
    ["x"] = "🄧",
    ["y"] = "🄨",
    ["z"] = "🄩",
}

local bypasschars2 = {
    ["a"] = "🅐",
    ["b"] = "🅑",
    ["c"] = "🅒",
    ["d"] = "🅓",
    ["e"] = "🅔",
    ["f"] = "🅕",
    ["g"] = "🅖",
    ["h"] = "🅗",
    ["i"] = "🅘",
    ["j"] = "🅙",
    ["k"] = "🅚",
    ["l"] = "🅛",
    ["m"] = "🅜",
    ["n"] = "🅝",
    ["o"] = "🅞",
    ["p"] = "🅟",
    ["q"] = "🅠",
    ["r"] = "🅡",
    ["s"] = "🅢",
    ["t"] = "🅣",
    ["u"] = "🅤",
    ["v"] = "🅥",
    ["w"] = "🅦",
    ["x"] = "🅧",
    ["y"] = "🅨",
    ["z"] = "🅩",
}

local function bypass(word)
    word = word:lower()
    local newstr = ""
    local half = math.round((#word)/2)
    local bypass = {}

    for i = 1,#word do
        if i > half-1 then
            bypass[#bypass+1] = word:sub(i,i):gsub(word:sub(i,i), (bypasschars1[word:sub(i,i)] or word:sub(i,i)))
        else
            bypass[#bypass+1] = word:sub(i,i):gsub(word:sub(i,i), (bypasschars2[word:sub(i,i)] or word:sub(i,i)))
        end
    end
    for i,v in bypass do
        newstr = newstr..v
    end
    return newstr
end

local bypasses = {
    ["fuck"] = bypass("fuck"),
    ["fucking"] = bypass(" fuck ing"),
    ["fucked"] = bypass(" fucked"),
    ["nigger"] = bypass(" nigger"),
    ["nigga"] = "nnn ii gg aa",
    ["niggas"] = bypass(" niggas"),
    ["niggers"] = bypass(" niggers"),
    ["vape"] = bypass(" va pe"),
    ["discord"] = bypass(" discord"),
    ["kys"] = bypass(" kys"),
    ["faggot"] = bypass(" faggot"),
    ["lmfao"] = bypass("lmfao"),
    ["LMFAO"] = bypass("lmfao"),
    ["lmao"] = bypass("lmao"),
    ["LMAO"] = bypass("lmao"),
    ["shit"] = bypass("shit"),
    ["cotton"] = bypass("cotton"),
    ["cock"] = bypass("cock"),
    ["ass"] = bypass("cock"),
    ["tit"] = bypass("tit"),
    ["tits"] = bypass("tits"),
    ["wtf"] = bypass("wtf"),
    ["WTF"] = bypass("wtf"),
    ["trollage"] = bypass("trollage"),
}

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = Box.FocusLost:connect(function(enter)
    if enter then
        local getidentity = syn and syn.get_thread_identity or getthreadidentity
        local setidentity = syn and syn.set_thread_identity or getthreadidentity
        local newtext = ""
        local found = false
        firesignal(lplr.Chatted, "hi")
        if Box.Text:find(".bind") then
            local args = Box.Text:split(" ")
            for i,v in next, shared.GuiLibrary.ObjectsThatCanBeSaved do
                if i:lower() == args[2]:lower().."optionsbutton" then
                    if args[3] then
                        local oldidentity = getidentity()
                        setidentity(8)
                        v["Api"]["SetKeybind"]((args[3]:lower() == "none" and "" or args[3]:upper()))
                        shared.GuiLibrary.CreateNotification("Module Bound", "Successfully Bound "..tostring(i):gsub("OptionsButton", "").."\nTo Key ".. string.upper(args[3]), 5)
                        setidentity(oldidentity)
                    end
                end
            end
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
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
        local split = Box.Text:split(" ")
        for i,v in next, bypasses do
            for i2,v2 in next, split do
                if v2 == i then
                    split[i2] = v2:gsub(i,v)
                end
            end
        end
        if Box.Text:find(";kick default") then
            newtext = ";kill default"
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
            task.wait(1)
        end
        newtext = table.concat(split, " ")
        if newtext ~= "" then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(newtext, "All")
        end
        Box.Text = 'To Chat click here or press "/" key'
    else
        Box.Text = 'To Chat click here or press "/" key'
    end
end)
