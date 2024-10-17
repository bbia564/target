import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_target/db_target/db_target.dart';

import '../../db_target/target_entity.dart';

class TargetFirstLogic extends GetxController {
  DBTarget dbTarget = Get.find<DBTarget>();

  var list = <TargetEntity>[].obs;

  void getData() async {
    list.value = await dbTarget.getTargetAllData();
  }

  void doneTarget(TargetEntity entity) async {
    final timeEntity = TimeEntity(tapTime: DateTime.now());
    entity.list.add(timeEntity);
    await dbTarget.updateTarget(entity);
    getData();
    Fluttertoast.showToast(msg: 'Success');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
