import 'package:get/get.dart';

import 'target_first_logic.dart';

class TargetFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TargetFirstLogic());
  }
}
