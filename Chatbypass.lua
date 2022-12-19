repeat task.wait() until game:IsLoaded()
task.wait(1)

local settings = {
    mode = 1
}

if getgenv().chatmod then
    for i,v in next, getgenv().chatmod.connections do
        v:Disconnect()
    end
end
getgenv().chatmod = {
    connections = {},
}
local lplr = game:GetService("Players").LocalPlayer

local Chat,Box,newChat

local suc = pcall(function()
    Chat = lplr.PlayerGui.Chat
    Box = Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
end)

if not suc then
    Box = game:GetService("CoreGui").ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox
    newChat = true
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

local function sendMessage(content)
    if (newChat) then
        return game.TextChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(content)
    else
        return sendMessage(content)
    end
end

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
    for _,v in next, bypass do
        newstr = newstr..v
    end
    return newstr
end

local bypasses = {
    ["fuck"] = bypass("fu ck"),
    ["fucking"] = bypass(" fuck ing"),
    ["fucked"] = bypass(" fucked"),
    ["nigger"] = bypass(" nigger"),
    ["nigga"] = bypass(" nigga"),
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

if settings.mode == 2 then --credits for this method: https://github.com/AnthonyIsntHere
    bypasses = {
        ["ass"] = "as{{aieixzvzx:s}}",
        ["fucking"] = bypass(" fuck ing"),
        ["asshole"] = "as{{aieixzvzx:shole}}",
        ["bitch"] = "bit{{aieixzvzx:ch}}",
        ["cock"] = "co{{aieixzvzx:ck}}",
        ["cunt"] = "cu{{aieixzvzx:nt}}",
        ["dick"] = "di{{zczxczvz:ck}}",
        ["dyke"] = "dy{{aieixzvzx:ke}}",
        ["faggot"] = "fa{{aieixzvzx:ggot}}",
        ["fuck"] = "fu{{aieixzvzx:ck}}",
        ["gaylord"] = "gayl{{aieixzvzx:ord}}",
        ["kike"] = "ki{{aieixzvzx:ke}}",
        ["motherfucker"] = "motherf{{aieixzvzx:ucker}}",
        ["nigga"] = "ni{{aieixzvzx:gga}}",
        ["nigger"] = "ni{{aieixzvzx:gger}}",
        ["piss"] = "p{{aieixzvzx:iss}}",
        ["penis"] = "pe{{aieixzvzx:nis}}",
        ["pussy"] = "pu{{aieixzvzx:ssy}}",
        ["shit"] = "sh{{aieixzvzx:it}}",
        ["slut"] = "sl{{aieixzvzx:ut}}",
        ["whore"] = "who{{aieixzvzx:re}}",
        ["discord"] = "disco{{aieixzvzx:rd}}",
        ["kys"] = "k{{aieixzvzx:ys}}",
        ["kill"] = "ki{{aieixzvzx:ll}}",
        ["vape"] = "va{{aieixzvzx:pe}}",
        ["lmfao"] = "lmf{{aieixzvzx:ao}}",
        ["lmao"] = "lmf{{aieixzvzx:ao}}",
        ["pick cotton"] = "pi{{aieixzvzx:ck}} cotton",
        ["hitler"] = "hi{{aieixzvzx:tler}}",
        ["stfu"] = "st{{aieixzvzx:fu}}",
        ["trollage"] = "trolla ge",
        ["wtf"] = "wt{{aieixzvzx:f}}",
        ["retard"] = "ret{{aieixzvzx:ard}}"
    }
end

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = Box.Focused:connect(function()
    Box.Text = ""
end)

for _,v in next, getconnections(Box.FocusLost) do
    v:Disable()
end

getgenv().chatmod.connections[#getgenv().chatmod.connections+1] = Box.FocusLost:Connect(function(enter)
    if enter then
        local getidentity = syn and syn.get_thread_identity or getthreadidentity
        local setidentity = syn and syn.set_thread_identity or getthreadidentity
        local newtext = ""
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
            task.spawn(function()
                task.wait(0.2)
                sendMessage("\226\154\170\226\154\170\226\154\170\226\154\170\240\159\148\180\240\159\148\180\226\154\170")
                sendMessage("\240\159\148\180\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\226\154\170")
                sendMessage("\240\159\148\180\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\226\154\170")
                sendMessage("\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170\226\154\170")
                sendMessage("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\240\159\148\180")
                sendMessage("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\240\159\148\180\240\159\148\180\240\159\148\180")
                sendMessage("\226\154\170\240\159\148\180\240\159\148\180\226\154\170\226\154\170\226\154\170\226\154\170")
            end)
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
        if Box.Text == "5$" then
            sendMessage("[\204\178\204\133$\204\178\204\133(\204\178\204\1335\204\178\204\133)\204\178\204\133$\204\178\204\133]")
            Box.Text = 'To Chat click here or press "/" key'
            return
        end
--[[         if Box.Text:lower():find("fuck you") then
            newtext = Box.Text:gsub("fuck you", bypasses.fuckyou)
            sendMessage(newtext)
            Box.Text = 'To Chat click here or press "/" key'
            return
        end ]]
        local split = {}
        local newstr = Box.Text
        if settings.mode == 1 then
            split = Box.Text:split(" ")
            for i,v in next, bypasses do
                for i2,v2 in next, split do
                    if v2 == i then
                        split[i2] = v2:gsub(i,v)
                    end
                end
            end
        elseif settings.mode == 2 then
            if newstr:find("fucking") then
                newstr = newstr:gsub("fucking", bypasses.fucking)
            end
            for i,v in next, bypasses do
                newstr = newstr:gsub(i,v)
            end
            if newstr:find("{{") then
                newstr = newstr.." fn"
            end
        end
        if Box.Text:find(";kick default") then
            newtext = ";kill default"
            sendMessage(newtext)
            task.wait(1)
        end
        newtext = table.concat(split, " ")
        if settings.mode == 2 then
            newtext = newstr
        end
        if newtext ~= "" then
            if newtext:find("retard") then
                local split = newtext:split("retard")
                sendMessage(split[1])
                sendMessage("retard")
                sendMessage(split[2])
            else
                sendMessage(newtext)
            end
        end
        Box.Text = 'To Chat click here or press "/" key'
    else
        Box.Text = 'To Chat click here or press "/" key'
    end
end)
