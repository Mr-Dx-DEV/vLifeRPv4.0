PS_ALERTS = {}

function GetPSAlerts()
    return PS_ALERTS
end

function AddPsAlert(data)
    local ps_alert = {
        dispatchCode = "911",
        priority = 1,
        callId = data.src,
        id = data.src,
        text = data.text,
        units = {},
        coords = data.coords,
        time = data.unique_time,
        message = data.text,
    }
    if type(data.job) == "table" then
        ps_alert.jobs = data.job
        ps_alert.job = data.job
    else
        ps_alert.jobs = { data.job }
        ps_alert.job = { data.job }
    end
    table.insert(PS_ALERTS, ps_alert)
end

ProvideExport('GetDispatchCalls', 'ps-dispatch', GetPSAlerts)
