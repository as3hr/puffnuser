import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/components/user_avatars.dart';
import 'package:taxi_booking/screens/main/book_ride/events/components/app_notification_screen.dart';
import 'package:taxi_booking/screens/main/book_ride/events/components/event_detail_screen.dart';

import '../../../../models/category_model.dart';
import '../../../../models/event_model.dart';
import '../../../../utils/Extensions/app_common.dart';
import 'event_controller.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        foregroundColor: Colors.white,
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
                'Karachi',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              launchScreen(context, AppNotificationScreen(),
                  pageRouteAnimation: PageRouteAnimation.Slide);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset("images/notification.png"),
            ),
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
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
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

                GetBuilder(
                    init: EventController(),
                    builder: (controller) {
                      return controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              children: [
                                // Category Chips
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        _buildChip(
                                          'All',
                                          controller.selectedCategoryIndex
                                                  .value ==
                                              0,
                                          onTap: () {
                                            controller.selectCategory(0);
                                          },
                                        ),
                                        ...controller.categories
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          int idx = entry.key + 1;
                                          CategoryModel category = entry.value;
                                          return _buildChip(
                                            category.title,
                                            controller.selectedCategoryIndex
                                                    .value ==
                                                idx,
                                            onTap: () {
                                              print(
                                                  'Selected category: ${category.title}');
                                              controller.selectCategory(idx);
                                            },
                                          );
                                        }).toList(),
                                      ],
                                    )),

                                SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      ...?controller.serviceDetail.nearbyEvents
                                          ?.map((event) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(
                                                      () => EventDetailsScreen(
                                                        event: event,
                                                      ),
                                                    );
                                                  },
                                                  child: _buildEventCard(event),
                                                ),
                                              )),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 20),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...?controller
                                          .serviceDetail.featuredEvents
                                          ?.map((event) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: _buildPopularEventCard(
                                                      event),
                                                ),
                                              )),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected, {VoidCallback? onTap}) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Chip(
          label: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
          backgroundColor: isSelected ? Color(0xFFAB29FF) : Colors.white,
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }

  Widget _buildEventCard(EventModel event) {
    return Card(
      elevation: 5,
      child: Container(
        width: 300,
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
          border: Border.all(color: Color(0xFF81A0B4)),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                '${event.image}',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('images/event.png',
                      height: 150, fit: BoxFit.cover);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title ?? 'No Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey, size: 16),
                      SizedBox(width: 2),
                      Text(
                        event.startDate ?? 'No Date',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.access_time, color: Colors.grey, size: 16),
                      SizedBox(width: 2),
                      Text(
                        event.startTime?.substring(0, 5) ?? 'No Time',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      UserAvatars(),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFAB29FF)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          "\$${event.ticket?.price ?? 0}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularEventCard(EventModel event) {
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
                child: Image.network(
                  '${event.image}',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('images/luxury.png',
                        height: 200, fit: BoxFit.cover);
                  },
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.title ?? 'No Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  event.description ?? 'No Description',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Text(
                              //   '\$${event.ticket?.price ?? 0}',
                              //   style: TextStyle(
                              //     color: Color(0xFFAB29FF),
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 20,
                              //   ),
                              // ),
                              Text(
                                event.startDate ?? 'No Date',
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
