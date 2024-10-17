import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_target/pages/target_first/target_item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'target_details_logic.dart';

class TargetDetailsPage extends GetView<TargetDetailsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: GetBuilder<TargetDetailsLogic>(builder: (_) {
        return SafeArea(
          child: <Widget>[
            TargetItem(controller.result!, () {
              controller.doneTarget(controller.result!);
            }),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: controller.result!.list.isEmpty
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
                      itemCount: controller.result!.list.length,
                      itemBuilder: (_, index) {
                        final entity = controller.result!.list[index];
                        return <Widget>[
                          <Widget>[
                            Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              entity.tapTimeStr,
                              style: const TextStyle(
                                  color: Color(0xff919191), fontSize: 12),
                            )
                          ].toRow(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween),
                          const Divider(height: 25, color: Color(0xff404040),)
                        ].toColumn();
                      }),
                ).decorated(
                    color: const Color(0xff333333),
                    borderRadius: BorderRadius.circular(12)))
          ].toColumn().marginAll(15),
        );
      }),
    );
  }
}
