import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house/main.dart';
import 'package:my_house/pages/house_first/add_house/house_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'add_house_logic.dart';

class AddHousePage extends GetView<AddHouseLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add house'),
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
        child: GetBuilder<AddHouseLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Room number',
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
                        maxLength: 10,
                        value: controller.houseId == 0
                            ? ''
                            : controller.houseId.toString(),
                        onChange: (value) {
                          if (value.isEmpty) {
                            controller.houseId = 0;
                          } else {
                            controller.houseId = int.parse(value);
                          }
                        }),
                  ).decorated(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Area',
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
                          child: HouseTextField(
                              isInteger: true,
                              maxLength: 10,
                              value: controller.area == 0
                                  ? ''
                                  : controller.area.toString(),
                              onChange: (value) {
                                if (value.isEmpty) {
                                  controller.area = 0;
                                } else {
                                  controller.area = double.parse(value);
                                }
                              })),
                      const SizedBox(width: 10,),
                      const Text('㎡').marginOnly(right: 10)
                    ].toRow(),
                  ).decorated(
                      color: const Color(0xfffcfcfc),
                      border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10))
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 149 / 55),
                      itemCount: types.length,
                      itemBuilder: (_, index) {
                        final text = types[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                            .decorated(
                                color: index == controller.type
                                    ? primaryColor
                                    : Colors.grey[400],
                                borderRadius: BorderRadius.circular(8))
                            .gestures(onTap: () {
                          controller.type = index;
                          controller.update();
                        });
                      })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: <Widget>[
                  const Text(
                    'Building equipment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 99 / 55),
                      itemCount: equipments.length,
                      itemBuilder: (_, index) {
                        final text = equipments[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          child: Text(
                            text,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                            .decorated(
                                color: controller.equipments.contains(text)
                                    ? primaryColor
                                    : Colors.grey[400],
                                borderRadius: BorderRadius.circular(8))
                            .gestures(onTap: () {
                          if (controller.equipments.contains(text)) {
                            controller.equipments.remove(text);
                            controller.update();
                          } else {
                            controller.equipments.add(text);
                            controller.update();
                          }
                        });
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
