
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
ui_message_device := class(creative_device):

    @editable HudQuestion : hud_message_device = hud_message_device{}
    @editable HudRight : hud_message_device = hud_message_device{}
    @editable HudLeft : hud_message_device = hud_message_device{}

    @editable BestTime : hud_message_device = hud_message_device{}

    @editable Result : hud_message_device = hud_message_device{}


    # Runs when the device is started in a running game
    #OnBegin<override>()<suspends>:void =
        # Print("2 + 2 = {2 + 2}")

    HideMessage():void =
        HudQuestion.Hide()
        HudLeft.Hide()
        HudRight.Hide()

    ShowCorrect():void =
        ShowMessage(Result, "せいかい！")

    ShowWrong():void =
        ShowMessage(Result,"ちがうよ")


    ShowMessage(Device: hud_message_device, Message: string) : void =
        Device.Hide()
        Device.SetText(StringToMessage(Message))
        Device.Show()

    StringToMessage<localizes>(value:string) : message = "{value}"

    ShowQuestion(Question: q):void =
        ShowMessage(HudQuestion, Question.Text())
        ShowMessage(HudLeft, "{Question.LeftText()} 👈")
        ShowMessage(HudRight, "👉 {Question.RightText()}")

    ShowBestTime(Time: string):void =
        ShowMessage(BestTime, Time)
