import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/luxury_party/car_details/car_detail_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Full-screen image
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/map.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color(0xffF75CFF),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            icon: Icon(Icons.search, color: Colors.grey),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.40),
                    BottomSheet(
                      showDragHandle: true,
                      enableDrag: false,
                      clipBehavior: Clip.antiAlias,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      backgroundColor: Colors.white,
                      onClosing: () {},
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                    image: AssetImage('images/cigar.png'),
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
                                              fontWeight: FontWeight.bold,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          launchScreen(
                                            context,
                                            CarDetailsScreen(),
                                            pageRouteAnimation:
                                                PageRouteAnimation.Slide,
                                          );
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              width: 150,
                                              margin: const EdgeInsets.only(
                                                  right: 16),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    Color.fromARGB(
                                                        255, 207, 207, 130),
                                                    Color(0xFF122981),
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'limousine',
                                                    style: const TextStyle(
                                                      color: Color(0xffFFDF5A),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    'Premium ${index + 1}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              top: -80,
                                              left: 0,
                                              right: 0,
                                              child: Image.asset(
                                                  "images/ic_car.png"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
  }
}
