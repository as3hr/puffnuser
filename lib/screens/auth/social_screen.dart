import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/auth/login/login_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';
import '../../components/submission_button.dart';
import 'register/register_screen.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/welcome_image_car.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome to PuffnRide',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Your Ultimate Smoke-Friendly Ride\nExperience',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SubmissionButton(
                onTap: () {
                  launchScreen(
                    context,
                    LoginScreen(),
                  );
                },
                text: 'Sign in',
              ),
              // const SizedBox(height: 24),
              // const Text(
              //   'or continue with',
              //   style: TextStyle(
              //     color: Colors.black54,
              //     fontSize: 14,
              //   ),
              // ),
              const SizedBox(height: 24),
              // _buildSocialButton(
              //   'Continue With Google',
              //   'images/ic_google.png',
              //   onPressed: () {},
              // ),
              // const SizedBox(height: 12),
              // _buildSocialButton(
              //   'Continue With Apple',
              //   'images/ic_apple.png',
              //   onPressed: () {},
              // ),
              // const SizedBox(height: 12),
              // _buildSocialButton(
              //   'Continue With Facebook',
              //   'images/ic_facebook.png',
              //   onPressed: () {},
              // ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchScreen(context, RegisterationScreen());
                    },
                    child: const Text(
                      'Create here',
                      style: TextStyle(
                        color: Color(0xFF5B39A5),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    String text,
    String iconPath, {
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        elevation: 0,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              iconPath,
              height: 24,
              width: 24,
            ),
          ),
          Spacer(),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
