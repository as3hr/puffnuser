import 'package:get/get.dart';

import '../../../../../data/service_repository/service_repository.dart';
import '../../../../../data/vehicle_repository/vehicle_repository.dart';
import '../../../../../models/amenties_model.dart';
import '../../../../../models/vehicle_type_model.dart';
import '../../booking_controller.dart';

class LuxuryPartyController extends GetxController {
  final serviceRepository = ServiceRepository();
  final vehicleRepository = VehicleRepository();
  RxList<AmenitiesModel> amenities = <AmenitiesModel>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  List<VehicleTypeModel> vehicleTypes = [];
  bool isLoading = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAmenities();
    await getVehicleTypes();
  }

  Future<void> getAmenities() async {
    try {
      isLoading = true;
      update();
      final serviceId = Get.find<BookingController>().selectedServiceId;
      final serviceDetail =
          await serviceRepository.getServiceById(id: serviceId);
      if (serviceDetail.amenities != null) {
        amenities.assignAll(serviceDetail.amenities!);
        update();
      }
    } catch (e) {
      print('Error fetching amenities: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  bool isSelected(String amenityId) {
    return selectedAmenities.contains(amenityId);
  }

  void toggleSelection(String amenityId) {
    if (isSelected(amenityId)) {
      selectedAmenities.remove(amenityId);
    } else {
      selectedAmenities.add(amenityId);
    }
    update();
  }

  Future<void> getVehicleTypes() async {
    isLoading = true;
    update();
    vehicleTypes = await vehicleRepository.getVehicleTypes();
    print("in controller: ${vehicleTypes}");
    isLoading = false;
    update();
  }
}
