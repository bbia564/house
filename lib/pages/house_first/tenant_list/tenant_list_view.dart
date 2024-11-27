import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import 'tenant_list_logic.dart';

class TenantListPage extends GetView<TenantListLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My tenant'),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.add,
            size: 30,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/add_tenant')?.then((_) {
              controller.getData();
            });
          })
        ],
      ),
      body: SafeArea(child: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      <Widget>[
                        Expanded(
                            child: Text(
                          entity.name,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('Room number: ${entity.houseId}')
                      ].toRow(),
                      const SizedBox(
                        height: 10,
                      ),
                      <Widget>[
                        Icon(
                          Icons.phone,
                          size: 25,
                          color: primaryColor,
                        ),
                        Text(entity.phone)
                      ].toRow()
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)).marginOnly(bottom: 10);
                });
      })),
    );
  }
}
