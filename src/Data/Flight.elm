module Data.Flight exposing (flightsList)

import Data.Bookings exposing (Booking, FlightDetails)


flightsList : Booking -> List FlightDetails
flightsList booking =
    case booking.product.details.flights of
        Just flights ->
            flights

        Nothing ->
            []
