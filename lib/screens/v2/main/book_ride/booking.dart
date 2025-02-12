import 'package:flutter/material.dart';
import 'package:taxi_booking/components/v2/booking_selection.dart';
import 'package:taxi_booking/screens/v2/main/bottom_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

import 'luxury_party/car_details/vehicle_type_screen.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/menu.png"),
                SizedBox(height: 30),
                Image.asset("images/girls_ride.png"),
                SizedBox(height: 40),
                BookingSelection(
                  image: "images/event_booking.png",
                  title: "Exclusive Event Booking",
                  onTap: () {
                    launchScreen(
                        context, BottomScreen(screenType: ScreenType.event),
                        // ChauffeurBookingScreen(),
                        pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                ),
                SizedBox(height: 40),
                BookingSelection(
                  image: "images/chauffuer.png",
                  title: "Chauffuer Service",
                  onTap: () {
                    launchScreen(
                        context, BottomScreen(screenType: ScreenType.chauffuer),
                        pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                ),
                SizedBox(height: 40),
                BookingSelection(
                  image: "images/luxury_party.png",
                  title: "Luxury Party Vehicles",
                  onTap: () {
                    launchScreen(
                      context,
                      VehicleTypeScreen(),
                      pageRouteAnimation: PageRouteAnimation.Slide,
                    );
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
