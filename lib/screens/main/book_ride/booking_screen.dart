import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/components/booking_selection.dart';

import 'booking_controller.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BookingController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 50),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: controller.isLoading
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF192B85),
                            ),
                          ),
                        )
                      : controller.services.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  "No services available",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    // onTap: () {
                                    //   launchScreen(
                                    //       context, EventDetailsScreen(),
                                    //       pageRouteAnimation:
                                    //           PageRouteAnimation.Slide);
                                    // },
                                    child:
                                        Image.asset("images/girls_ride.png")),
                                SizedBox(height: 40),
                                ...controller.services
                                    .mapIndexed((index, service) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: BookingSelection(
                                      image: controller.images[index],
                                      title: service.title ?? "",
                                      onTap: () {
                                        controller
                                            .selectServiceId(service.id ?? 0);
                                        controller.onTap[index].call();
                                      },
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                ),
              ),
            ),
          );
        });
  }
}
