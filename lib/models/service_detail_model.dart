import '../utils/Common.dart';
import 'amenties_model.dart';
import 'event_model.dart';
import 'service_model.dart';
import 'snack_model.dart';
import 'vehicle_model.dart';

class ServiceDetailModel {
  List<ServiceModel>? service;
  List<EventModel>? allEvents;
  List<EventModel>? featuredEvents;
  List<EventModel>? nearbyEvents;
  List<VehicleModel>? vehicles;
  List<AmenitiesModel>? amenities;
  List<SnackModel>? snacks;

  ServiceDetailModel({
    this.service,
    this.allEvents,
    this.featuredEvents,
    this.nearbyEvents,
    this.vehicles,
    this.amenities,
    this.snacks,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> json) {
    return ServiceDetailModel(
      service: parseList(json['service'], ServiceModel.fromJson),
      allEvents: parseList(json['all_events'], EventModel.fromJson),
      featuredEvents: parseList(json['featured_events'], EventModel.fromJson),
      nearbyEvents: parseList(json['nearby_events'], EventModel.fromJson),
      vehicles: parseList(json['vehicles'], VehicleModel.fromJson),
      amenities: parseList(json['amenities'], AmenitiesModel.fromJson),
      snacks: parseList(json['snacks'], SnackModel.fromJson),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service': service?.map((e) => e.toJson()).toList(),
      'all_events': allEvents?.map((e) => e.toJson()).toList(),
      'featured_events': featuredEvents?.map((e) => e.toJson()).toList(),
      'nearby_events': nearbyEvents?.map((e) => e.toJson()).toList(),
      'vehicles': vehicles?.map((e) => e.toJson()).toList(),
      'amenities': amenities?.map((e) => e.toJson()).toList(),
      'snacks': snacks?.map((e) => e.toJson()).toList(),
    };
  }
}
