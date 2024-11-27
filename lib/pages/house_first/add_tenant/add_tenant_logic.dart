import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_house/db_house/db_house.dart';
import 'package:my_house/db_house/house_entity.dart';
import 'package:my_house/main.dart';
import 'package:styled_widget/styled_widget.dart';

import '../house_list/house_item.dart';

class AddTenantLogic extends GetxController {
  DBHouse dbHouse = Get.find<DBHouse>();

  String name = '';
  String phone = '';
  HouseEntity? houseEntity;

  List<HouseEntity> houses = [];

  void showHouses(BuildContext context) {
    Get.bottomSheet(Container(
      width: double.infinity,
      height: 350,
      child: SafeArea(
          child: houses.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: houses.length,
                  itemBuilder: (_, index) {
                    final entity = houses[index];
                    return HouseItem(entity, () {
                      houseEntity = entity;
                      Get.back();
                      update();
                    });
                  })),
    ).decorated(
        color: bgColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))));
  }

  void commit() async {
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter name');
      return;
    }
    if (phone.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter phone');
      return;
    }
    if (houseEntity == null) {
      Fluttertoast.showToast(msg: 'Select house');
      return;
    }
    final tenant = Tenant(
        id: 0,
        createdTime: DateTime.now(),
        houseId: houseEntity!.id,
        name: name,
        phone: phone,
        bindId: houseEntity!.id);
    await dbHouse.insertTenant(tenant);
    houseEntity?.hadRent = 1;
    await dbHouse.updateHouse(houseEntity!);
    Fluttertoast.showToast(msg: 'Success');
    Get.back();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    houses = await dbHouse.getHouseAllData();
    super.onInit();
  }
}
