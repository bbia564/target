import 'package:get/get.dart';

import 'target_pool_logic.dart';

class TargetPoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
