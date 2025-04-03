import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/controllers/luxury_party_controller.dart';
import 'package:taxi_booking/utils/Extensions/app_common.dart';
import '../../../../../components/selection_screen.dart';
import '../../../bottom_screen.dart';

class NeedsScreen extends StatelessWidget {
  const NeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LuxuryPartyController>(builder: (controller) {
      return SelectionScreen(
        title: 'Do you need?',
        selectionType: SelectionType.chip,
        allowMultiple: true,
        onContinue: () {
          controller.getServiceDetail();
          launchScreen(
            context,
            BottomScreen(screenType: BookingScreenType.luxuryParty),
            pageRouteAnimation: PageRouteAnimation.Slide,
          );
        },
        options: [
          SelectionOption(id: 'snacks', label: 'Snacks'),
          SelectionOption(id: 'merch', label: 'Merch'),
          SelectionOption(id: 'drinks', label: 'Drinks'),
        ],
        onSelectionChanged: (options) {},
      );
    });
  }
}
