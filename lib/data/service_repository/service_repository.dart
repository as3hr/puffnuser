import '../../main.dart';
import '../../models/service_detail_model.dart';
import '../../models/service_model.dart';
import '../../utils/Common.dart';

class ServiceRepository {
  Future<List<ServiceModel>> getServices() async {
    final response = await networkRepository.get(url: "/get-service-list");
    final data = response.data["data"];
    return parseList(data, ServiceModel.fromJson);
  }

  Future<ServiceDetailModel> getServiceById(
      {required int id, Map<String, dynamic>? extraQuery}) async {
    final response =
        await networkRepository.get(url: "/get-service-details/", extraQuery: {
      "id": id,
      "location": "karachi",
      ...?extraQuery,
    });
    final data = response.data["data"];
    return ServiceDetailModel.fromJson(data);
  }
}
