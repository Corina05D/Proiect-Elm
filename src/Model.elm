module Model exposing (..)

import Html exposing (b, div, p, text)
import Model.Date as Date
import Model.Event as Event exposing (Event)
import Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected)
import Model.Interval as Interval
import Model.PersonalDetails exposing (DetailWithName, PersonalDetails)
import Model.Repo exposing (Repo)


type alias Model =
    { personalDetails : PersonalDetails
    , events : List Event
    , selectedEventCategories : SelectedEventCategories
    , repos : List Repo
    }


academicEvents : List Event
academicEvents =
    [ { title = "Academic event 1: High School"
      , interval = Interval.withDurationYears (Date.onlyYear 2016) 4
      , description = p [] [ text "I obtained ", b [] [ text "excellent" ], text " grades." ]
      , category = Academic
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "Academic event 2: University"
      , interval = Interval.withDurationYears (Date.onlyYear 2020) 2
      , description = div [] []
      , category = Academic
      , url = Nothing
      , tags = []
      , important = False
      }
    ]


workEvents : List Event
workEvents =
    [ { title = "Work event"
      , interval = Interval.withDurationMonths 2022 Date.Jun 3
      , description = text "Internship"
      , category = Work
      , url = Nothing
      , tags = []
      , important = False
      }
    ]


projectEvens : List Event
projectEvens =
    [ { title = "University project 1"
      , interval = Interval.oneYear 2022
      , description = text "Polynomial calculator in Java"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "University project 2"
      , interval = Interval.oneYear 2022
      , description = text "Queue simulator in Java"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    , { title = "University project 3"
      , interval = Interval.oneYear 2022
      , description = text "Online shop"
      , category = Project
      , url = Nothing
      , tags = []
      , important = False
      }
    ]

awardEvents : List Event
awardEvents =
    [ { title = "Award event"
      , interval = Interval.withDurationYears (Date.onlyYear 2020) 4
      , description = text "Sef de promotie liceu"
      , category = Award
      , url = Nothing
      , tags = []
      , important = False
      }
    ]


personalDetails : PersonalDetails
personalDetails =
    { name = "Corina- Madalina Dragotoniu"
    , intro = "I like computers and flowers!"
    , contacts = [ DetailWithName "email" "corina.dragotoniu05@yahoo.com" ]
    , socials = [ DetailWithName "github" "https://github.com/Corina05D?tab=repositories" ]
    }


initModel : Model
initModel =
    { personalDetails = personalDetails
    , events = Event.sortByInterval <| academicEvents ++ workEvents ++ projectEvens ++ awardEvents
    , selectedEventCategories = allSelected
    , repos = []
    }
