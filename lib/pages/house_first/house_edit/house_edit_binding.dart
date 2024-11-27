import 'package:get/get.dart';

import 'house_edit_logic.dart';

class HouseEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
