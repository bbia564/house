import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_house/db_house/db_house.dart';
import 'package:my_house/db_house/house_entity.dart';

class AddHouseLogic extends GetxController {

  HouseEntity? houseEntity = Get.arguments;

  DBHouse dbHouse = Get.find<DBHouse>();

  int houseId = 0;
  double area = 0;
  int type = 0;
  List<String> equipments = [];

  void commit() async {
    if (houseId == 0) {
      Fluttertoast.showToast(msg: 'Room number can not be empty');
      return;
    }
    if (area == 0) {
      Fluttertoast.showToast(msg: 'Area can not be empty');
      return;
    }
    if (equipments.isEmpty) {
      Fluttertoast.showToast(msg: 'Equipment can not be empty');
      return;
    }
    if (houseEntity == null) {
      HouseEntity entity = HouseEntity(
        id: 0,
        createdTime: DateTime.now(),
        houseId: houseId,
        area: area,
        type: type,
        equipments: equipments.join(','),
        hadRent: 0,
      );
      await dbHouse.insertHouse(entity);
    } else {
      HouseEntity entity = HouseEntity(
        id: houseEntity!.id,
        createdTime: houseEntity!.createdTime,
        houseId: houseId,
        area: area,
        type: type,
        equipments: equipments.join(','),
        hadRent: houseEntity!.hadRent,
      );
      await dbHouse.updateHouse(entity);
    }
    Fluttertoast.showToast(msg: 'Success');
    Get.back();

  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (houseEntity != null) {
      houseId = houseEntity!.houseId;
      area = houseEntity!.area;
      type = houseEntity!.type;
      equipments = houseEntity!.equipments.split(',');
      update();
    }
    super.onInit();
  }


}
