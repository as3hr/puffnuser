import '../../main.dart';
import '../../models/event_model.dart';
import '../../utils/Common.dart';

class EventRepository {
  Future<List<EventModel>> getEvents() async {
    final response = await networkRepository.get(url: "/get-event-list");
    final data = response.data["data"];
    return parseList(data, EventModel.fromJson);
  }
}
