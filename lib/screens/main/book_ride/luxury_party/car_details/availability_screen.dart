import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/needs_screen.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/controllers/luxury_party_controller.dart';
import '../../../../../components/selection_screen.dart';
import '../../../../../utils/Extensions/app_common.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LuxuryPartyController>(builder: (controller) {
      return SelectionScreen(
        title: 'Availability:',
        onContinue: () async {
          if (controller.selectedAvailability.contains("specific_date")) {
            await controller.selectSpecificDate();
            if (controller.selectedDate.isNotEmpty)
              launchScreen(
                context,
                NeedsScreen(),
                pageRouteAnimation: PageRouteAnimation.Slide,
              );
          } else {
            launchScreen(
              context,
              NeedsScreen(),
              pageRouteAnimation: PageRouteAnimation.Slide,
            );
          }
        },
        selectionType: SelectionType.chip,
        options: [
          SelectionOption(id: 'today', label: 'Available Today'),
          SelectionOption(id: 'weekend', label: 'Available This Weekend'),
          SelectionOption(
              id: 'specific_date', label: 'Available on Specific Date'),
        ],
        onSelectionChanged: (options) {
          final id =
              options.firstWhereOrNull((option) => option.selected)?.id ?? "";
          controller.selectedAvailability = id;
        },
      );
    });
  }
}
