#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2
CoordMode "Pixel", "Client"

F2::ExitApp

Toggle := False
EvaluationC := 0x5B5D5E
RepeatBar := 0x374C75
RepeatSword := 0xFFEC88
$F1::
    {
        global Toggle
        Toggle := !Toggle
        
        if Toggle
            {
                SoundBeep 1000
                Sleep 500
            }
        else
            {
                SoundBeep 100
                ClearKeys()
            }
        
        while Toggle
            {
                BattleStart()
            }
    }

MoveAndShoot()
    {
        Send "{w down}"
        Shoot()
    }

Shoot()
    {
        Click "down"
        Sleep 355
        Click "up"
        Sleep 395
    }

BattleStart()
    {
        FirstPixel := PixelGetColor(369,185)
        SecondPixel := PixelGetColor(279,647)
        if (FirstPixel = EvaluationC || SecondPixel = RepeatBar)
            {
                ClearKeys()
                Sleep 2000
                BattleFinish()
            }
        else
            {
                MoveAndShoot()
            }
    }

BattleFinish()
    {
        SecondPixel := PixelGetColor(279,647)
        if (SecondPixel = RepeatBar)
            {
                ClearKeys()
                Sleep 2000
                RepeatQuest()
            }
        else
            {
                Sleep 50
                Click "down"
                Sleep 50
                Click "up"
                Sleep 50
            }
    }

RepeatQuest()
    {
        ThirdPixel := PixelGetColor(301,515)
        if (ThirdPixel = RepeatSword)
            {
                IsRepeatColor()
            }
        else
            {
                IsNotRepeatColor()
            }
    }

IsRepeatColor()
    {
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
    }

IsNotRepeatColor()
    {
        Click "down right"
        Sleep 50
        Click "up right"
        Sleep 50
        Send "{3 down}"
        Sleep 50
        Send "{3 up}"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
        Click "down"
        Sleep 50
        Click "up"
        Sleep 50
    }

ClearKeys()
    {
        Send "{LButton up}"
        Send "{RButton up}"
        Send "{w up}"
        Send "{3 up}"
    }