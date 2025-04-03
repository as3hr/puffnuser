import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/ameneties_screen.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/controllers/luxury_party_controller.dart';

import '../../../../../components/selection_screen.dart';
import 'package:collection/collection.dart';

class VehicleTypeScreen extends StatelessWidget {
  const VehicleTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LuxuryPartyController>(
          init: LuxuryPartyController(),
          builder: (controller) {
            return controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SelectionScreen(
                    title: 'Vehicle Type:',
                    selectionType: SelectionType.radio,
                    options: controller.vehicleTypes
                        .mapIndexed((index, vehicleType) {
                      return SelectionOption(
                          id: vehicleType.id?.toString() ?? "",
                          label: vehicleType.name ?? "");
                    }).toList(),
                    onContinue: () {
                      if (controller.vehicleTypes.isNotEmpty) {
                        Get.to(() => AmenitiesScreen());
                      } else {
                        Get.snackbar("Error", "Please select a vehicle type");
                      }
                    },
                    onSelectionChanged: (options) {
                      final selectedOption =
                          options.firstWhere((element) => element.selected);
                      controller.selectedVehicleType = selectedOption.id;
                    },
                  );
          }),
    );
  }
}
