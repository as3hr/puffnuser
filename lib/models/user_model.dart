class UserModel {
  int? id;
  int? organizationId;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;
  String? username;
  String? contactNumber;
  String? gender;
  String? emailVerifiedAt;
  String? address;
  String? userType;
  String? playerId;
  int? serviceId;
  int? fleetId;
  double? latitude;
  double? longitude;
  String? lastNotificationSeen;
  String? status;
  int? isOnline;
  int? isAvailable;
  int? isVerifiedDriver;
  String? uid;
  String? fcmToken;
  String? displayName;
  String? loginType;
  String? timezone;
  String? lastLocationUpdateAt;
  String? createdAt;
  String? updatedAt;
  String? provider;
  String? providerId;

  UserModel({
    this.id,
    this.organizationId,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
    this.username,
    this.contactNumber,
    this.gender,
    this.emailVerifiedAt,
    this.address,
    this.userType,
    this.playerId,
    this.serviceId,
    this.fleetId,
    this.latitude,
    this.longitude,
    this.lastNotificationSeen,
    this.status,
    this.isOnline,
    this.isAvailable,
    this.isVerifiedDriver,
    this.uid,
    this.fcmToken,
    this.displayName,
    this.loginType,
    this.timezone,
    this.lastLocationUpdateAt,
    this.createdAt,
    this.updatedAt,
    this.provider,
    this.providerId,
  });

  factory UserModel.empty() {
    return UserModel(
      id: 0,
      organizationId: 0,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toInt(),
      organizationId: json['organization_id']?.toInt(),
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      profileImage: json['profile_image'],
      username: json['username'],
      contactNumber: json['contact_number'],
      gender: json['gender'],
      emailVerifiedAt: json['email_verified_at'],
      address: json['address'],
      userType: json['user_type'],
      playerId: json['player_id'],
      serviceId: json['service_id']?.toInt(),
      fleetId: json['fleet_id']?.toInt(),
      latitude: _parseDouble(json['latitude']),
      longitude: _parseDouble(json['longitude']),
      lastNotificationSeen: json['last_notification_seen'],
      status: json['status'],
      isOnline: json['is_online']?.toInt(),
      isAvailable: json['is_available']?.toInt(),
      isVerifiedDriver: json['is_verified_driver']?.toInt(),
      uid: json['uid'],
      fcmToken: json['fcm_token'],
      displayName: json['display_name'],
      loginType: json['login_type'],
      timezone: json['timezone'],
      lastLocationUpdateAt: json['last_location_update_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      provider: json['provider'],
      providerId: json['provider_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organization_id': organizationId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'profile_image': profileImage,
      'username': username,
      'contact_number': contactNumber,
      'gender': gender,
      'email_verified_at': emailVerifiedAt,
      'address': address,
      'user_type': userType,
      'player_id': playerId,
      'service_id': serviceId,
      'fleet_id': fleetId,
      'latitude': latitude,
      'longitude': longitude,
      'last_notification_seen': lastNotificationSeen,
      'status': status,
      'is_online': isOnline,
      'is_available': isAvailable,
      'is_verified_driver': isVerifiedDriver,
      'uid': uid,
      'fcm_token': fcmToken,
      'display_name': displayName,
      'login_type': loginType,
      'timezone': timezone,
      'last_location_update_at': lastLocationUpdateAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'provider': provider,
      'provider_id': providerId,
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
