class ServiceModel {
  int? id;
  String? title;
  String? type;

  ServiceModel({
    this.id,
    this.title,
    this.type,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id']?.toInt(),
      title: json['title'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
    };
  }
}
