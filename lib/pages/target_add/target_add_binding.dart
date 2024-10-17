import 'package:get/get.dart';

import 'target_add_logic.dart';

class TargetAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TargetAddLogic());
  }
}
