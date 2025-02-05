import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/booking.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

import '../../../components/v2/submission_button.dart';

class PhoneSignIn extends StatelessWidget {
  const PhoneSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Insert phone number to sign in',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(
                fontSize: 14,
                color: const Color(0xFF717171),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF717171).withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    // width: 50,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: const Color(0xFF717171).withOpacity(0.2),
                        ),
                      ),
                    ),
                    child: CountryCodePicker(
                      initialSelection: 'US',
                      favorite: const ['US'],
                      showCountryOnly: true,
                      hideMainText: true,
                      alignLeft: false,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        hintText: "Enter your phone number here",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'By signing in, I understand the ',
                  style: TextStyle(
                    color: const Color(0xFF717171),
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: const Color(0xFF8555AE),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'and ',
                  style: TextStyle(
                    color: const Color(0xFF717171),
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: const Color(0xFF8555AE),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Spacer(),
            SubmissionButton(
              onTap: () {
                launchScreen(
                  context,
                  Booking(),
                  isNewTask: true,
                  pageRouteAnimation: PageRouteAnimation.Slide,
                );
              },
              text: "Continue",
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
