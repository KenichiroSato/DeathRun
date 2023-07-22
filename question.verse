
using { /Verse.org/Random }

q := interface():
    IsRight() : logic
    Text(): string
    LeftText(): string
    RightText(): string

# Used just for initial value
null_q := class(q):
    IsRight<override>(): logic = true
    Text<override>(): string = ""
    LeftText<override>(): string = ""
    RightText<override>(): string = ""

multiplication_q := class(q):
    Num1 : int
    Num2 : int
    LeftOption : int
    RightOption : int

    IsRight<override>(): logic =
        if(Num1 * Num2 = RightOption):
            true
        else:
            false

    Text<override>(): string = "{Num1} × {Num2}"

    LeftText<override>(): string = "{LeftOption}"

    RightText<override>(): string = "{RightOption}"

fraction_q := class(q):
    LeftNumerator: int
    LeftDenominator: int
    RightNumerator: int
    RightDenominator: int

    IsRight<override>(): logic =
        if (Floor(LeftNumerator * 100 / LeftDenominator) < Floor(RightNumerator * 100 / RightDenominator)):
            true
        else:
            false

    Text<override>(): string = "どっちが大きい？"

    LeftText<override>(): string = "{LeftNumerator} / {LeftDenominator}"

    RightText<override>(): string = "{RightNumerator} / {RightDenominator}"

    