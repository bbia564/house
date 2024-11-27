import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house/pages/house_first/house_first_view.dart';
import 'package:my_house/pages/house_second/house_second_view.dart';

import '../../main.dart';
import 'house_tab_logic.dart';

class HouseTabPage extends GetView<HouseTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          HouseFirstPage(),
          HouseSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navHouseBars()),
    );
  }

  Widget _navHouseBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
