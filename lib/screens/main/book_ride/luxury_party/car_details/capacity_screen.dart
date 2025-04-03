import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/availability_screen.dart';

import '../../../../../components/selection_screen.dart';
import '../../../../../utils/Extensions/app_common.dart';
import '../controllers/luxury_party_controller.dart';

class CapacityScreen extends StatelessWidget {
  const CapacityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LuxuryPartyController>(builder: (controller) {
      return SelectionScreen(
        title: 'Capacity:',
        selectionType: SelectionType.chip,
        onContinue: () {
          launchScreen(
            context,
            AvailabilityScreen(),
            pageRouteAnimation: PageRouteAnimation.Slide,
          );
        },
        options: [
          SelectionOption(id: '2-4', label: '2-4 Passengers'),
          SelectionOption(id: '5-8', label: '5-8 Passengers'),
          SelectionOption(id: '9-15', label: '9-15 Passengers'),
          SelectionOption(id: '16-20', label: '16-20 Passengers'),
          SelectionOption(id: '21+', label: '21+ Passengers'),
        ],
        onSelectionChanged: (options) {
          final id =
              options.firstWhereOrNull((option) => option.selected)?.id ?? "";
          controller.selectedPassengers = id;
        },
      );
    });
  }
}
