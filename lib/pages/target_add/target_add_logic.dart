import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_target/db_target/db_target.dart';
import 'package:my_target/db_target/target_entity.dart';

class TargetAddLogic extends GetxController {
  DBTarget dbTarget = Get.find<DBTarget>();

  String title = '';
  String content = '';

  int selectedIndex = 0;

  void addTarget() async {
    if (title.isEmpty || content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a title and content');
      return;
    }
    TargetEntity entity = TargetEntity(
        id: 0,
        createTime: DateTime.now(),
        title: title,
        content: content,
        colorType: selectedIndex,
        list: []);
    await dbTarget.insertTarget(entity);
    Get.back();
  }
}
