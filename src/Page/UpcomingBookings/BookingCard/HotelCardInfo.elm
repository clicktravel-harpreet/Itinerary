module Page.UpcomingBookings.BookingCard.HotelCardInfo exposing (contents, startDate)

import Data.Bookings exposing (Booking)
import Data.Hotel as Hotel
import Element exposing (Element, centerX, column, el, fill, fillPortion, link, padding, paragraph, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Page.UpcomingBookings.ViewBookingButton as ViewBookingButton
import Util.Date exposing (dayAsNumber, monthAsString)


startDate : Booking -> List (Element msg)
startDate booking =
    [ text <| dayAsNumber <| Hotel.checkInDate booking
    , text " of "
    , text <| monthAsString <| Hotel.checkInDate booking
    ]


contents : Booking -> List (Element msg)
contents booking =
    [ paragraph [ Font.underline ] [ text "Stay at " ]
    , row []
        [ paragraph [ Font.bold ] [ text <| Hotel.name booking ] ]
    , row []
        [ link []
            { url = "mailto:" ++ Hotel.email booking
            , label = text <| "Email: " ++ Hotel.email booking
            }
        ]
    , row []
        [ link []
            { url = "tel:" ++ Hotel.telephone booking
            , label = text <| "Telephone: " ++ Hotel.telephone booking
            }
        ]
    ]
