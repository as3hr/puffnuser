import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/components/submission_button.dart';
import 'package:taxi_booking/screens/auth/register/register_controller.dart';
import 'package:collection/collection.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Verify your email address',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We have sent you 5 - digit verification code at',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF717171),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.otpValues.mapIndexed(
                    (index, value) {
                      return Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (value) {
                              if (value.length == 1) {
                                controller.otpValues[index] = value;
                                if (index == controller.otpValues.length - 1) {
                                  controller.verifyOtp();
                                } else {
                                  FocusScope.of(context).nextFocus();
                                }
                              }
                            },
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 50),
                SubmissionButton(
                  onTap: () {
                    controller.verifyOtp();
                  },
                  text: "Continue",
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t receive the code? ',
                      style: TextStyle(
                        color: const Color(0xFF717171),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Resend here',
                      style: TextStyle(
                        color: const Color(0xFF8555AE),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
