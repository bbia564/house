import 'package:get/get.dart';

import 'add_tenant_logic.dart';

class AddTenantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTenantLogic());
  }
}
