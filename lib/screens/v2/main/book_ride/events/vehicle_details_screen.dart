import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/chauffuer/chauffuer_booking.dart';

class VehicleDetailsScreen extends StatelessWidget {
  const VehicleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/vehicle_detail.png",
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Vehicle Title and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'BMW 840i',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '4.9',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {},
                            child: const Text('500 Reviews'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Location and Details
                  const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.black),
                      Text('Kaliwiro City'),
                      SizedBox(width: 16),
                      Icon(Icons.person, color: Colors.black),
                      Text('4'),
                      SizedBox(width: 16),
                      Icon(Icons.settings, color: Colors.black),
                      Text('Manual'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                  const SizedBox(height: 16),
                  // Map
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset("images/location_map.png"),
                  ),
                  const SizedBox(height: 16),
                  // Reviews
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage('https://picsum.photos/50'),
                    ),
                    title: const Text(
                      'Mark Campbell',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      'It\'s a long established fact that a reader will be distracted by the readable content',
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('110 reviews'),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$254.00',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChauffeurBookingScreen(),
                  ),
                );
              },
              child: const Text(
                'Select',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
