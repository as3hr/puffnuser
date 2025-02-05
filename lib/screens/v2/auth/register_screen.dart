import 'package:flutter/material.dart';
import 'package:taxi_booking/components/v2/submission_button.dart';
import 'package:taxi_booking/screens/v2/auth/verify_email.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create your free account',
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
            const SizedBox(height: 24),
            _buildTextField(
              'Full Name',
              true,
              context,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Email Address',
              true,
              context,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              'Phone Number',
              true,
              context,
            ),
            const SizedBox(height: 16),
            _buildTextField('Password', true, context, isPassword: true),
            const SizedBox(height: 16),
            _buildTextField('Confirm Password', true, context,
                isPassword: true),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'By registering, I understand the ',
                  style: TextStyle(
                    color: const Color(0xFF717171),
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: const Color(0xFF8555AE),
                    fontSize: 12,
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
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: const Color(0xFF8555AE),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SubmissionButton(
              onTap: () {
                launchScreen(
                  context,
                  VerifyEmail(),
                  isNewTask: true,
                  pageRouteAnimation: PageRouteAnimation.Slide,
                );
              },
              text: "Continue",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, bool isRequired, BuildContext context,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: const Color(0xFF717171),
                    fontSize: 14,
                  ),
                ),
                if (isRequired)
                  Text(
                    ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF717171).withOpacity(0.2),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF717171).withOpacity(0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: const Color(0xFF8555AE),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
