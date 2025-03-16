class SnackModel {
  int? id;
  String? name;
  int? status;

  SnackModel({
    this.id,
    this.name,
    this.status,
  });

  factory SnackModel.fromJson(Map<String, dynamic> json) {
    return SnackModel(
      id: json['id']?.toInt(),
      name: json['name'],
      status: json['status']?.toInt(),
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
