import 'package:get/get.dart';

import 'house_second_logic.dart';

class HouseSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HouseSecondLogic());
  }
}
