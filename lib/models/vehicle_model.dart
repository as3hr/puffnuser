import '../utils/Common.dart';
import 'amenties_model.dart';

class VehicleModel {
  int? id;
  int? vehicleTypeId;
  int? vendorId;
  String? name;
  String? model;
  String? color;
  String? numberPlate;
  String? productionYear;
  String? flatRate;
  String? perMileRate;
  int? noOfPassenger;
  int? noOfSuitcase;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<AmenitiesModel>? amenities;
  List<dynamic>? availabilities;

  VehicleModel({
    this.id,
    this.vehicleTypeId,
    this.vendorId,
    this.name,
    this.model,
    this.color,
    this.numberPlate,
    this.productionYear,
    this.flatRate,
    this.perMileRate,
    this.noOfPassenger,
    this.noOfSuitcase,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.amenities,
    this.availabilities,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id']?.toInt(),
      vehicleTypeId: json['vehicle_type_id']?.toInt(),
      vendorId: json['vendor_id']?.toInt(),
      name: json['name'],
      model: json['model'],
      color: json['color'],
      numberPlate: json['number_plate'],
      productionYear: json['production_year'],
      flatRate: json['flat_rate'],
      perMileRate: json['per_mile_rate'],
      noOfPassenger: json['no_of_passenger']?.toInt(),
      noOfSuitcase: json['no_of_suitcase']?.toInt(),
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      amenities: parseList(json['amenities'], AmenitiesModel.fromJson),
      availabilities: json['availabilities'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_type_id': vehicleTypeId,
      'vendor_id': vendorId,
      'name': name,
      'model': model,
      'color': color,
      'number_plate': numberPlate,
      'production_year': productionYear,
      'flat_rate': flatRate,
      'per_mile_rate': perMileRate,
      'no_of_passenger': noOfPassenger,
      'no_of_suitcase': noOfSuitcase,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'amenities': amenities?.map((e) => e.id).toList(),
      'availabilities': availabilities,
    };
  }
}
