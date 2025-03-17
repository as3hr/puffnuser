import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/main/book_ride/chauffuer/home_screen.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/navigation_screen.dart';
import 'package:taxi_booking/screens/main/history/history.dart';
import 'package:taxi_booking/screens/main/profile/profile.dart';

import 'book_ride/events/event_page.dart';

enum BookingScreenType {
  event,
  chauffuer,
  luxuryParty,
}

class BottomScreen extends StatefulWidget {
  const BottomScreen({
    super.key,
    required this.screenType,
  });
  final BookingScreenType screenType;

  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    switch (widget.screenType) {
      case BookingScreenType.event:
        _widgetOptions = [
          EventPage(),
          HomeScreen(),
          History(),
          Profile(),
        ];
        break;
      case BookingScreenType.chauffuer:
        _widgetOptions = [
          HomeScreen(),
          HomeScreen(),
          History(),
          Profile(),
        ];
        break;
      case BookingScreenType.luxuryParty:
        _widgetOptions = [
          NavigationScreen(),
          HomeScreen(),
          History(),
          Profile(),
        ];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions[_selectedIndex],
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 66,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xff462FAB),
                  borderRadius: BorderRadius.circular(19),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 17.1,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, "images/home.png", 'Home'),
                    _buildNavItem(1, "images/book_ride.png", 'Book a Ride'),
                    _buildNavItem(2, "images/view_history.png", 'View History'),
                    _buildNavItem(3, "images/profile.png", 'Profile Settings'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            color: isSelected ? Color(0xffBB29FF) : Colors.white,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontFamily: "Proxima Nova",
            ),
          ),
        ],
      ),
    );
  }
}
