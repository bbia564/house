import 'package:get/get.dart';

import 'house_first_logic.dart';

class HouseFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HouseFirstLogic());
  }
}
