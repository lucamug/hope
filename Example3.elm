module Example3 exposing (main)

import Html exposing (text)
import Result exposing (andThen, map)


divideBy a b =
    if a == 0 then
        Err "Divided by 0"

    else
        Ok (b / a)


multiplyBy a b =
    a * b



-- 9 / 3 * 10 / 5 * 2


total =
    Ok 9
        |> andThen (divideBy 3)
        |> map (multiplyBy 10)
        |> andThen (divideBy 5)
        |> map (multiplyBy 2)


main =
    text <| Debug.toString total



-- Logged value: Ok 12
