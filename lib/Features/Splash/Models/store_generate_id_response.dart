import 'dart:convert';

class GuestIdResponseModel {
  final String? message;
  final Guest? guest;

  GuestIdResponseModel({
    this.message,
    this.guest,
  });

  factory GuestIdResponseModel.fromRawJson(String str) =>
      GuestIdResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GuestIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GuestIdResponseModel(
        message: json["message"],
        guest: json["guest"] == null ? null : Guest.fromJson(json["guest"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "guest": guest?.toJson(),
      };
}

class Guest {
  final String? macAddress;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Guest({
    this.macAddress,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Guest.fromRawJson(String str) => Guest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        macAddress: json["mac_address"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "mac_address": macAddress,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
