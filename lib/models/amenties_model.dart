class AmenitiesModel {
  int? id;
  String? name;
  String? status;

  AmenitiesModel({
    this.id,
    this.name,
    this.status,
  });

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) {
    return AmenitiesModel(
      id: json['id']?.toInt(),
      name: json['name'],
      status: json['status']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }
}
