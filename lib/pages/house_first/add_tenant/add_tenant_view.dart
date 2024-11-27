import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import '../add_house/house_text_field.dart';
import 'add_tenant_logic.dart';

class AddTenantPage extends GetView<AddTenantLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add tenant'),
        backgroundColor: Colors.white,
        actions: [
          Text(
            'Commit',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.commit();
          })
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<AddTenantLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: HouseTextField(
                        maxLength: 12,
                        value: controller.name,
                        onChange: (value) {
                          controller.name = value;
                        }),
                  ).decorated(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Phone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: HouseTextField(
                        isInteger: true,
                        maxLength: 16,
                        value: controller.phone,
                        onChange: (value) {
                          controller.phone = value;
                        }),
                  ).decorated(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select house',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    child: <Widget>[
                      Expanded(
                          child: IgnorePointer(
                        child: HouseTextField(
                          hintText: 'Select',
                            value:  controller.houseEntity != null ? 'Room number: ${controller.houseEntity?.houseId}' :
                                '',
                            onChange: (value) {}),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.black,
                      )
                    ].toRow(),
                  )
                      .decorated(
                          color: const Color(0xfffcfcfc),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(10))
                      .gestures(onTap: () {
                        controller.showHouses(context);
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15),
      )),
    );
  }
}
