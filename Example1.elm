module Example1 exposing (main)

import Html exposing (text)
import Json.Decode exposing (Error, decodeString, errorToString, field, map, string)



-- type Result error value = Ok value | Err error


type alias User =
    { name : String }


parseJSON : String -> Result Error User
parseJSON =
    field "name" string |> map User |> decodeString


json =
    "{ \"name\": \"John\" }"


result =
    parseJSON json


main =
    case result of
        Ok user ->
            text ("Hi " ++ user.name)

        Err error ->
            text ("Error: " ++ errorToString error)
