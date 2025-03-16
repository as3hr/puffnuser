import 'package:flutter/material.dart';

import '../../../../components/ride_booking_dialog.dart';
import '../payment_v2/payment_v2.dart';

class RideBookingScreen extends StatefulWidget {
  const RideBookingScreen({super.key});

  @override
  State<RideBookingScreen> createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:
            const Text('Ride Booking', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Google Maps Image Placeholder
          Positioned.fill(
            top: 100,
            child: Image.asset(
              "images/map.png",
              fit: BoxFit.cover,
              color: Color(0xff122981).withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          Positioned(
            child: Image.asset(
              "images/ic_car.png",
              height: 30,
            ),
            top: 300,
            left: 50,
            right: 50,
          ),
          Positioned(
            child: Image.asset(
              "images/ic_car.png",
              height: 30,
            ),
            top: 200,
            right: 20,
          ),

          Positioned(
            child: Image.asset(
              "images/ic_car.png",
              height: 30,
            ),
            top: 250,
            left: 50,
          ),

          // Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.45, // Starts at 45% of screen height
            minChildSize: 0.45, // Minimum height when collapsed
            maxChildSize: 0.85, // Expandable up to 85% of screen height
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trip Type Selector
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTripTypeButton('One way', true),
                            _buildTripTypeButton('Round Trip', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Pickup Location
                      const Text(
                        'Pickup Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter pickup location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Drop-off Location
                      const Text(
                        'Drop-off Location',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter drop-off location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Fare Estimate",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // Date & Time Selection
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Base Price",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "Distance",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "45\$",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "2:52 AM",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              "50 Miles",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Estimate Price",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(width: 180),
                          Expanded(
                            child: Text(
                              "65\$",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {});
                            Future.delayed(const Duration(seconds: 2), () {
                              setState(() {});
                              showDialog(
                                context: context,
                                builder: (context) => RideBookedDialog(
                                    title: "Ride Accepted",
                                    message: "Your ride has been Accepted"),
                              ).then((_) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentV2Screen())));
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff462FAB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTripTypeButton(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
