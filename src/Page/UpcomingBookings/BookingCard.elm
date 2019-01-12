module Page.UpcomingBookings.BookingCard exposing (view)

import Data.Bookings exposing (Booking, TravelType(..))
import Element exposing (Element, centerX, column, fill, fillPortion, link, padding, paragraph, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Page.UpcomingBookings.BookingCard.HotelCardInfo as HotelCardInfo
import Page.UpcomingBookings.ViewBookingButton as ViewBookingButton


view : Booking -> msg -> Element msg
view booking viewBookingMsg =
    row
        [ Background.color <| rgb255 255 255 255
        , centerX
        , width fill
        , spacing 10
        , padding 10
        , Border.color <| rgb255 0 134 183
        , Border.width 2
        ]
        [ column
            [ width <| fillPortion 2
            ]
            [ paragraph
                [ Font.bold
                , Font.center
                ]
              <|
                case booking.product.travelType of
                    Hotel ->
                        HotelCardInfo.startDate booking

                    _ ->
                        [ text "Travel type not implemented" ]
            ]
        , column
            [ spacing 10
            , width <| fillPortion 8
            ]
            [ column [ spacing 10 ] <|
                case booking.product.travelType of
                    Hotel ->
                        HotelCardInfo.contents booking

                    _ ->
                        [ text "travel type not implemented" ]
            , row []
                [ ViewBookingButton.view booking viewBookingMsg ]
            ]
        ]
