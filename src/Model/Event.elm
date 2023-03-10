module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class,style, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)
import List exposing (..)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
      events
        |> List.sortWith (\ev1 -> \ev2 -> Interval.compare ev1.interval ev2.interval)


view : Event -> Html Never
view event =
   let
        myClass important = 
            if important == True then class "event event-important"
            else class "event"
        
        myFont = style "font-family" "Arial"
        mySize = style "font-size" "120%"
        myLength = Interval.length event.interval  |> Maybe.withDefault (0, 0)
        myInterval = if (myYears ++ " " ++ myMonths) == " " then "None" else (myYears ++ " " ++ myMonths)
        myYears = if Tuple.first myLength == 0 then "" else (String.fromInt (Tuple.first myLength) ++ " years")
        myMonths = if Tuple.second myLength == 0 then "" else (String.fromInt (Tuple.second myLength) ++ " months")
        myUrl = case event.url of
                    Just u -> a [href u] [text u]
                    Nothing -> a [] [text "None"]
    in
        div [myClass event.important] 
            [ h1 [class "event-title", mySize] [text event.title]
            , p [class "event-description"] [ div [ myFont ] [ i [] [ text "Description" ]], event.description]
            , p [class "event-category"] [ div [ myFont ] [ i [] [ text "Category" ]], ( categoryView event.category )]
            , p [class "event-interval"] [ div [ myFont ] [ i [] [ text "Interval" ]], text ( myInterval )]
            , p [class "event-url"] [ div [ myFont ] [ i [] [ text "Link" ]], myUrl]
            ]
