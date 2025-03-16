import 'package:flutter/material.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

import '../events/payment_screen.dart';

class ChauffeurBookingScreen extends StatelessWidget {
  const ChauffeurBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Chauffeur Booking',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/chauffeur_booking.png',
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 32),
            _buildInputField(
              label: 'Pickup Location',
              hint: 'Enter pickup location',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: 'Drop-off Location',
              hint: 'Enter pickup location',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: 'Pickup Date',
              hint: 'Add Pickup Date',
              icon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              label: 'Pickup Time',
              hint: 'Add Pickup Time',
              icon: Icons.access_time_outlined,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  launchScreen(
                    context,
                    PaymentScreenEvents(),
                    pageRouteAnimation: PageRouteAnimation.Slide,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF462FAB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.grey[600],
                size: 20,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
