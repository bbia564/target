import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_target/main.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_target/target_entity.dart';

class TargetItem extends StatelessWidget {
  const TargetItem(this.entity, this.doneClick, {Key? key}) : super(key: key);
  final TargetEntity entity;
  final VoidCallback doneClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        <Widget>[
          Icon(
            Icons.flag,
            size: 20,
            color: itemColors[entity.colorType],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: <Widget>[
            Text(
              entity.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              entity.title,
              style:
                  TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 13),
            )
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 36,
            padding:const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: const Text(
              'Complete once',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          )
              .decorated(
                  color: itemColors[entity.colorType],
                  borderRadius: BorderRadius.circular(18))
              .gestures(onTap: () {
            doneClick();
          })
        ].toRow(),
        const SizedBox(height: 10,),
        SizedBox(
          height: 80,
          child: GridView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: entity.list.length,
              itemBuilder: (_, index) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                ).decorated(
                    color: itemColors[entity.colorType],
                    borderRadius: BorderRadius.circular(5));
              }),
        )
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ).decorated(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(12)).marginOnly(bottom: 10);
  }
}
