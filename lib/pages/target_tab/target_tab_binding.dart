import 'package:get/get.dart';

import '../target_first/target_first_logic.dart';
import '../target_second/target_second_logic.dart';
import 'target_tab_logic.dart';

class TargetTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TargetTabLogic());
    Get.lazyPut(() => TargetFirstLogic());
    Get.lazyPut(() => TargetSecondLogic());
  }
}
