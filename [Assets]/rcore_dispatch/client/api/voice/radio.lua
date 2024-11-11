RADIO_FREQUENCY_RESERVED = 800 -- > 900 (1 - 1000)
FREQUENCIES = {}
RADIO_READY = false

---Funcion that prepares the radio to work with the dispatch
function InitRadio()
    GLOBALS.RADIO = {}
    if not CONFIG.Features['radio'] then return end
    if not GLOBALS.CHARACTER.RADIO_ENABLED then return end
    for _, job_def in pairs(CONFIG.JOBS) do
        for _, unit in pairs(job_def.Units) do
            if job_def.Jobname then
                if not FREQUENCIES[job_def.Jobname] then
                    FREQUENCIES[job_def.Jobname] = {}
                end
                dbg.info('Created frequency ' .. unit[2] .. ' for ' .. unit[1])
                FREQUENCIES[job_def.Jobname][unit[1]] = unit[2]
            end
        end
        if CL_CONFIG.EnableRadioOnAssign then
            FREQUENCIES[job_def.Jobname][_U('ASSIGN')] = CONFIG.JOBS[job_def.Jobname].GlobalFrequency
        end
    end
end

---Move the player to a unit frequency
---@param freq string
function MoveToFrequency(freq)
    if not CONFIG.Features['radio'] then return end
    if not GLOBALS.CHARACTER.RADIO_ENABLED then return end
    local job = FRAMEWORK.GetPlayerJob()
    if not FREQUENCIES[job] then return dbg.error('No radio for ' .. job) end
    if not FREQUENCIES[job][freq] then return dbg.warning('No radio for ' .. job .. ' at ' .. freq) end
    local frequency = FREQUENCIES[job][freq]
    if not frequency then return dbg.error('Error moving to ' .. freq .. ' on radio') end
    Wait(100)
    exports['pma-voice']:setRadioChannel(frequency)
    Wait(100)
    exports['pma-voice']:setVoiceProperty('radioEnabled', true)
    dbg.info('Radio moved to ' .. freq .. ' on radio ' .. frequency)
end

---Get the current radio frequency
---@param freq_num number
local function PlayerFreqChanged(freq_num)
    if not CONFIG.Features['radio'] then return end
    if not GLOBALS.CHARACTER.RADIO_ENABLED then return end
    local job = FRAMEWORK.GetPlayerJob()
    dbg.info('Radio frequency changed to ' .. freq_num)
    local freq = ''
    for freq_name, freq_id in pairs(FREQUENCIES[job]) do
        if freq_num == freq_id then
            freq = freq_name
        end
    end
    if not FREQUENCIES[job] then return dbg.error('No radio for ' .. job) end
    if not FREQUENCIES[job][freq] then
        return TriggerServerEvent('rcore_dispatch:server:frequencyChanged', freq, true)
    end
    dbg.info('Sending radio frequency change to ' .. freq .. ' on radio ' .. FREQUENCIES[job][freq])
    TriggerServerEvent('rcore_dispatch:server:frequencyChanged', freq, false)
    TriggerServerEvent('rcore_dispatch:server:joinFrequency', freq)
end

RegisterNetEvent('rcore_dispatch:client:frequencyChanged', PlayerFreqChanged)
