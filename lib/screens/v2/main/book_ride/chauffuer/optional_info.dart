import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/payment_v2/payment_v2.dart';

import '../../../../../utils/Extensions/app_common.dart';

class OptionalInfoScreen extends StatelessWidget {
  const OptionalInfoScreen({Key? key}) : super(key: key);

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
          'Add optional info',
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
            _buildInputField(
              label: 'PICKUP SIGN',
              hint: 'Alexa parker',
              helperText: 'Name Or Text On The Pickup Sign',
            ),
            const SizedBox(height: 24),
            _buildInputField(
              label: 'NOTES FOR THE CHAUFFEUR',
              hint: '',
              helperText:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, nisi accusamus! Rerum placerat placeat vitae placeat. Illo laborum.\n\nDolor inventore tempora dolorem deserunt, dolore tempora. Natus nemo.\n\nDolor. Vitae harum excepturi illo omnis est.',
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            _buildInputField(
              label: 'BOOK FOR SOMEONE ELSE',
              hint: '',
            ),
            const SizedBox(height: 24),
            _buildInputField(
              label: 'REFERENCE NUMBER',
              hint: '',
              helperText:
                  'Lorem ipsum dolor sit amet consectetur. Vulputate ipsum tempus sit in.',
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                launchScreen(
                  context,
                  PaymentV2Screen(),
                  pageRouteAnimation: PageRouteAnimation.Slide,
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF462FAB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
    String? helperText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF462FAB),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 8),
          Text(
            helperText,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ],
    );
  }
}
