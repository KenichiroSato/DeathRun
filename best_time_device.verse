
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
best_time_device := class(creative_device):

    @editable Timer: timer_device = timer_device{}
    @editable RightTrigger:trigger_device = trigger_device{}
    @editable LeftTrigger:trigger_device = trigger_device{}
    @editable UiMessageDevice: ui_message_device = ui_message_device{}

    var BestTime<private>: int = 10000000

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        RightTrigger.TriggeredEvent.Subscribe(OnFinished)
        LeftTrigger.TriggeredEvent.Subscribe(OnFinished)

    OnFinished(MaybeAgent: ?agent) : void =
        Time:float = Timer.GetActiveDuration()
        Maxt:float = Timer.GetMaxDuration()
        if(Diff:int = Int[Maxt - Time]):
            Print("time={Time} Max={Maxt} diff={Diff}")
            if (Diff < BestTime):
                set BestTime = Diff
                BestTimeString:string = DurationToString(BestTime)
                UiMessageDevice.ShowBestTime("Best time = "+BestTimeString)

    DurationToString<private>(Duration: int): string =
        if(Minutes: int = Floor(Duration / 60)):
            if(Seconds: int = Mod[Duration,60]):
                var SecString: string = "{Seconds}"
                if (Seconds < 10):
                    set SecString = "0"+SecString
                return "{Minutes}:{SecString}"
        return ""