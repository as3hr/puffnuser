import 'dart:math';
import 'package:flutter/material.dart';

class AppNotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    "Your ride has been confirmed!",
    "Your driver is on the way!",
    "Ride completed successfully. Rate your driver!",
    "Your scheduled ride is arriving soon!",
    "A driver has been assigned to your ride.",
    "Surge pricing is active in your area.",
    "New promo available! Get 10% off your next ride.",
    "Your driver has arrived at the pickup location.",
  ];

  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF122981),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index) {
          String notification =
              notifications[_random.nextInt(notifications.length)];
          return Card(
            elevation: 3,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: Color(0xFF122981),
              ),
              title: Text(
                notification,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "${_random.nextInt(60)} min ago",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          );
        },
      ),
    );
  }
}
