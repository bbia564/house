import 'package:get/get.dart';

import 'house_list_logic.dart';

class HouseListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HouseListLogic());
  }
}
