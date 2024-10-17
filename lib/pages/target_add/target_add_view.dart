import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_target/main.dart';
import 'package:my_target/pages/target_add/target_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'target_add_logic.dart';

class TargetAddPage extends GetView<TargetAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add target',
          style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: <Widget>[
                const Text(
                  'Target name',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 48,
                  child: TargetTextField(
                      maxLength: 20,
                      hintText: 'Enter name',
                      textStyle: const TextStyle(color: Colors.white),
                      value: controller.title,
                      onChange: (value) {
                        controller.title = value;
                      }),
                ).decorated(
                    color: const Color(0xff262626),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff656565))),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Target introduce',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 48,
                  child: TargetTextField(
                      maxLength: 20,
                      hintText: 'Enter introduce',
                      textStyle: const TextStyle(color: Colors.white),
                      value: controller.content,
                      onChange: (value) {
                        controller.content = value;
                      }),
                ).decorated(
                    color: const Color(0xff262626),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xff656565))),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  child: GetBuilder<TargetAddLogic>(builder: (_) {
                    return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, mainAxisSpacing: 10),
                        itemCount: itemColors.length,
                        itemBuilder: (_, index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                            ).decorated(
                                color: itemColors[index],
                                borderRadius: BorderRadius.circular(17.5)),
                          )
                              .decorated(
                                  border: Border.all(
                                      color: index == controller.selectedIndex
                                          ? itemColors[index]
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(20))
                              .gestures(onTap: () {
                            controller.selectedIndex = index;
                            controller.update();
                          });
                        });
                  }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  child:const Text(
                    'Commit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
                    .decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12))
                    .gestures(onTap: () {
                      controller.addTarget();
                })
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
            ).decorated(
                color: const Color(0xff333333),
                borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
