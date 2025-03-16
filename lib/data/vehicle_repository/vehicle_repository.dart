import '../../main.dart';
import '../../models/vehicle_type_model.dart';
import '../../utils/Common.dart';

class VehicleRepository {
  Future<List<VehicleTypeModel>> getVehicleTypes() async {
    final response = await networkRepository.get(url: "/get-vehicle-types");
    final data = response.data["data"];
    return parseList(data, VehicleTypeModel.fromJson);
  }
}
