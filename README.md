# Hope is postponed disappointment

![Cover](hope_cover.jpg)

These are the code snippets used during the talk "Hope is postponed disappointment".

To test the Elm code, you can either do it online following the links below, or running these commands to test them locally

```shell
git clone https://github.com/lucamug/hope.git
cd hope
npx elm reactor
```

Then you can browse the `*.elm` files from http://localhost:8000/

To test the TypeScript code, you can do it online following the links below.

# Example 1

### Elm code

[Code on-line](https://ellie-app.com/prbmwnLVc8na1)


```elm
module Main exposing (main)

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
```

### TypeScript code

[Code on-line](https://www.typescriptlang.org/play?#code/C4TwDgpgBAShDOBXANsKAeAogJ2wGigHkBrAPigF4oBvKYgSwDsATALigHISOBuKANwCGyRBHYkoAXygAfGnSZtOObLygRcAe2zsVUngCgDoSFACq8DZXmNBAWzFR4wbEwDm+owDNEjAMbA9JqMUGCC2JYAUgDKhAByUAAUAFbwwezOrowecr7MEF5MEMwAlOxwSKgYme4EFhrk1AZQUC4gNM0tUPReSanBlBRUeQVFpR1dXdgQwIjYIbQMLOwcKhwEGtjaKzHx3fBQI4WMxRyek5KdLX7BzoeW2Na7cQB0YREQKWmMJVCCB-VsIZJj0kgBCRAPWRyCEPF62By-JqTFrTWbzeRLJSrXDrdRaHScABECIgRLoEHa9AOdmp8HcZ0kwK6l0maLmCwUy043AIQhEjkhViZnWkfkEwD8AAskpttEirlB2RjFooVmsNgT2AADACSjH59GYUGeUAAJNQ5dhJNrzlIDJcDDdGHd+iEqBxaCT7GT2ETIpopYxyZJeE7bmhppU0FR3lFYnEvsESoYDPAAO70SUyxJRlDAF5YhXXf7QLjEDisRXOtLICAvZCaNyJIkACXoUHJAGolQh8y9+aJ4T6U4qAEbTQTEZniyzKXFVyY1zR1htNlsqbadqA9vOoF5W0eTCcQKfM-JeQT5xddGtoCAADylV+c9H4EAAwlKIH5iOwTu+jxUHuwDMi0J5ng6BhAA)

```javascript
type Result <Err, Ok> = { kind: 'Ok'; value: Ok } | { kind: 'Err'; error: Err };

type User = { name: string };

function parseJSON (json: string | undefined): Result <string, User> {
  try {
    if (json === undefined) {
      return { kind: 'Err', error: 'JSON is undefined' };
    }
    const user = JSON.parse(json) as User;
    if (!user || !user.name) {
      return { kind: 'Err', error: '"name" key is missing' };
    }
    return { kind: 'Ok', value: user };
  } catch (error) {
    return { kind: 'Err', error: `Invalid JSON ${error}` };
  }
}

const json = '{ "name": "John" }';
const result = parseJSON(json);

switch (result.kind) {
  case 'Ok':
    console.log("Hi " + result.value.name);
    break;
  case 'Err':
    console.log("Error: " + result.error);
    break;
  default:
    const exhaustiveCheck: never = result;
    break;
}
```










# Example 2

Using `map` and `andThen` to concatenate functions that may fail `divideBy` and not fail `multiplyBy`.

### JavaScript Code

[Code on-line](https://www.typescriptlang.org/play?#code/C4TwDgpgBAShDOBXANsAPADQDRQIID4oBeKAbymAEMBzALigHIB5AawYG4oA3S5RCerigBfKAB8yFGvQYBRAE7yOUCIoD28+hhHsAULoDGagHbxgUACYBLLlYsQAQiGJQAFJXrHEAWwBGqnF9PH395AEp6OCRUNDN5K2NqHC8-VUIiQlJdKCgrADM3SmIiEgAGMLJsnKh5CGBEeWNJKjpGBSUcVXkNGQARGzsICyhfZ1KGHSrRCGR4aCzqmrqGpvIWmVYGHB4+ARGoAHooIuE9HOFdC8MTMyhvFGArMGQQJxd3YNT5QM-QiKgUqFiJkqrV6o1jlAAFQjPRXIymczeShgFyYHC4HAOfCuAy8ZC+SgGFj0Vw7fiCCoZKAOHC1aLASIIB7ovD4f5RFnYGnpEE5eAAdyswAMAAs3PSHgA6FoVBbVPFzNqKBj0MErZrSZUdFTqTRLBlSroaSaLRXQZhsKBq5YQtZay1bbi8ClQPHIAlEliuSWoKXkiAVU5TS76BG3SjGCwAFVFECaJFZmJ5uPxhOJpIDlOBsGZMW52LpecZuYZSfZTLLBd5lX5QpF4p9xZlNDlVRy5u1qqW4NWUlachVnT1NsNxvkpoVlCVjutPY17s9xKbhoDYTOIlDugORwAnIcoABmaFQACMpQPAFYTwAma6IihqKjIFztxZ3FHv1wGnP3VBPF43m-KAbyLeAoDCLA30WSMYzjJpv3pHNrFsew3hyYDLzAiCcGg6pkVRRZEIQX8HgA15nG-c9sMgqA8JyWDY3jNwf2pFDBnQlijxoqDFntAdNm2F09n3UQwnE9cwxuNRkAgKVkDUahXGAJ9eEk7cjgAGUU6ghmdXZ6H4jY2CEgyzxvEQgA)

```typescript
type Result<X, A> = { tag: 'Ok'; value: A } | { tag: 'Err'; error: X };

const divideBy = (a: number, b: number): Result<string, number> => {
  if (a === 0) {
    return { tag: 'Err', error: 'Divided by 0' };
  } else {
    return { tag: 'Ok', value: b / a };
  }
}

const multiplyBy = (a: number, b: number): number => {
  return a * b;
}

const map = <X, A, B>(callback: (value: A) => B, result: Result<X, A>): Result<X, B> => {
  switch (result.tag) {
    case 'Err': return { tag: 'Err', error: result.error };
    case 'Ok' : return { tag: 'Ok', value: callback(result.value) };
  }
}

const andThen = <X, A, B>(callback: (value: A) => Result<X, B>, result: Result<X, A>): Result<X, B> => {
  switch (result.tag) {
    case 'Err': return { tag: 'Err', error: result.error };
    case 'Ok' : return callback(result.value);
  }
}

// 9 / 3 * 10 / 5 * 2
const total = 
        map     ( res => multiplyBy (  2, res ),
        andThen ( res => divideBy   (  5, res ), 
        map     ( res => multiplyBy ( 10, res ), 
        andThen ( res => divideBy   (  3, res ),
    { tag: 'Ok', value: 9 } ))));

console.log(total);

// Logged value: { tag: 'Ok', value: 12 }
```
















# Example 3

Adding partial application.

### Elm code

[Code on-line](https://ellie-app.com/psCqtsfXrsWa1)

```elm
module Main exposing (main)

import Html exposing (text)
import Result exposing (andThen, map)

divideBy a b = if a == 0 then Err "Divided by 0" else Ok (b / a) 

multiplyBy a b = a * b

-- 9 / 3 * 10 / 5 * 2
total =
    Ok 9
        |> andThen ( divideBy    3 )
        |> map     ( multiplyBy 10 )
        |> andThen ( divideBy    5 )
        |> map     ( multiplyBy  2 )

main = text <| Debug.toString total

-- Logged value: Ok 12

```
### TypeScript code

[Code on-line](https://www.typescriptlang.org/play?#code/C4TwDgpgBAShDOBXANsAPADQDRQCoD4oBeKAbymAEMBzALigHIB5AawYG4oA3S5RCerigBfKAB8yFGvQYBRAE7yOUCIoD28+hhHsAULoDGagHbxgUALaUwxKGgCCOAEL4AFAd7IARpQMt6rjx8AlD2AJTEhE4RRISu8ggowPRwSKhoZvIAlsbUOPb4YSmJ6Zk5eVAukWS6UFDwAO5ZwAYAFlDxJcAAdFTUEaS1dVAe8NDMbPQJwIjyxpJ9MqwMOEH89B7I3r4snWk9axARwnrDI5RjjApKUxAzc1AJ+6ciuif6RqbmlMYAJritCDzEgOZxuTbbPwBQ70cLVVJJDLAbK5MExOJPJLFfZIlEVApFWBdXHlMHVQZ1RrNNodTGoXo0AZDOqjcbLW73eYQnx+PZJbqHMIvFkXcbXBgc2bzOnAF7CN56QwmMxQX5ZLhZX4QJwgWyuSj0YyICxeVTojpeQ3G03yQkI0rI0lQI0m1SEWI1OpZABmHUoxCIJAADEyztMpQtpFdFCsVOpNIwACLqzUQX5QLy6oMMHRDUQQZCXCnDcMPciLRjLVa8dYZqAAeig-vedXl7yVX0sSSyYGQIB1eoNzutZuqrktw9dtqtU+q-oAVBnFZ8VcA1FRkLYhvXGwBOBtQADMUEXAEYgweAKwnqAAJmZlmsZzqri7qB7fYHr7vUAiYVcD4-P8gLzB0qoplqA4vnU15-gBZxWDYz6vhY3a9v2uqvuev6-vBwxAQCQLQWqGqQbq0FHjh-5DOWUYTLGMJQPuwhhKxQofMqajIBA3TIGo1CuGuG7sboO5QAAMvx1BptwNYhLRdCVmw1bBPQAAsF7CEAA)

```typescript
type Result<X, T> = { tag: 'Ok'; value: T } | { tag: 'Err'; error: X };

const map = <A, B>(callback: (value: A) => B) => (result: Result<string, A>): Result<string, B> => {
  switch (result.tag) {
    case 'Ok': return { tag: 'Ok', value: callback(result.value) };
    case 'Err': return result;
  }
};

const andThen = <A, B>(callback: (value: A) => Result<string, B>) => (result: Result<string, A>): Result<string, B> => {
  switch (result.tag) {
    case 'Ok': return callback(result.value);
    case 'Err': return result;
  }
};

const divideBy = (a: number) => (b: number): Result<string, number> => {
  if (a === 0) {
    return { tag: 'Err', error: 'Divided by 0' };
  } else {
    return { tag: 'Ok', value: b / a };
  }
};

const multiplyBy = (a: number) => (b: number): number => {
  return a * b;
}

// 9 / 3 * 10 / 5 * 2
const total = 
        map      ( multiplyBy (  2 ) )(
        andThen  ( divideBy   (  5 ) )(
        map      ( multiplyBy ( 10 ) )(
        andThen  ( divideBy   (  3 ) )(
    { tag: 'Ok', value: 9 }))));

console.log(total);

// Logged value: { tag: 'Ok', value: 12 }
```