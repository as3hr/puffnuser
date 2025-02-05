import 'package:flutter/material.dart';
import 'package:taxi_booking/components/v2/user_avatars.dart';
import 'package:taxi_booking/screens/v2/main/dashboard/events/event_detail_screen.dart';

import '../../../../utils/Extensions/app_common.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current Location',
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 15,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                'New Yourk, USA',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ),
        leading: Image.asset("images/menu.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset("images/notification.png"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Card
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFAB29FF),
                        Color(0xFF122981),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ready for a\nPUFFNRIDE?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.asset('images/puffnride.png'),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search events, puff n..',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Category Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildChip('All', true),
                      _buildChip('Music', false),
                      _buildChip('Festival', false),
                      _buildChip('Sport', false),
                      _buildChip('Movie', false),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Nearby Car Events Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby Car Events',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFAB29FF),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Event Cards Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            launchScreen(context, EventDetailsScreen(),
                                pageRouteAnimation: PageRouteAnimation.Slide);
                          },
                          child: _buildEventCard()),
                      SizedBox(width: 16),
                      GestureDetector(
                          onTap: () {
                            launchScreen(context, EventDetailsScreen(),
                                pageRouteAnimation: PageRouteAnimation.Slide);
                          },
                          child: _buildEventCard()),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Popular Now Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Now',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFAB29FF),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // Popular Event Card
                _buildPopularEventCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
        backgroundColor: isSelected ? Color(0xFFAB29FF) : Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }

  Widget _buildEventCard() {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Color(0xffEBE4FF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              'images/event.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Smoke-Friendly Night Ride',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Text(
                      'Nov 10 2024',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(width: 2),
                    Text(
                      '08.00 PM',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    UserAvatars(),
                    Spacer(),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFAB29FF)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(4),
                      child: Center(
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularEventCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.asset(
                  'images/luxury.png',
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: UserAvatars(),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Color(0xffD813C4).withOpacity(0.4),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Luxury Party Night',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Lorem ipsum dolor sit\namet consectetur.",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$20',
                                style: TextStyle(
                                  color: Color(0xFFAB29FF),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'November 7 2024',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
