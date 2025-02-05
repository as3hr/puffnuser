import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/luxury_party/car_details/needs_screen.dart';
import '../../../../../../components/v2/selection_screen.dart';
import '../../../../../../utils/Extensions/app_common.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionScreen(
      title: 'Availability:',
      onContinue: () {
        launchScreen(
          context,
          NeedsScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide,
        );
      },
      selectionType: SelectionType.chip,
      options: [
        SelectionOption(id: 'today', label: 'Available Today'),
        SelectionOption(id: 'weekend', label: 'Available This Weekend'),
        SelectionOption(id: 'specific', label: 'Available on Specific Date'),
      ],
      onSelectionChanged: (options) {
        // Handle selection
      },
    );
  }
}
