import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/v2/main/book_ride/luxury_party/navigation_screen.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';
import '../../../../../../components/v2/selection_screen.dart';

class NeedsScreen extends StatelessWidget {
  const NeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionScreen(
      title: 'Do you need?',
      selectionType: SelectionType.chip,
      allowMultiple: true,
      onContinue: () {
        launchScreen(
          context,
          NavigationScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide,
        );
      },
      options: [
        SelectionOption(id: 'snacks', label: 'Snacks'),
        SelectionOption(id: 'merch', label: 'Merch'),
        SelectionOption(id: 'drinks', label: 'Drinks'),
      ],
      onSelectionChanged: (options) {
        // Handle selection
      },
    );
  }
}
