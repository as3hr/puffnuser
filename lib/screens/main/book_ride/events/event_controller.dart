import 'package:get/get.dart';
import 'package:taxi_booking/data/event_repository/event_repository..dart';
import 'package:taxi_booking/data/service_repository/service_repository.dart';
import 'package:taxi_booking/models/category_model.dart';
import 'package:taxi_booking/models/service_detail_model.dart';
import 'package:taxi_booking/screens/main/book_ride/booking_controller.dart';

import '../../../../models/event_model.dart';

class EventController extends GetxController {
  final serviceRepository = ServiceRepository();
  late ServiceDetailModel serviceDetail;
  bool isServicesLoading = false;
  bool isCategoriesLoading = false;
  Map<String, dynamic> extraQuery = {};

  List<EventModel> get nearbyEvents => serviceDetail.nearbyEvents ?? [];
  List<EventModel> get featuredEvents => serviceDetail.featuredEvents ?? [];

  final categories = <CategoryModel>[].obs;

  RxInt selectedCategory = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getServiceDetail();
    getCategories();
  }

  void getCategories() async {
    try {
      isCategoriesLoading = true;
      update();
      final categoryData = await EventRepository().getCategories();
      categories.assignAll(categoryData);
      update();
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isCategoriesLoading = false;
      update();
    }
  }

  void selectCategory(int id) {
    selectedCategory.value = id;
    getServiceDetail();
    update();
  }

  void clearCategorFilter() {}

  void getServiceDetail() async {
    isServicesLoading = true;
    update();
    final serviceId = Get.find<BookingController>().selectedServiceId;
    serviceDetail = await serviceRepository.getServiceById(
      id: serviceId,
      extraQuery: selectedCategory.value != 0
          ? {
              "event_category_id": selectedCategory.value,
            }
          : null,
    );
    isServicesLoading = false;
    update();
  }
}
