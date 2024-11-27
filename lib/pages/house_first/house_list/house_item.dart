import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house/db_house/house_entity.dart';
import 'package:my_house/main.dart';
import 'package:styled_widget/styled_widget.dart';

class HouseItem extends StatelessWidget {
  const HouseItem(this.entity, this.onTap, {Key? key}) : super(key: key);
  final HouseEntity entity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        <Widget>[
          Text('Room number: ${entity.houseId}'),
          Text(
            entity.hadRent == 0 ? 'Unchartered' : 'Leased',
            style: TextStyle(color: entity.hadRent == 0 ? Colors.grey : Colors.black),
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
        const SizedBox(height: 10,),
        Text('${entity.area}/㎡'),
        const SizedBox(height: 10,),
        GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 71 / 32),
            itemCount: entity.typeAndEquipments.length,
            itemBuilder: (_, index) {
              final text = entity.typeAndEquipments[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ).decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(8));
            })
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ).decorated(color: Colors.white, borderRadius: BorderRadius.circular(15)).marginOnly(bottom: 10).gestures(onTap: (){
      onTap.call();
    });
  }
}
