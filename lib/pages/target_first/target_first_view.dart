import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_target/pages/target_first/target_item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'target_first_logic.dart';

class TargetFirstPage extends GetView<TargetFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'My target',
        style: TextStyle(color: Colors.white),
      )),
      body: SafeArea(
          child: <Widget>[
        const Icon(
          Icons.flag,
          size: 20,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(() {
          return Expanded(
            child: controller.list.value.isEmpty
                ? Align(
                    alignment: Alignment.center,
                    child: <Widget>[
                      Image.asset(
                        'assets/noData.webp',
                        width: 52,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'No data',
                        style: TextStyle(color: Colors.white),
                      )
                    ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.list.value.length,
                    itemBuilder: (_, index) {
                      final entity = controller.list.value[index];
                      return TargetItem(entity, () {
                        controller.doneTarget(entity);
                      }).gestures(onTap: (){
                          Get.toNamed('/targetDetails',arguments: entity)?.then((_) {
                            controller.getData();
                          });
                      });
                    }),
          );
        })
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).marginAll(15)),
    );
  }
}
