import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/auth/social_screen.dart';

import '../../../../main.dart';
import '../../../../utils/Common.dart';
import '../../../../utils/Constants.dart';
import '../../../../utils/Extensions/app_common.dart';
import '../../../components/v2/next_button.dart';
import '../../../model/WalkThroughModel.dart';
import '../../../utils/images.dart';

class WalkThroughScreen extends StatefulWidget {
  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<WalkThroughModel> walkThroughClass = [
    WalkThroughModel(
      name: walkthrough_title_1,
      text: walkthrough_subtitle_1,
      img: walkthrough_image_1,
    ),
    WalkThroughModel(
      name: walkthrough_title_2,
      text: walkthrough_subtitle_2,
      img: ic_walk2,
    ),
    WalkThroughModel(
      name: walkthrough_title_3,
      text: walkthrough_subtitle_3,
      img: walkthrough_image_3,
    )
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: walkThroughClass.length,
            controller: pageController,
            itemBuilder: (context, i) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    walkThroughClass[i].img.toString(),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(0xff2F2C30BD).withOpacity(0.6),
                        Colors.black.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                ],
              );
            },
            onPageChanged: (int i) {
              currentPage = i;
              setState(() {});
            },
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Column(
              children: [
                dotIndicator(walkThroughClass, currentPage),
                SizedBox(height: 32),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(walkThroughClass[currentPage].name!,
                        style: boldTextStyle(size: 32, color: Colors.white),
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text(walkThroughClass[currentPage].text.toString(),
                        style:
                            secondaryTextStyle(size: 14, color: Colors.white),
                        textAlign: TextAlign.center),
                  ],
                ),
                SizedBox(height: 28),
                NextButton(
                    text: "Book Now",
                    onPressed: () {
                      if (currentPage.toInt() >= 2) {
                        launchScreen(context, SocialScreen(), isNewTask: true);
                        sharedPref.setBool(IS_FIRST_TIME, false);
                      } else {
                        pageController.nextPage(
                            duration: Duration(seconds: 1),
                            curve: Curves.linearToEaseOut);
                      }
                    }),
                SizedBox(height: 28),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: TextButton(
              onPressed: () {
                launchScreen(context, SocialScreen(), isNewTask: true);
                sharedPref.setBool(IS_FIRST_TIME, false);
              },
              child: Text(language.skip,
                  style: boldTextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
