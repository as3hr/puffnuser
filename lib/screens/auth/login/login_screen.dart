import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:taxi_booking/components/input_field.dart';
import 'package:taxi_booking/components/submission_button.dart';
import 'package:taxi_booking/screens/auth/login/login_controller.dart';
import 'package:taxi_booking/screens/auth/register/register_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
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
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign In',
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
                      const SizedBox(height: 100),
                      InputField(
                        label: 'Email',
                        isRequired: true,
                        onChanged: (value) {
                          controller.email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        label: 'Password',
                        isRequired: true,
                        onChanged: (value) {
                          controller.password = value;
                        },
                        isPassword: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Dont Have an Account? ',
                            style: TextStyle(
                              color: const Color(0xFF717171),
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchScreen(
                                context,
                                RegisterationScreen(),
                                isNewTask: true,
                                pageRouteAnimation: PageRouteAnimation.Slide,
                              );
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: const Color(0xFF8555AE),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      SubmissionButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                        text: "Continue",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
