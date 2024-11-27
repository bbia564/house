import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house/main.dart';
import 'package:my_house/pages/house_first/house_list/house_item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'house_list_logic.dart';

class HouseListPage extends GetView<HouseListLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My house'),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.add,
            size: 30,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/add_house')?.then((_) {
              controller.getData();
            });
          })
        ],
      ),
      body: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding:const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return HouseItem(entity, () {
                    Get.toNamed('/add_house', arguments: entity)
                        ?.then((_) {
                      controller.getData();
                    });
                  });
                });
      }),
    );
  }
}
