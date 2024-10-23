Config = {}

-- [[ Notification ]]

Config.DefaultNotifDuration = 5000 -- [[ if you do not mention duration while executing notif duration then that notif will automatically delete after (5 seconds) depends on your value ]]

Config.Events = {

    -- ===========================
    -- ======== [Notify] ========
    -- ===========================

    --[[ Here you can change any event name as you want ]]

    -- * Notify Events Arugments 

    --[[

    icon, --* [String] Image link or path 
    header, --*( OPTIONAL ) if you do not want header then make the value (false) . N:B -> If you put value false then icon and header will be not shown so no point to add any value on [icon] but if you put no issue
    ftype,  --* Options ->  You can only put this value here (1,2) and it should be number value not string. This is two different font style
    msg, --* Notify message
    color, --* Put the notify side bar color like this (#ff0039 , white , red , rgba(120, 50 , 960) ) any color value you can put here
    duration --* ( OPTIONAL ) if you leave it empty then notify will remove by default after (Config.DefaultNotifDuration) this time. Or you can put time [1000 -> 1second]

    ]]

    notify = { -- [client] This is the notify event and export and argument same

        event = 'onx-interaction:client:notify',
        export = 'notify'

    },

    -- ===========================
    -- === [Sticky Messages] ===
    -- ===========================

    stickymsg = {
        event = {
            set = 'onx-interaction:client:setStickyMsg', --[[

            Arguments -> 

            *( msg , duration  ) 

            msg -> string value -> put your desired message

            ]]

            hide = 'onx-interaction:client:hideStickyMsg', --[[
                No arguments needed
            ]]
            setGlobal = 'onx-interaction:global:setStickyMsg', -- [[ If you want to set Sticky message for everyone across the server ]] 

            -- Aruments same as [set]

            hideGlobal = 'onx-interaction:global:hideStickyMsg' -- [[ If you want to hide Sticky message for everyone across the server ]]

            -- No arguments needed

        },

        export = {

            --[[ Same arguments like events ]]

            set = 'setStickymsg',
            hide = 'hideStickymsg'
        }

    },

    -- ===========================
    -- === [Left Interaction] ===
    -- ===========================

    leftInteraction = {
        event = {
            show = 'onx-interaction:client:leftcontext:show',

            -- Arguments -> 

            --[[

            uniquekey, --?> [string] (this can be any string value) This is a identifier key you can put any thing. Suppose you put (garagea) so when you want to hide that you just need to pass that unique value. By this you can use multiple interaction
            key, --> [String] This is the bind text value example (E , ESC , F )
            context --> [String] This is the help text for the interaction.

            ]]

            hide = 'onx-interaction:client:leftcontext:hide',
            --[[

            uniquekey --?> only pass unique key

            ]]

            clickHide = 'onx-interaction:client:leftcontext:clickHide' -- Details -> this event same as hide one just a few color change if you use it will look good . Here is a use case 

            --[[

            If IsControlJustPressed(0 ,38) then
                TriggerEvent('onx-interaction:client:leftcontext:clickHide')
            else
                TriggerEvent('onx-interaction:client:leftcontext:hide')
            end

            ]]

            -- * Arguments  ->     

            --[[

            uniquekey --?> only pass unique key

            ]]

        },

        export = {

            -- All arugments same as like events

            show = 'leftInteractionShow',
            hide = 'leftInteraction',
            clickHide = 'leftInteractionHideClicked'

        }
    },

    -- ===========================
    -- ====== [Mid Context] ======
    -- ===========================

    midContext = {
        event = {
            show = 'onx-interaction:client:midContext:show', --[[

               key, --> [String] Binds key. Indication of which key need to click 
               msg --> [String] Help text

            ]]
            hide = 'onx-interaction:client:midContext:hide' -- No arguments
        },

        export = {
            show = 'showMidContext',
            hide = 'hideMidContext'
        }
    },

    -- ===========================
    -- ===== [Mid Indication] ====
    -- ===========================

    midIndication = {
        event = {
            show = 'onx-interaction:client:indicate:show', --[[

               msg --> [String] Help text

            ]]
            hide = 'onx-interaction:client:indicate:hide' -- No arguments
        },

        export = {
            show = 'showIndication',--[[

            msg --> [String] Help text

            ]]
            hide = 'hideIndication'
        }
    },
}
