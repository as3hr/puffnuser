import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/car_detail_screen.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/controllers/luxury_party_controller.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LuxuryPartyController>(builder: (controller) {
      final vehicles =
          controller.isLoading ? [] : controller.serviceDetail.vehicles ?? [];
      return Scaffold(
        body: SafeArea(
          child: controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    // Full-screen image
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/map.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Color(0xff122981).withOpacity(0.5),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                    ),

                    // Share button
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Where to?',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    icon:
                                        Icon(Icons.search, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // SizedBox(height: MediaQuery.of(context).size.height * 0.40),
                            BottomSheet(
                              showDragHandle: true,
                              enableDrag: false,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
                              ),
                              backgroundColor: Colors.white,
                              onClosing: () {},
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          'Featured Events',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: const DecorationImage(
                                            image:
                                                AssetImage('images/cigar.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 16,
                                              bottom: 16,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Ready for a\nPuffin Ride?',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      'Book Now →',
                                                      style: TextStyle(
                                                          color: Colors.yellow),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Text(
                                          'Vehicles Selection',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          itemCount: vehicles.length,
                                          itemBuilder: (context, index) {
                                            final vehicle = vehicles[index];
                                            return GestureDetector(
                                              onTap: () {
                                                launchScreen(
                                                  context,
                                                  CarDetailsScreen(
                                                      vehicle: vehicle),
                                                  pageRouteAnimation:
                                                      PageRouteAnimation.Slide,
                                                );
                                              },
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 16),
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color(0xff122981),
                                                          Color(0xff222221),
                                                        ],
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          vehicle.name ?? "",
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xffFFDF5A),
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 2),
                                                        Text(
                                                          'Premium ${index + 1}',
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: -10,
                                                    left: 0,
                                                    right: 0,
                                                    child: Image.asset(
                                                      "images/bentley.png",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 80,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
