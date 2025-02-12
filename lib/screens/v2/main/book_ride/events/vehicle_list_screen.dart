import 'package:flutter/material.dart';

import 'vehicle_details_screen.dart';

class VehicleListScreen extends StatelessWidget {
  const VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16.0),
          child: const Text(
            'Select Vehicles',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 200,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Passengers',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Suitcases',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'All Vehicles',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Filter Buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Text('Passengers'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Text('Suitcases'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: const Text('All Vehicles'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Vehicle Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return VehicleCard(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VehicleDetailsScreen(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final VoidCallback onTap;

  const VehicleCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff122981),
              Color(0xff222221),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Image.asset(
                  "images/mercedes.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mercedes-Benz S600',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '\$150.75',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 25,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffD1D1D1)),
                        onPressed: onTap,
                        child: Text(
                          'Select',
                          style: TextStyle(color: Color(0xff514D4D)),
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
    );
  }
}
