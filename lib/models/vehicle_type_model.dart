class VehicleTypeModel {
  int? id;
  String? name;

  VehicleTypeModel({this.id, this.name});

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) {
    return VehicleTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
