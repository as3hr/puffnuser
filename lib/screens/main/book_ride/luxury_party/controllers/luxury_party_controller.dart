import 'package:get/get.dart';

import '../../../../../data/service_repository/service_repository.dart';
import '../../../../../data/vehicle_repository/vehicle_repository.dart';
import '../../../../../models/amenties_model.dart';
import '../../../../../models/service_detail_model.dart';
import '../../../../../models/vehicle_type_model.dart';
import '../../../../../utils/helpers.dart';
import '../../booking_controller.dart';

class LuxuryPartyController extends GetxController {
  // repos
  final serviceRepository = ServiceRepository();
  final vehicleRepository = VehicleRepository();

  // data/variables
  late ServiceDetailModel serviceDetail;
  RxList<AmenitiesModel> amenities = <AmenitiesModel>[].obs;
  List<VehicleTypeModel> vehicleTypes = [];
  bool isLoading = false;

  // filters
  String selectedVehicleType = "";
  String selectedAvailability = "";
  String selectedPassengers = "";
  String selectedDate = "";
  List<String> selectedAmenities = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAmenities();
    await getVehicleTypes();
  }

  void getServiceDetail() async {
    isLoading = true;
    update();
    final serviceId = Get.find<BookingController>().selectedServiceId;
    serviceDetail = await serviceRepository.getServiceById(
      id: serviceId,
      extraQuery: {
        "amenities": selectedAmenities,
        "vehicle_type_id": selectedVehicleType,
        "vehicle_availability": selectedAvailability,
        "date": selectedDate,
        "passengers": selectedPassengers.contains("-")
            ? selectedPassengers.replaceFirst("-", ",")
            : selectedPassengers,
      },
    );
    isLoading = false;
    update();
  }

  Future<void> selectSpecificDate() async {
    final date = await selectDate(Get.context!);
    if (date != null) {
      selectedDate = date;
    }
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
