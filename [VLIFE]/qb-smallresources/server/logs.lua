local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['qbjobs'] = 'https://discord.com/api/webhooks/1274675413158985738/YCpKqVjlmmt_if-58hui713YRtrq96WNxRDgQp9w6lWpfSr4TJbL5_JRCrJrecvPi1SJ',
    ['humanelabs'] = 'https://discord.com/api/webhooks/1280610714737840249/rsIAHdYjZrAMZxtgSO3MjdeZRw-3wD67kcXhjJfz4mWMGNMolQG49s5BzDyOc2Qix4w4',
    ['default'] = 'https://discord.com/api/webhooks/1274676522699198475/JvEEOhfmtht1jKC2yPtEFXhGWioYo2krLTQ3qml0cAHBOV0YVc67Mx3szp0S3wVIYsjr',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1274676375839572008/9LGMzwGgcewRjn7YGNSMmiyv4potW3xxERtyQKluzCI61rUuaEsZOPUl8ksBagHBeYQG',
    ['playermoney'] = 'https://discord.com/api/webhooks/1279403282267111496/rz0eRo6ngHmCpImS1fzh_g1ChyLhjNo12qGmtUT3H2AFBbS37a93VrA3piIUjWaBTKQk',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1280610793158606930/RHLlufc-FlEt4Tei71W37DSV2bUwG1z-AZ6ZVMETxoLhNmFUARPxYosS1K-t4wnbxUfd',
    ['robbing'] = 'https://discord.com/api/webhooks/1280610861089689601/m5snjK3NGaYi5kvjeHZIVhkqb1AOZegYW6kxcmZaJSA2iWTAgL_uv_FoL89gSBtC7deq',
    ['cuffing'] = 'https://discord.com/api/webhooks/1274677928768176128/yXhR0wpGuG2W7Zr89E_wPk8Ai5eoYBQ-3ge1Kw6Cxck_1mrREp4Xj-sB0t_pfden3lJv',
    ['drop'] = 'https://discord.com/api/webhooks/1280610950973489193/bsaOjIJy9FBF2_SfTmCw5AmVuD_46GsoflU4QdMWgUSkcRPNC4EId4cxPj0FdF5-i4GU',
    ['trunk'] = 'https://discord.com/api/webhooks/1274678086532861952/uI1-RuQ93HtO-eMTARphepTN9210hamHVt4cqeJBv9XhT61kro-WbCQr_prtjC68xO9r',
    ['stash'] = 'https://discord.com/api/webhooks/1274678209572503653/eU9iVogFRMg2ft7a9gA1n_j1Nrk_rrS7tlGz-0qvNfoNggzZXToJEA4fm4Ybmx_KATwc',
    ['glovebox'] = 'https://discord.com/api/webhooks/1274678465018331212/wjcM-JlI3srUF3ElenH5mB4q4NehRUaJjYXASNxIvGItBkbvacMHlj6KmIuSxkF-wDM3',
    ['banking'] = 'https://discord.com/api/webhooks/1274678569854963732/4a3F2v23andOmYjuB5uLn8NwCDtWYH4CCxejaRdQqS2NI34PR7xs1pATNP7PsD1eet4p',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1274678700050223198/e7cuEG4tF29nQn4WhUteqrIZMmnPARTlQaOS-jF058e2LJziUmvAbMUx9SnGBdGC6dh3',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1189241634186080256/KaCoQ2fgVHpk-bm9JvVD5kR1v9wzkWrN2HabPuH7CiwVrhyS2ajOiZQIUgv9ZgyxabrH',
    ['shops'] = 'https://discord.com/api/webhooks/1274679158114619433/pBYQConnIC3wpamO8mSsK5yBMVm3INlFjRXRCcKZEXZr43jfczJGeGqtyIvnLXtyAeFv',
    ['dealers'] = 'https://discord.com/api/webhooks/1274679251244814398/ZULlN0sCaDgWIbzXc0cjIp5MclxiBwkFy3dzZbJHpu95Xdu3vuWwdLqqELRAqekI0DWp',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1280611136638550077/BmHh8zprsnlfkFsjUyjzAfDicGVp9fTk3k-u9mEaRMcLnAsNj-p01DrLkA9qCc9MosiH',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1280611136638550077/BmHh8zprsnlfkFsjUyjzAfDicGVp9fTk3k-u9mEaRMcLnAsNj-p01DrLkA9qCc9MosiH',
    ['death'] = 'https://discord.com/api/webhooks/1274679617327992893/DC3QegkJrQFZBfC8cjhNko9F18SlSy0L4_JWLXvxGzgOdBMhSdwaqkCaafXuGHvmO32F',
    ['joinleave'] = 'https://discord.com/api/webhooks/1274679762761154560/nyiHR9BLYklmXCl4Q_BMdVtFbc7WVLS7drM-3nxn2wR7pmigaFkeUbFdLxmMhthml1mB',
    ['ooc'] = 'https://discord.com/api/webhooks/1274681141424558130/qnqov0ANvouXJHKgv8zpiBysraEB8MMsPuq7ZlkD5m98OOyWy22fSSaQ5ZoV77Sinc1w',
    ['report'] = 'https://discord.com/api/webhooks/1274681215336583178/8TpMceHSvEv7ufFfLzUV_8GjXSbEtI16N6UF6zTgQCd4IfP2wu0ocx0Q6gu6zG12j4_E',
    ['me'] = 'https://discord.com/api/webhooks/1274681292495130626/zFiIAEuVMntMCSMdeKXyv18IPWkxKprkgD1sNOgvI9ZTPrTCAm9mcBK8JeY6pnrlh7l6',
    ['pmelding'] = 'https://discord.com/api/webhooks/1274681367501996032/kUPYR1qnQ7hAIDF5aeeVtjr1N1E6DKSInVZxgRYeU4E083ipCYPA35IyzRm-BBQWPiTa',
    ['112'] = 'https://discord.com/api/webhooks/1274681467921891328/LIcsi2iDmRmIVyme8Aha2XmBfgTaigyIn-cUSxhI98rKCIettgd-09rZuzRhXxTGgFEl',
    ['bans'] = 'https://discord.com/api/webhooks/1274681533437055097/dKpl2z8Q6HHCeAwndm1Y4ok1oTBKUZ5ffAOEmtx24WJj_gnp3y5pse19_KYliqBfQuTp',
    ['anticheat'] = 'https://discord.com/api/webhooks/1274681605058727998/iILSfkYtjQ-e9YGmkX0df6Qdl4CKz77C_cuVFxsD-TkwA9x3BPHtyJU4VBF-bGrHKeYE',
    ['weather'] = 'https://discord.com/api/webhooks/1274681688609394709/NgpS-xak7r_WSpgAgJObZoHQVNiEfpKBtXZdX2_8FnXt6fg8aKDxzTkMvWoE6gIDWUpr',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1274681762332545098/RISzY8tWvS8GHqcw1rk54ACGlzugQi8udSf0ETHKel2SgEMHK3TEQjAYRlOr7Ct0_flF',
    ['bennys'] = 'https://discord.com/api/webhooks/1274681852635906068/HP-8eAELbPmlzpTiM26k7Apz2dI5b6yU8_Pi_5kn6wGLifSNu8fjD2exj8kw7RbDC5pD',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1280611060197621832/bIipkRlY1t0zV9XVsPLFhNpQqU75pP9oNoH3TYfMWGo1mxGaKm4Xo_yCa0i32rWxh2Ln',
    ['robbery'] = 'https://discord.com/api/webhooks/1280611136638550077/BmHh8zprsnlfkFsjUyjzAfDicGVp9fTk3k-u9mEaRMcLnAsNj-p01DrLkA9qCc9MosiH',
    ['casino'] = 'https://discord.com/api/webhooks/1280611584280100984/oJ1dar54jSOJqtL9whKMR9upHctoQm9Bc9zzyN_VRF9ggDfAcOtuJMXzVF-25QjaRsHs',
    ['traphouse'] = 'https://discord.com/api/webhooks/1274685277289582605/K5ubVWZmZC0ttv3_CX89Gt_nX3U04IOBHG18-mEa4XaWoHz-2GK9MeRJ9L6V8w5-cZbm',
    ['911'] = 'https://discord.com/api/webhooks/1274685549625475245/23j24ZKzMl2aSIurH9Tw4-6Dw-hJ0QnF9RWa7jV6TJc_r2r1bad1oNyXdYkW3WVJwZKD',
    ['palert'] = 'https://discord.com/api/webhooks/1274685641048981544/bhtOcX3A9vt_TCM_qI7Nt81f4FnncUExV2Ri8RV1ck2QgwDUpKiwFRdXL_nY8TRBkQ9B',
    ['house'] = 'https://discord.com/api/webhooks/1280611507885047828/XF7-QcV1dxAzRzGeaOJc439Qad1ZFR7i8MR2EU-rOVfP-n1rLCN97Wc5KclK3WIxh_cI',
    ['granny'] = 'https://discord.com/api/webhooks/1274685806568542239/9lJ8XFosBWgc6qykP8yTIh3up5BtraEqi9pFU-SVpNn3sh3reJqrIpW_yOyy08qVQ0m8',
    ['truckrobbery'] = 'https://discord.com/api/webhooks/1280611136638550077/BmHh8zprsnlfkFsjUyjzAfDicGVp9fTk3k-u9mEaRMcLnAsNj-p01DrLkA9qCc9MosiH',
    ['varheist'] = 'https://discord.com/api/webhooks/1274685988102209598/UE3EaS6xgYo4JU2Z-8SUL-SUemoNZVbO7xaDJqRQbXetenhdRPBhrVcy3hC2Nf3DNDH_',
    ['hunting'] = 'https://discord.com/api/webhooks/1274686052824776786/d14Nmt7aH84HSMhM94Nq3BwExhGNG4dKjNOJAfhP_AazfKOw1o7bWEVWCCaSYFciRfL5',
    ['gamble'] = 'https://discord.com/api/webhooks/1274686128850473033/zw27MFlB3gO6wZdG_TiRXwLHsrgLN_idW1hiDmsEP3z1UTs6mMmtLe59FQ8Vn8ILX0Ux',
    ['scenes'] = 'https://discord.com/api/webhooks/1274686184206893157/G6dKzwzq9xeLOMpIHRwmofjS9PkZa_7CYoB-SOxvFWkHmSRYKiGGgg8tTvcPAs_bagNK',
    ['gundrop'] = 'https://discord.com/api/webhooks/1274686711800270881/RBfPuU04HA7EoVUDopUdu1Cws-4J2eqSucaHvN0rqa1KuK1yTcYfqYQB_ZdJkF6i45JB',
    ['gangmenu'] = 'https://discord.com/api/webhooks/1280611277097406464/S9EZV_jAgAXimylOUhsbGaM3ZRasTFAlErlWf8o3hA-4cpjN7_RuStaIcRMQKnQyPfmg',
    ['warehouse'] = 'https://discord.com/api/webhooks/1274686879081562182/AVpu0ZZrhjKmmeT-jbKwgSbfFPsqcJJC0sduXvrgy9bwCpvfwDHP_NiSVV-S0EQhd25n',
    ['pdarmory'] = 'https://discord.com/api/webhooks/1280611355589873718/OtgAgp8Eb1hq9QPjco0tFIV8UhpGr5QNR7U63kSAT-HlRVipcV1DPr6_bVcelRWIlT8m',
    ['evidence'] = 'https://discord.com/api/webhooks/1274687056479653928/kF75KZn4081GinJqVgBxpRz5SfjLPwarm6moPX3jKqzThOPUEdE7Ou41JVZE7k0ZrGn5',
    ['donjewellery'] = '',
    ['eventtrigger'] = 'https://discord.com/api/webhooks/1274687174843039764/-CkaNH4suC82r3XDa7fFM8BvPvLVudwjPlI-pLW4pVVXY5v5Luvc1TaO8MMF5T7yp7pJ',

    
    
    ['spins'] = 'https://discord.com/api/webhooks/1274688005302653079/3ZLOnU_bg8eu05l9iMdvWiXvkpKKVqlyKhq6sVyS7enfRFzAs5XfIZirDoBvPLVgaKD_',
    
    ['methruns'] = 'https://discord.com/api/webhooks/1274687837135966209/oX4xdVlcrt2R8CYdstdbsAChnEzGu8Wv5iW3KlQnhaQYHym_vIw3T6H08jlbhhxS4byt',
    ['cadtax'] = 'https://discord.com/api/webhooks/1274687708685402193/pJUvz8yGjt21_C5mBrR6ZsO_QAazKe0fykEi8AiUNARzE8uDPOTbK7BbkO6aKJWcL7vE',
    ['vendingwithdraw'] = 'https://discord.com/api/webhooks/1274687633729130558/ohLh6yhxYiYcRYzpzU-A3ITxE6H94OLTIpoMjhysumhxzaJrM56SZSmabJ-4nJEOvJ8r',
    
    ['EVgrandma'] = 'https://discord.com/api/webhooks/1274687574576992369/9ywX3SwnIOtb2_HiWjcLm4oFxnHZmaHMgxE-uA1VWkr16LPEjT8briFeYvgqFhcTQDPw',

}



local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    if tag then
        local embedData = {
            {
                ['title'] = title,
                ['color'] = Colors[color] or Colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'vLife Logs',
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1202716897100177539/1206466052717023232/vLife.png?ex=65dc1c12&is=65c9a712&hm=e4c1134657ed1158ce69ebfef31da990bf37b1ef3beca6b073c3f3e2e070aa49&',
                },
            }
        }
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'vLife Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
        Citizen.Wait(100)
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'vLife Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    else
        local embedData = {
            {
                ['title'] = title,
                ['color'] = Colors[color] or Colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = 'vLife Logs',
                    ['icon_url'] = 'https://cdn.discordapp.com/attachments/1202716897100177539/1206466052717023232/vLife.png?ex=65dc1c12&is=65c9a712&hm=e4c1134657ed1158ce69ebfef31da990bf37b1ef3beca6b073c3f3e2e070aa49&',
                },
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name]+1] = {webhook = webHook, data = embedData}

        if #logQueue[name] >= 10 then
            local postData = { username = 'vLife Logs', embeds = {} }

            for i = 1, #logQueue[name] do
                postData.embeds[#postData.embeds+1] = logQueue[name][i].data[1]
            end

            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })

            logQueue[name] = {}
        end
    end

end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 30 then -- If 30 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'ElevateRP Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds+1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')