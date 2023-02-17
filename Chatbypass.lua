repeat task.wait() until game:IsLoaded()
task.wait(1)

local settings = {
    mode = 1
}

if getgenv().chatmod then
    for _,v in next, getgenv().chatmod.connections do
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
    Box = game:GetService("CoreGui"):WaitForChild("ExperienceChat"):WaitForChild("appLayout"):WaitForChild("chatInputBar"):WaitForChild("Background"):WaitForChild("Container"):WaitForChild("TextContainer"):WaitForChild("TextBoxContainer"):WaitForChild("TextBox")
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
        return game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(content, "All")
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
    ["fuck"] = bypass("fuck"),
    ["fucking"] = bypass(" fuck ing"),
    ["fucked"] = bypass("fucked"),
    ["nigger"] = bypass("nigger"),
    ["nigga"] = bypass("nigga"),
    ["niggas"] = bypass("niggas"),
    ["niggers"] = bypass(" niggers"),
    ["vape"] = bypass("vape"),
    ["discord"] = bypass("discord"),
    ["kys"] = bypass("kys"),
    ["faggot"] = bypass("faggot"),
    ["lmfao"] = bypass("lmfao"),
    ["LMFAO"] = bypass("lmfao"),
    ["lmao"] = bypass("lmao"),
    ["LMAO"] = bypass("lmao"),
    ["shit"] = bypass("shit"),
    ["cotton"] = bypass("cotton"),
    ["cock"] = bypass("cock"),
    ["ass"] = bypass("ass"),
    ["tit"] = bypass("tit"),
    ["titts"] = bypass("tits"),
    ["wtf"] = bypass("wtf"),
    ["WTF"] = bypass("wtf"),
    ["trollage"] = bypass("trollage"),
}

for i,v in next, bypasses do
    bypasses[i] = "("..v..")"
end

if settings.mode == 2 then
    bypasses = {
        hate = bypass("hate"),
        asshole = "аѕѕһоlе",
        ass = "а⁥⁥⁥⁥ѕѕ",
        ["anal sex"] = "а⁥⁥⁥⁥n⁥⁥⁥⁥а⁥⁥⁥⁥l⁥⁥⁥⁥ ѕ⁥⁥⁥⁥е⁥⁥⁥⁥х",
        boobs = "Вoobs",
        blowjob = "Вӏоwjob",
        ["https://blacked.com"] = "h⁥⁥⁥⁥t⁥⁥⁥⁥t⁥⁥⁥⁥р⁥⁥⁥⁥ѕ⁥⁥⁥⁥:⁥⁥⁥⁥/⁥⁥⁥⁥/⁥⁥⁥⁥b⁥⁥⁥⁥l⁥⁥⁥⁥а⁥⁥⁥⁥с⁥⁥⁥⁥k⁥⁥⁥⁥е⁥⁥⁥⁥d⁥⁥⁥⁥.⁥⁥⁥с⁥⁥⁥⁥о⁥⁥⁥⁥m⁥⁥⁥⁥",
        ["Boom, cockshot!"] = "В⁥⁥⁥⁥о⁥⁥⁥⁥о⁥⁥⁥⁥m⁥⁥⁥⁥ с⁥⁥⁥⁥о⁥⁥⁥⁥с⁥⁥⁥⁥k⁥⁥⁥⁥ѕ⁥⁥⁥⁥h⁥⁥⁥⁥о⁥⁥⁥⁥t⁥⁥⁥⁥!⁥⁥⁥⁥",
        ["Bites your cock"] = "Віtеѕ уоur сосk",
        bbc = "big black со⁥⁥⁥сk",
        cocaine = "сосaine",
        cock = "сосk",
        cocksucker = "сосk suсkеr",
        cum = "с⁥⁥⁥⁥um",
        fatasshoe = "f⁥аt а⁥ѕѕ һое",
        fatass = "f⁥аt а⁥ѕѕ һое",
        hoe = "һое",
        ["hardcode sex"] = "h⁥⁥⁥⁥а⁥⁥⁥⁥r⁥⁥⁥⁥d⁥⁥⁥⁥с⁥⁥⁥⁥о⁥⁥⁥⁥r⁥⁥⁥⁥е⁥⁥⁥⁥ ѕ⁥⁥⁥⁥е⁥⁥⁥⁥х⁥⁥⁥⁥",
        hardcode = "h⁥⁥⁥⁥а⁥⁥⁥⁥r⁥⁥⁥⁥d⁥⁥⁥⁥с⁥⁥⁥⁥о⁥⁥⁥⁥r⁥⁥⁥⁥е⁥⁥⁥",
        ["https://pornhub.com"] = "h⁥⁥⁥⁥t⁥⁥⁥⁥t⁥⁥⁥⁥р⁥⁥⁥⁥ѕ⁥⁥⁥⁥:⁥⁥⁥⁥/⁥⁥⁥⁥/⁥⁥⁥⁥р⁥⁥⁥⁥о⁥⁥⁥⁥r⁥⁥⁥⁥n⁥⁥⁥⁥h⁥⁥⁥⁥u⁥⁥⁥⁥b⁥⁥⁥⁥.⁥⁥⁥с⁥⁥⁥⁥о⁥⁥⁥⁥m⁥⁥⁥⁥",
        rape = "rаре",
        sex = "ѕ⁥⁥⁥⁥е⁥⁥⁥⁥х",
        titties = "Тitties",
        weed = "w⁥⁥⁥⁥е⁥⁥⁥⁥е⁥⁥⁥⁥d⁥⁥⁥⁥",
        BOOBS = "ВOOBS",
        bitch = "ВI⁥⁥⁥⁥⁥⁥TСН",
        ["big boobs"] = "ВIG ВООВS",
        bitches = "ВIT⁥⁥⁥⁥⁥⁥⁥СНEЅ",
        CUM = "СUМ",
        cunt = "СU⁥⁥⁥NТ",
        COCK = "СОCK",
        dumbass = "DU⁥МВ А⁥ЅЅ",
        hentai = "НЕΝТАӀ",
        masturbate = "МАЅТURВАТЕ",
        pussy = "РUЅЅҮ",
        piss = "РӀЅЅ",
        PENIS = "РЕNIS",
        RAPE = "RАРЕ",
        shit = "ЅНIТ",
        TITTIES = "ТITTIЕS",
        thot = "ТН⁥⁥⁥⁥⁥ОТ",
        xxx = "ΧΧΧ",
        cut = "сut",
        yourself = "yоur⁥sеlf",
        smd = "ѕ⁥⁥⁥⁥u⁥⁥⁥⁥с⁥⁥⁥⁥k⁥⁥⁥⁥ m⁥⁥⁥⁥у⁥⁥⁥⁥ с⁥⁥⁥⁥о⁥⁥⁥⁥с⁥⁥⁥⁥k⁥⁥⁥⁥ r⁥⁥⁥⁥е⁥⁥⁥⁥t⁥⁥⁥⁥а⁥⁥⁥⁥r⁥⁥⁥d⁥",
        stfu = "Ѕ⁥⁥⁥⁥Н⁥⁥⁥⁥U⁥⁥⁥⁥Т⁥⁥⁥⁥ U⁥⁥⁥⁥Р⁥⁥⁥⁥ F⁥⁥⁥⁥ А⁥⁥⁥⁥ G⁥⁥⁥⁥ G⁥⁥⁥⁥ О⁥⁥⁥⁥ Т",
        bouttacum = "І⁥⁥⁥⁥ А⁥⁥⁥⁥М⁥⁥⁥⁥ А⁥⁥⁥⁥В⁥⁥⁥⁥О⁥⁥⁥⁥U⁥⁥⁥⁥Т⁥⁥⁥⁥ Т⁥⁥⁥⁥О⁥⁥⁥⁥ С⁥⁥⁥⁥U⁥⁥⁥⁥М⁥⁥⁥⁥",
        imhorny = "IМ SО НОRNY",
        fuck = "Fuくk",
        faggot = "f⁥⁥⁥⁥ а⁥⁥⁥⁥ g⁥⁥⁥⁥ g⁥⁥⁥⁥ о⁥⁥⁥⁥ t⁥⁥",
        nigga = "п⁥iɡ⁥ɡ⁥а",
        nigger = "niġġer",
        porn = "рогn",
        penis = "реп⁥is",
        kys = "К⁥⁥⁥⁥⁥YЅ",
        youbitch = "ҮＯU ЫтСН ������",
        kysbitch = "К⁥⁥⁥⁥⁥YЅ ВI⁥⁥⁥⁥⁥⁥TСН",
        kkk = "ккк",
        fuckme = "FU⁥СКМ⁥Е",
        iloveboobs = "ilovebо⁥оbѕ",
        bouncyboobs = "bouncyboobs",
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
            for i,v in next, bypasses do
                newstr = newstr:gsub(i,v)
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
