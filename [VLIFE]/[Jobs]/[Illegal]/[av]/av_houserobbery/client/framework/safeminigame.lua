_onSpot = false
isMinigame = false
_SafeCrackingStates = "Setup"

function createSafe(combination)
	local res
	isMinigame = not isMinigame
	RequestStreamedTextureDict("MPSafeCracking",false)
	RequestAmbientAudioBank("SAFE_CRACK",false)
	if isMinigame then
		FreezeEntityPosition(PlayerPedId(),true)
        Wait(500)
		InitializeSafe(combination)
		form = setupScaleform("instructional_buttons")
        while isMinigame do
			DrawSprites(true)
			DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
			res = RunMiniGame()
			if res == true then
				FreezeEntityPosition(PlayerPedId(),false)
				return res
			elseif res == false then
				FreezeEntityPosition(PlayerPedId(),false)
				return res
			end
			Citizen.Wait(0)
		end
	end
end

function InitializeSafe(safeCombination)
	_initDialRotationDirection = "Clockwise"
	_safeCombination = safeCombination

	RelockSafe()
	SetSafeDialStartNumber()
end

function DrawSprites(drawLocks)
	local textureDict = "MPSafeCracking"
	local _aspectRatio = GetAspectRatio(true)
    
	DrawSprite(textureDict,"Dial_BG",0.48,0.3,0.3,_aspectRatio*0.3,0,255,255,255,255)
	DrawSprite(textureDict,"Dial",0.48,0.3,0.3*0.5,_aspectRatio*0.3*0.5,SafeDialRotation,255,255,255,255)

	if not drawLocks then
		return
	end

	local xPos = 0.6
	local yPos = (0.3*0.5)+0.035
	for _,lockActive in pairs(_safeLockStatus) do
		local lockString
		if lockActive then
			lockString = "lock_closed"
		else
			lockString = "lock_open"
		end

		DrawSprite(textureDict,lockString,xPos,yPos,0.025,_aspectRatio*0.015,0,231,194,81,255)
		yPos = yPos + 0.05
	end
end

function RunMiniGame()
	if _SafeCrackingStates == "Setup" then
		_SafeCrackingStates = "Cracking"
	elseif _SafeCrackingStates == "Cracking" then
		local isDead = GetEntityHealth(PlayerPedId()) <= 101
		if isDead then
			EndMiniGame(false)
			return false
		end

		if IsControlJustPressed(0,177) then
			EndMiniGame(false)
			return false
		end

		if IsControlJustPressed(0,38) then
			if _onSpot then
				ReleaseCurrentPin()
				_onSpot = false
				if IsSafeUnlocked() then
					EndMiniGame(true,false)
					return true
				end
			else
				EndMiniGame(false)
				return false
			end
 		end

		HandleSafeDialMovement()

		local incorrectMovement = _currentLockNum ~= 0 and _requiredDialRotationDirection ~= "Idle" and _currentDialRotationDirection ~= "Idle" and _currentDialRotationDirection ~= _requiredDialRotationDirection

		if not incorrectMovement then
			local currentDialNumber = GetCurrentSafeDialNumber(SafeDialRotation)
			local correctMovement = _requiredDialRotationDirection ~= "Idle" and (_currentDialRotationDirection == _requiredDialRotationDirection or _lastDialRotationDirection == _requiredDialRotationDirection)  
			if correctMovement then
				local pinUnlocked = _safeLockStatus[_currentLockNum] and currentDialNumber == _safeCombination[_currentLockNum]
				if pinUnlocked then
					PlaySoundFrontend(0,"TUMBLER_PIN_FALL","SAFE_CRACK_SOUNDSET",true)
					_onSpot = true
				end
			end
		elseif incorrectMovement then
			_onSpot = false
		end
	end
end

function HandleSafeDialMovement()
	if IsControlJustPressed(0,35) then
		playFx('anim@scripted@heist@ig15_safe_crack@male@','input_safe_code_right_player')
		RotateSafeDial("Anticlockwise")
	elseif IsControlJustPressed(0,34) then
		playFx('anim@scripted@heist@ig15_safe_crack@male@','input_safe_code_left_player')
		RotateSafeDial("Clockwise")
	else
		RotateSafeDial("Idle")
	end
end

function RotateSafeDial(rotationDirection)
	if rotationDirection == "Anticlockwise" or rotationDirection == "Clockwise" then
		local multiplier
		local rotationPerNumber = 3.6
		if rotationDirection == "Anticlockwise" then
			multiplier = 1
		elseif rotationDirection == "Clockwise" then
			multiplier = -1
		end

		local rotationChange = multiplier * rotationPerNumber
		SafeDialRotation = SafeDialRotation + rotationChange
		PlaySoundFrontend(0,"TUMBLER_TURN","SAFE_CRACK_SOUNDSET",true)
	end

	_currentDialRotationDirection = rotationDirection
	_lastDialRotationDirection = rotationDirection

end

function SetSafeDialStartNumber()
	local dialStartNumber = math.random(0,100)
	SafeDialRotation = 3.6 * dialStartNumber
end

function RelockSafe()
	if not _safeCombination then
		return
	end
    
	_safeLockStatus = InitSafeLocks()
	_currentLockNum = 1
	_requiredDialRotationDirection = _initDialRotationDirection
	_onSpot = false

	for i = 1,#_safeCombination do
		_safeLockStatus[i] = true
	end
end

function InitSafeLocks()
	if not _safeCombination then
		return
	end
    
	local locks = {}
 	for i = 1,#_safeCombination do
		table.insert(locks,true)
	end

	return locks
end

function GetCurrentSafeDialNumber(currentDialAngle)
	local number = math.floor(100*(currentDialAngle/360))
	if number > 0 then
		number = 100 - number
	end

	return math.abs(number)
end

function ReleaseCurrentPin()
	_safeLockStatus[_currentLockNum] = false
	_currentLockNum = _currentLockNum + 1

	if _requiredDialRotationDirection == "Anticlockwise" then
		_requiredDialRotationDirection = "Clockwise"
	else
		_requiredDialRotationDirection = "Anticlockwise"
	end

	PlaySoundFrontend(0,"TUMBLER_PIN_FALL_FINAL","SAFE_CRACK_SOUNDSET",true)
end

function IsSafeUnlocked()
	return _safeLockStatus[_currentLockNum] == nil
end

function playFx(dict,anim)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(10)
	end

	TaskPlayAnim(PlayerPedId(),dict,anim,3.0,3.0,-1,2,0,0,0,0)
end

function EndMiniGame(safeUnlocked)
	if safeUnlocked then
		PlaySoundFrontend(0,"SAFE_DOOR_OPEN","SAFE_CRACK_SOUNDSET",true)
	else
		PlaySoundFrontend(0,"SAFE_DOOR_CLOSE","SAFE_CRACK_SOUNDSET",true)
	end
	isMinigame = false
	SafeCrackingStates = "Setup"
	ClearPedTasksImmediately(PlayerPedId())
end

exports("createSafe",createSafe)

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function setupScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    -- draw it once to set up layout
    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 0, 0)

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(2, 35, true))
    ButtonMessage("Turn right")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(2, 34, true))
    ButtonMessage("Turn left")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(2, 38, true))
    ButtonMessage("Confirm")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(2, 177, true))
    ButtonMessage("Exit")
	
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end