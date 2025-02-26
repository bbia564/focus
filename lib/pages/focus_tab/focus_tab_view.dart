import 'package:flutter/material.dart';
import 'package:focus_mode/pages/focus_add/focus_add_view.dart';
import 'package:focus_mode/pages/focus_first/focus_first_logic.dart';
import 'package:focus_mode/pages/focus_first/focus_first_view.dart';
import 'package:focus_mode/pages/focus_second/focus_second_view.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'focus_tab_logic.dart';

class FocusTabPage extends GetView<FocusTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          FocusFirstPage(),
          FocusAddPage(),
          FocusSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navFoBars()),
    );
  }

  Widget _navFoBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/focusAdd')?.then((_) {
              FocusFirstLogic firstLogic = Get.find();
              firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
