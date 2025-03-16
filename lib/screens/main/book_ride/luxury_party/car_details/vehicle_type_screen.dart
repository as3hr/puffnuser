import 'package:flutter/material.dart';
import 'package:taxi_booking/screens/main/book_ride/luxury_party/car_details/ameneties_screen.dart';

import '../../../../../components/selection_screen.dart';
import '../../../../../utils/Extensions/app_common.dart';

class VehicleTypeScreen extends StatelessWidget {
  const VehicleTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionScreen(
      title: 'Vehicle Type:',
      selectionType: SelectionType.radio,
      options: [
        SelectionOption(id: 'limousine', label: 'Limousine'),
        SelectionOption(id: 'party_bus', label: 'Party Bus'),
        SelectionOption(id: 'suv', label: 'SUV'),
        SelectionOption(id: 'convertible', label: 'Convertible'),
        SelectionOption(id: 'luxury_sedan', label: 'Luxury Sedan'),
        SelectionOption(id: 'vintage_car', label: 'Vintage Car'),
      ],
      onContinue: () {
        launchScreen(
          context,
          AmenitiesScreen(),
          pageRouteAnimation: PageRouteAnimation.Slide,
        );
      },
      onSelectionChanged: (options) {},
    );
  }
}
