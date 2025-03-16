import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/capacity_screen.dart';

import '../../../../../components/selection_screen.dart';
import '../../../../../utils/Extensions/app_common.dart';

class AmenitiesScreen extends StatelessWidget {
  const AmenitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionScreen(
      title: 'Amenities:',
      onContinue: () {
        launchScreen(
          context,
          CapacityScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide,
        );
      },
      selectionType: SelectionType.checkbox,
      allowMultiple: true,
      options: [
        SelectionOption(id: 'strip_pole', label: 'Strip Pole'),
        SelectionOption(id: 'dance_floor', label: 'Dance Floor'),
        SelectionOption(id: 'disco_lights', label: 'Disco Lights'),
        SelectionOption(id: 'tv_screens', label: 'TV Screens'),
        SelectionOption(id: 'karaoke', label: 'Karaoke System'),
        SelectionOption(id: 'leather', label: 'Leather Seats'),
        SelectionOption(id: 'wifi', label: 'Wi-Fi'),
        SelectionOption(id: 'bar', label: 'Bar'),
        SelectionOption(id: 'smoke', label: 'Smoke Friendly'),
        SelectionOption(id: 'led', label: 'LED Light'),
        SelectionOption(id: 'aroma', label: 'Aroma Therapy'),
      ],
      onSelectionChanged: (options) {},
    );
  }
}
