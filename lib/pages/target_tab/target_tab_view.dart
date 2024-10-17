import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_target/pages/target_add/target_add_view.dart';
import 'package:my_target/pages/target_first/target_first_logic.dart';
import 'package:my_target/pages/target_first/target_first_view.dart';
import 'package:my_target/pages/target_second/target_second_view.dart';

import 'target_tab_logic.dart';

class TargetTabPage extends GetView<TargetTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [TargetFirstPage(), TargetAddPage(), TargetSecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navTrBars()),
    );
  }

  Widget _navTrBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Unselect.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Selected.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add_circle, size: 40, color: Colors.white),
          label: 'Add target',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Unselect.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item1Selected.webp',
            width: 22,
            height: 22,
            fit: BoxFit.cover,
          ),
          label: 'Set',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/targetAdd')?.then((_) {
            TargetFirstLogic targetFirstLogic = Get.find<TargetFirstLogic>();
            targetFirstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
