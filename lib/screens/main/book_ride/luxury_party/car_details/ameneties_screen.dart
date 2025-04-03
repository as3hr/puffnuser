import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/capacity_screen.dart';
import '../../../../../components/selection_screen.dart';
import '../../../../../utils/Extensions/app_common.dart';
import '../controllers/luxury_party_controller.dart';

class AmenitiesScreen extends StatelessWidget {
  AmenitiesScreen({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LuxuryPartyController>(builder: (controller) {
        final options = controller.amenities
            .map((amenity) => SelectionOption(
                id: amenity.id.toString(),
                label: (amenity.name ?? '').toUpperCase(),
                selected: controller.selectedAmenities
                    .contains(amenity.id.toString())))
            .toList();

        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SelectionScreen(
                title: 'Amenities',
                selectionType: SelectionType.checkbox,
                allowMultiple: true,
                options: options,
                onSelectionChanged: (selectedOptions) {
                  controller.selectedAmenities.clear();
                  controller.selectedAmenities.addAll(selectedOptions
                      .where((option) => option.selected)
                      .map((option) => option.id)
                      .toList());
                  controller.update();
                },
                onContinue: () {
                  launchScreen(
                    context,
                    CapacityScreen(),
                    pageRouteAnimation: PageRouteAnimation.Slide,
                  );
                },
              );
      }),
    );
  }
}
