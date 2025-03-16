import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:taxi_booking/components/input_field.dart';
import 'package:taxi_booking/components/submission_button.dart';
import 'package:taxi_booking/screens/auth/login/login_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

import 'register_controller.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RegisterController(),
        builder: (controller) {
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
              child: Form(
                key: formKey,
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
                    InputField(
                      label: 'First Name',
                      isRequired: true,
                      onChanged: (value) {
                        controller.signUpUser.firstName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      label: 'Last Name',
                      isRequired: true,
                      onChanged: (value) {
                        controller.signUpUser.lastName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Last Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      label: 'User Name',
                      isRequired: true,
                      onChanged: (value) {
                        controller.signUpUser.userName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    InputField(
                      label: 'Email Address',
                      isRequired: true,
                      onChanged: (value) {
                        controller.signUpUser.email = value;
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
                      label: 'Phone Number',
                      isRequired: true,
                      onChanged: (value) {
                        controller.signUpUser.phoneNumber = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        if (!GetUtils.isPhoneNumber(value)) {
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
                        controller.signUpUser.password = value;
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
                    InputField(
                      label: 'Confirm Password',
                      isRequired: true,
                      onChanged: (value) {
                        controller.signUpUser.confirmPassword = value;
                      },
                      isPassword: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm password is required';
                        }
                        if (value != controller.signUpUser.password) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Already Have an Account? ',
                          style: TextStyle(
                            color: const Color(0xFF717171),
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launchScreen(
                              context,
                              LoginScreen(),
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
                    const SizedBox(height: 30),
                    SubmissionButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.register();
                        }
                      },
                      text: "Continue",
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
