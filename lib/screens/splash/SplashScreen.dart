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
          print("Status: ${_controller.value}");
          if (_controller.value.position == _controller.value.duration) {
            init();
          }
        });
      }).catchError((e) {
        print("Error: $e");
        init();
      });
  }

  void init() async {
    // if (sharedPref.getBool(IS_FIRST_TIME) ?? true) {
    launchScreen(context, WalkThroughScreen(),
        pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);

    // await Geolocator.requestPermission().then((value) async {
    //   await Geolocator.getCurrentPosition().then((value) {
    //     sharedPref.setDouble(LATITUDE, value.latitude);
    //     sharedPref.setDouble(LONGITUDE, value.longitude);
    //     launchScreen(context, WalkThroughScreen(),
    //         pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    //   });
    // }).catchError((e) {
    //   launchScreen(context, WalkThroughScreen(),
    //       pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    // });
    // } else {
    //   if (!appStore.isLoggedIn) {
    //     launchScreen(context, SocialScreen(),
    //         pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
    //   } else {
    //     if (sharedPref.getString(CONTACT_NUMBER).validate().isEmptyOrNull) {
    //       launchScreen(context, EditProfileScreen(isGoogle: true),
    //           isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
    //     } else {
    //       if (await checkPermission())
    //         await Geolocator.requestPermission().then((value) async {
    //           await Geolocator.getCurrentPosition().then((value) {
    //             sharedPref.setDouble(LATITUDE, value.latitude);
    //             sharedPref.setDouble(LONGITUDE, value.longitude);
    //             launchScreen(context, DashBoardScreen(),
    //                 pageRouteAnimation: PageRouteAnimation.Slide,
    //                 isNewTask: true);
    //           });
    //         }).catchError((e) {
    //           launchScreen(context, DashBoardScreen(),
    //               pageRouteAnimation: PageRouteAnimation.Slide,
    //               isNewTask: true);
    //         });
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          launchScreen(context, WalkThroughScreen(),
              pageRouteAnimation: PageRouteAnimation.Slide, isNewTask: true);
        },
        child: Center(
          child: Stack(
            children: [
              // Video player as background
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
