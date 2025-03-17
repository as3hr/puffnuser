import 'package:get/get.dart';

import '../../../data/service_repository/service_repository.dart';
import '../../../models/service_model.dart';
import '../bottom_screen.dart';
import 'luxury_party/car_details/vehicle_type_screen.dart';

class BookingController extends GetxController {
  List<ServiceModel> services = [];
  bool isLoading = false;
  final serviceRepository = ServiceRepository();
  List<String> images = [
    "images/event_booking.png",
    "images/chauffuer.png",
    "images/luxury_party.png"
  ];

  List<Function> onTap = [
    () {
      Get.to(
        () => BottomScreen(screenType: BookingScreenType.event),
      );
    },
    () {
      Get.to(
        () => BottomScreen(screenType: BookingScreenType.chauffuer),
      );
    },
    () {
      Get.to(
        () => VehicleTypeScreen(),
      );
    },
  ];
  late int selectedServiceId;

  void selectServiceId(int id) {
    selectedServiceId = id;
    update();
  }

  @override
  void onInit() {
    getServices();
    super.onInit();
  }

  void getServices() async {
    isLoading = true;
    update();
    services = await serviceRepository.getServices();
    isLoading = false;
    update();
  }
}
