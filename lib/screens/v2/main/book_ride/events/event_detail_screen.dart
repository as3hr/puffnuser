import 'package:flutter/material.dart';
import 'package:taxi_booking/components/v2/user_avatars.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/events/ticket_selection_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen image
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/event_detail.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),

          // Share button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Smoke-Friendly Night Ride 2024',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),

                        // Date and time chip
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF192B85),
                                Color(0xFF9D48CE),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              UserAvatars(),
                              Spacer(),
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.white),
                              SizedBox(width: 2),
                              Text(
                                'Nov 10 2024',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.access_time,
                                  size: 16, color: Colors.white),
                              SizedBox(width: 2),
                              Text(
                                '08:00 PM',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // About section
                        Text(
                          'About this event:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur. Adipiscing eu etiam ut non luctus cursus. Magna tincidunt vulputate nullam aliquet hendrerit volutpat. Et viverra ipsum in sed ornare vitae urna vel id...',
                          style: TextStyle(
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'see more',
                            style: TextStyle(color: Color(0xFFAB29FF)),
                          ),
                        ),

                        SizedBox(height: 24),

                        // Location section
                        Text(
                          'Location:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'images/location_map.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('See Location'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        launchScreen(
                                            context, TicketSelectionScreen(),
                                            pageRouteAnimation:
                                                PageRouteAnimation.Slide);
                                      },
                                      child: Text(
                                        'Buy Now',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF122981),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
