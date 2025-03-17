import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/data/auth_repository/auth_repository.dart';
import 'package:taxi_booking/screens/auth/social_screen.dart';
import 'package:taxi_booking/screens/main/profile/my_wallet_screen.dart';
import 'package:taxi_booking/screens/main/profile/profile_controller.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Column(
              children: [
                // Profile Header
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF9D48CE),
                        Color(0xFF192B85),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          '${controller.user.profileImage ?? ""}',
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (controller.user.firstName ?? "") +
                                (controller.user.lastName ?? ""),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            controller.user.username ?? "",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Quick Actions
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildQuickAction(Icons.headphones, 'Help'),
                      GestureDetector(
                          onTap: () {
                            launchScreen(
                              context,
                              MyWalletScreen(),
                              pageRouteAnimation: PageRouteAnimation.Slide,
                            );
                          },
                          child: _buildQuickAction(Icons.wallet, 'Wallet')),
                      _buildQuickAction(Icons.headphones, 'Activity'),
                    ],
                  ),
                ),

                // Menu Items
                Expanded(
                  child: ListView(
                    children: [
                      _buildMenuItem(Icons.location_city, 'City'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(Icons.family_restroom, 'Family'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(Icons.message, 'Message'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(Icons.security, 'Safety'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(Icons.drive_eta, 'Earn by driving'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(Icons.help, 'Help'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(Icons.support_agent, 'Support'),
                      Divider(
                        height: 0.5,
                      ),
                      _buildMenuItem(
                        Icons.logout,
                        'LogOut',
                        onTap: () async {
                          final _authRepository = AuthRepository();
                          await _authRepository.logout();
                          Get.offAll(() => SocialScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildQuickAction(IconData icon, String label) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFE4DFF4).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, {Function()? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}
