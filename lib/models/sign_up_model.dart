import 'package:image_picker/image_picker.dart';

import 'amenties_model.dart';

class SignUpModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  String userName;
  String userType = "individual";
  String address;
  String vehicleName;
  String vehicleModel;
  String productionYear;
  String vehicleColor;
  String numberPlate;
  String vehicleType;
  String serviceId;
  String flatRate;
  String perMileRate;
  String noOfSuitCases;
  String noOfPassengers;
  XFile? driverLicense;
  XFile? vehicleLicense;
  List<XFile>? files;
  List<AmenitiesModel> ameneties;

  SignUpModel({
    this.firstName = "",
    this.lastName = "",
    this.email = "",
    this.phoneNumber = "",
    this.password = "",
    this.userName = "",
    this.address = "",
    this.vehicleName = "",
    this.vehicleModel = "",
    this.productionYear = "",
    this.vehicleColor = "",
    this.numberPlate = "",
    this.vehicleType = "",
    this.serviceId = "",
    this.flatRate = "",
    this.perMileRate = "",
    this.noOfSuitCases = "",
    this.noOfPassengers = "",
    this.driverLicense,
    this.vehicleLicense,
    this.files,
    List<int>? ameneties,
  }) : ameneties = [];

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "contact_number": phoneNumber,
      "password": password,
      "username": userName,
      "user_type": userType,
      "address": address,
      "vehicle_name": vehicleName,
      "vehicle_model": vehicleModel,
      "production_year": productionYear,
      "vehicle_color": vehicleColor,
      "number_plate": numberPlate,
      "vehicle_type_id": vehicleType,
      "service_id": serviceId,
      "flat_rate": flatRate,
      "per_mile_rate": perMileRate,
      "no_of_suitcase": noOfSuitCases,
      "no_of_passenger": noOfPassengers,
      "driver_license": driverLicense,
      "vehicle_registration": vehicleLicense,
      "amenities": ameneties.map((e) => e.id).toList(),
      "images": files?.map((e) => e).toList(),
    };
  }
}
