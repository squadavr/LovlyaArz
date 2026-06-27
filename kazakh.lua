local active = false

require('lib.moonloader')
local sampev = require('lib.samp.events')

function main()
    while not isSampAvailable() do wait(0) end
    sampAddChatMessage('[squad] Скрипт жүктелді!', -1)

    sampRegisterChatCommand('lovla', function()
        active = not active
        sampAddChatMessage(active and 'Қосылған' or 'Өшірілген', 0xFFFFFF)
    end)
    function sampev.onServerMessage(color, text)
   
    if active then
        if string.find(text, "Историю покупок и продаж можно просмотреть") then
            active = false
            sampAddChatMessage('Дүңгіршек сәтті жабылды.', -1)
        end
    end
end

    while true do
        wait(0)

        if wasKeyPressed(VK_INSERT) then
            sampAddChatMessage('Сценарий тоқтатылды', -1)
            active = false
        end

        if active and not sampIsCursorActive() then
            --Нажатие Alt
            setVirtualKeyDown(VK_LMENU, true)
            wait(10)
            setVirtualKeyDown(VK_LMENU, false)
            --------------------------------------
            --wait(25)
            --Нажатие Enter`
            setVirtualKeyDown(13, true)
            --wait(25)
            setVirtualKeyDown(13, false)
            setVirtualKeyDown(13, true)
            --wait(25)
            setVirtualKeyDown(13, false)
        end
    end
end