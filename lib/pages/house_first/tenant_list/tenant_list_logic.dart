import 'package:get/get.dart';
import 'package:my_house/db_house/db_house.dart';

import '../../../db_house/house_entity.dart';

class TenantListLogic extends GetxController {

  DBHouse dbHouse = Get.find<DBHouse>();

  var list = <Tenant>[].obs;

  void getData() async {
    list.value = await dbHouse.getTenantAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
