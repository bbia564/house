import 'package:get/get.dart';
import 'package:my_house/db_house/db_house.dart';
import 'package:my_house/db_house/house_entity.dart';

class HouseListLogic extends GetxController {

  DBHouse dbHouse = Get.find<DBHouse>();

  var list = <HouseEntity>[].obs;

  void getData() async {
    list.value = await dbHouse.getHouseAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
