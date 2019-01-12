module Data.Train exposing (dateOfDeparture, timeOfDeparture, ticketType, departureStation, arrivalStation)

import Data.Bookings exposing (Booking)

dateOfDeparture : Booking -> String
dateOfDeparture booking = 
    case booking.product.details.journeys of
        Just journeys ->
            case List.head journeys of
                Just journey ->
                    case List.head journey.legs of 
                        Just leg ->
                            leg.depart.dateTime

                        Nothing ->
                            "First leg not recorded"

                Nothing ->
                    "First journey not recorded"
        Nothing ->
            "Journeys not recorded"

timeOfDeparture : Booking -> String
timeOfDeparture booking = 
    case booking.product.details.journeys of
        Just journeys ->
            case List.head journeys of
                Just journey ->
                    case List.head journey.legs of 
                        Just leg ->
                            leg.depart.dateTime

                        Nothing ->
                            "First leg not recorded"

                Nothing ->
                    "First journey not recorded"
        Nothing ->
            "Journeys not recorded"

ticketType : Booking -> String
ticketType booking = 
    case booking.product.details.journeys of
        Just journeys ->
            case List.head journeys of
                Just journey ->
                    journey.ticketType.name

                Nothing ->
                    "First journey not recorded"
        Nothing ->
            "Journeys not recorded"

departureStation : Booking -> String
departureStation booking =
    case booking.product.details.journeys of
        Just journeys ->
            case List.head journeys of
                Just journey ->
                    case List.head journey.legs of 
                        Just leg ->
                            leg.depart.location.name 

                        Nothing ->
                            "First leg not recorded"

                Nothing ->
                    "First journey not recorded"
        Nothing ->
            "Journeys not recorded"

arrivalStation : Booking -> String
arrivalStation booking = 
    case booking.product.details.journeys of
        Just journeys ->
            case List.head journeys of
                Just journey ->
                    case List.tail journey.legs of 
                        Just leg ->
                            leg.arrive.location.name 

                        Nothing ->
                            "Last leg not recorded"

                Nothing ->
                    "First journey not recorded"
        Nothing ->
            "Journeys not recorded"