import 'package:taxi_booking/main.dart';
import 'package:taxi_booking/screens/auth/login/login_screen.dart';
import 'package:taxi_booking/screens/main/book_ride/booking.dart';
import 'package:taxi_booking/utils/Constants.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import '../intro/WalkThroughtScreen.dart';
import '../../../utils/Colors.dart';
import '../../../utils/Extensions/app_common.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset('images/splash_video.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.play();
        _controller.setLooping(false);
        _controller.addListener(() {
          if (_controller.value.position == _controller.value.duration) {
            init();
          }
        });
      }).catchError((e) {
        print("Error: $e");
        init();
      });
  }

  void init() {
    final token = appStorage.read(tokenKey);
    final initialized = appStorage.read(initializedKey);
    if (token != null && initialized != null) {
      launchScreen(context, BookingScreen(), isNewTask: true);
    } else if (token == null && initialized != null) {
      launchScreen(context, LoginScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    } else {
      launchScreen(context, WalkThroughScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          init();
        },
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: _isVideoInitialized
                    ? FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Container(),
              ),
              // Removed logo and text section
            ],
          ),
        ),
      ),
    );
  }
}
