import 'package:get/get.dart';

import 'add_house_logic.dart';

class AddHouseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddHouseLogic());
  }
}
