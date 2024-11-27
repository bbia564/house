import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'house_first_logic.dart';

class HouseFirstPage extends GetView<HouseFirstLogic> {
  Widget _item(int index) {
    final titles = ['My house', 'My tenant'];
    final images = ['assets/icon2.webp', 'assets/icon1.webp'];
    return Expanded(
        child: Container(
      height: 154,
      child: <Widget>[
        Image.asset(
          images[index],
          width: 54,
          height: 54,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(titles[index])
      ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
    )
            .decorated(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(colors: [
                  index == 0
                      ? const Color(0xffeaf5ff)
                      : const Color(0xffeaffec),
                  const Color(0xffffffff)
                ]))
            .gestures(onTap: () {
      if (index == 0) {
        Get.toNamed('/house_list');
      } else {
        Get.toNamed('/tenant_list');
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
        ).decorated(
            gradient: const LinearGradient(
                colors: [Color(0xfff8efed), Color(0xfff7f7f7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        SafeArea(
            child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              <Widget>[
                <Widget>[
                  const Text(
                    'Rental assistant',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Manage your house',
                    style: TextStyle(fontSize: 14),
                  )
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                Image.asset(
                  'assets/icon0.webp',
                  width: 129,
                  height: 132,
                  fit: BoxFit.cover,
                )
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
              const SizedBox(
                height: 10,
              ),
              <Widget>[
                _item(0),
                const SizedBox(
                  width: 10,
                ),
                _item(1)
              ].toRow()
            ].toColumn(),
          ).marginAll(15),
        ))
      ],
    );
  }
}
