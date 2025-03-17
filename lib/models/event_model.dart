import 'package:taxi_booking/models/ticket_model.dart';

class EventModel {
  int? id;
  int? newServiceId;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  int? eventCategoryId;
  String? address;
  double? latitude;
  double? longitude;
  String? image;
  int? isFeature;
  TicketModel? ticket;

  EventModel({
    this.ticket,
    this.id,
    this.newServiceId,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.eventCategoryId,
    this.address,
    this.latitude,
    this.longitude,
    this.image,
    this.isFeature,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id']?.toInt(),
      newServiceId: json['new_service_id']?.toInt(),
      title: json['title'],
      description: json['description'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      eventCategoryId: json['event_category_id']?.toInt(),
      address: json['address'],
      latitude: _parseDouble(json['latitude']),
      longitude: _parseDouble(json['longitude']),
      image: json['image'],
      isFeature: json['is_feature']?.toInt(),
      ticket:
          json["ticket"] != null ? TicketModel.fromJson(json["ticket"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'new_service_id': newServiceId,
      'title': title,
      'description': description,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
      'event_category_id': eventCategoryId,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'is_feature': isFeature,
    };
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
