import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/luxury_party/ride_booking.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomSheet(
                showDragHandle: true,
                enableDrag: false,
                clipBehavior: Clip.antiAlias,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                backgroundColor: Colors.white,
                onClosing: () {},
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'BMW 840i',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View car details',
                            style: TextStyle(color: Colors.purple),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff564374),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.timelapse_rounded,
                                    color: Color(0xffA68AFA),
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '10 m away ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff564374),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xffA68AFA),
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '10:21 arrival',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            'images/bmw.png',
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xff010101).withOpacity(0.25),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                    ),
                                    title: const Text(
                                      'Mark Campbell',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: const Text(
                                      'Mark Campbell',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          '110 Reviews',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        RatingBar.builder(
                                          initialRating: 4.5,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 16,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Call Mark",
                                      style: TextStyle(
                                        color: Color(0xffBE81FF),
                                      ),
                                    ),
                                    Icon(
                                      Icons.call,
                                      color: Color(0xffBE81FF),
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Color(0xff462FAB),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '\$254.00',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    launchScreen(
                                      context,
                                      RideBookingScreen(),
                                      pageRouteAnimation:
                                          PageRouteAnimation.Slide,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: const Text(
                                    'Select',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
