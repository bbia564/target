import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'target_second_logic.dart';

class TargetSecondPage extends GetView<TargetSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'Privacy agreement', 'About US'];
    return Container(
            width: double.infinity,
            height: 44,
            padding:const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            child: Text(
              titles[index],
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ))
        .decorated(
            color: const Color(0xff333333),
            borderRadius: BorderRadius.circular(12))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanTargetData();
          break;
        case 1:
          controller.aboutTargetPrivacy(context);
          break;
        case 2:
          controller.aboutTargetUS(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            _item(0, context),
            _item(1, context),
            _item(2, context)
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
