import 'package:get/get.dart';

import 'target_details_logic.dart';

class TargetDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TargetDetailsLogic());
  }
}
