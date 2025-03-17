import 'package:taxi_booking/models/category_model.dart';

import '../../main.dart';
import '../../models/event_model.dart';
import '../../utils/Common.dart';

class EventRepository {
  Future<List<EventModel>> getEvents() async {
    final response = await networkRepository.get(url: "/get-event-list");
    final data = response.data["data"];
    return parseList(data, EventModel.fromJson);
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await networkRepository.get(url: "/user/categories");
    final data = response.data["categories"];
    return parseList(data, CategoryModel.fromJson);
  }
}
