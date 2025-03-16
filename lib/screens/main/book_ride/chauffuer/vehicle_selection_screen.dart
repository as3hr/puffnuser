import 'package:flutter/material.dart';

import 'location_search_screen.dart';

class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Choose a vehicle',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVehicleCard(),
              const SizedBox(height: 24),
              _buildCarSelection(),
              const SizedBox(height: 24),
              _buildContinueButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVehicleCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff212D8A), Color(0xff9346C8)]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              'Business Class',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: const Text(
              'Mercedes-Benz E-Class or similar',
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            // child: Image.network(
            //   'https://bluesky-cogcms-prodb.cdn.imgeng.in/media/23kcymvw/mercedes-amg-gt-c192-stage-3840x3840-07-2023.jpg',
            //   width: double.infinity,
            //   height: 160,
            //   fit: BoxFit.cover,
            // ),
            child: Image.asset(
              'images/vehicle.png',
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          _buildFeatureList(),
        ],
      ),
    );
  }

  Widget _buildFeatureList() {
    final List<String> features = [
      'Free cancellation up until 1 hour before pickup',
      'Meet & greet service',
      'Complimentary bottle of water',
      'Complimentary Wi-Fi in vehicles',
      'Trained and verified drivers',
      'Advanced and first-class categories'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.white, size: 16),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        feature,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCarSelection() {
    final List<String> carNames = [
      '6,841.40 USD',
      '5,841.40 USD',
      '5,168.40 USD'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(carNames.length, (index) {
          return _buildCarOption(carNames[index]);
        }),
      ),
    );
  }

  Widget _buildCarOption(String price) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Image.network(
          //   'https://bluesky-cogcms-prodb.cdn.imgeng.in/media/23kcymvw/mercedes-amg-gt-c192-stage-3840x3840-07-2023.jpg',
          //   width: 80,
          //   height: 50,
          //   fit: BoxFit.cover,
          // ),
          Image.asset(
            'images/vehicle.png',
            width: 80,
            height: 35,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LocationSearchScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff462FAB),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('Continue',
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
