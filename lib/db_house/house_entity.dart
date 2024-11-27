import 'package:my_house/main.dart';

class HouseEntity {
  int id;
  DateTime createdTime;
  int houseId;
  double area;
  int type;
  String equipments;
  int hadRent;

  HouseEntity(
      {required this.id,
      required this.createdTime,
      required this.houseId,
      required this.area,
      required this.type,
      required this.equipments,
      required this.hadRent});

  factory HouseEntity.fromJson(Map<String, dynamic> json) {
    return HouseEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      houseId: json['houseId'],
      area: json['area'],
      type: json['type'],
      equipments: json['equipments'],
      hadRent: json['hadRent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'houseId': houseId,
      'area': area,
      'type': type,
      'equipments': equipments,
      'hadRent': hadRent,
    };
  }

  List<String> get typeAndEquipments {
    var list = <String>[];
    list.add(types[type]);
    list.addAll(equipments.split(','));
    return list;
  }
}

class Tenant {
  int id;
  DateTime createdTime;
  String name;
  String phone;
  int bindId;
  int houseId;

  Tenant(
      {required this.id,
      required this.createdTime,
      required this.name,
      required this.phone,
      required this.bindId,
      required this.houseId});

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      name: json['name'],
      phone: json['phone'],
      bindId: json['bindId'],
      houseId: json['houseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'name': name,
      'phone': phone,
      'bindId': bindId,
      'houseId': houseId,
    };
  }
}
