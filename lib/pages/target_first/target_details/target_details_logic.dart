import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_target/db_target/db_target.dart';
import 'package:my_target/db_target/target_entity.dart';

class TargetDetailsLogic extends GetxController {

  DBTarget dbTarget = Get.find<DBTarget>();

  TargetEntity? result = Get.arguments;

  void doneTarget(TargetEntity entity) async {
    final timeEntity = TimeEntity(tapTime: DateTime.now());
    entity.list.add(timeEntity);
    await dbTarget.updateTarget(entity);
    update();
    Fluttertoast.showToast(msg: 'Success');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }

}
