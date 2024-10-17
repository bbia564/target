import 'package:get/get.dart';

import 'target_second_logic.dart';

class TargetSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TargetSecondLogic());
  }
}
