import 'package:get/get.dart';

import '../house_first/house_first_logic.dart';
import '../house_second/house_second_logic.dart';
import 'house_tab_logic.dart';

class HouseTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HouseTabLogic());
    Get.lazyPut(() => HouseFirstLogic());
    Get.lazyPut(() => HouseSecondLogic());
  }
}
