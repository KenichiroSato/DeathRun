using { /Verse.org/Random }

question_factory := class():
    Create(): q = MakeFractionQ()

    MakeFractionQ(): fraction_q =
        var LeftSmall: int = 0
        var LeftBig: int = 0
        var RightSmall: int = 0
        var RightBig: int = 0
        loop:
            set LeftSmall = GetRandomInt(1, 11)
            set LeftBig = GetRandomInt(LeftSmall + 1, 12)
            set RightSmall = GetRandomInt(1, 11)
            set RightBig = GetRandomInt(RightSmall + 1, 12)
            if(Left:int = Floor(LeftSmall* 100 / LeftBig)):
                if(Right:int = Floor(RightSmall* 100 / RightBig)):
                    Print("{LeftSmall}/{LeftBig} = {Left} {RightSmall}/{RightBig} = {Right}")
                    if (not Left = Right):
                        break
        return fraction_q{
            LeftNumerator := LeftSmall,
            LeftDenominator := LeftBig,
            RightNumerator := RightSmall,
            RightDenominator := RightBig
            }

    MakeMultiprecationQ(): multiplication_q =
        LeftVal: int = GetRandomInt(1, 19)
        RightVal: int = GetRandomInt(1, 19)
        Correct: int = LeftVal * RightVal
        var Wrong: int = -1
        loop:
            set Wrong = Correct + GetRandomInt(-5, 5)
            if (not Wrong = Correct and Wrong > 0):
                break
        return multiplication_q{ Num1 := LeftVal, Num2 := RightVal, LeftOption := Correct, RightOption := Wrong}