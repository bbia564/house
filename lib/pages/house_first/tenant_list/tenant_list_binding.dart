import 'package:get/get.dart';

import 'tenant_list_logic.dart';

class TenantListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TenantListLogic());
  }
}
